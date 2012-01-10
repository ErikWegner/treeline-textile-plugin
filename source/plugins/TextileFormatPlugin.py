#****************************************************************************
# TextileFormatPlugin.py, provides an textile input style
# Copyright (C) 2010, Erik Wegner
#
# This is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License, either Version 2 or any later
# version.  This program is distributed in the hope that it will be useful,
# but WITTHOUT ANY WARRANTY.  See the included LICENSE file for details.
#*****************************************************************************
"""Textile Format Plugin"""

from PyQt4 import QtCore, QtGui
from configdialog import FieldConfigPage
import treedialogs
import fieldformat
import textile

__author__="Erik Wegner"
__date__ ="$12.10.2010 17:07:22$"

__aboutplugin__ = """Treeline Textile Format Plugin
by Erik Wegner http://ewus.de"""

class TextileFormatPlugin():
    _tpi = None

    def __init__(self, tpi):
        self._tpi = tpi
        self._addFieldType()
        self._addMenuItems()
        self._addNewNodeFormat()

    def _addFieldType(self):
        fieldTypeName = 'Textile'
        fieldTypeClass = TextileFormat
        FieldConfigPage.types.append(fieldTypeName)
        FieldConfigPage.typeTransDict = dict([(_(name), name) for name in FieldConfigPage.types])
        fieldformat.__dict__[fieldTypeName + 'Format'] = fieldTypeClass

    def _addMenuItems(self):
        menu = self._tpi.getPulldownMenu(-1)
        aboutAction = QtGui.QAction(_('About Textile Plugin'), self._tpi.mainWin)
        menu.addAction(aboutAction)
        self._tpi.mainWin.connect(aboutAction, QtCore.SIGNAL('triggered()'),
                     self.aboutAction)

    def aboutAction(self):
        """Show loaded plugin modules"""
        dlg = AboutTextilePluginDialog(self._tpi.mainWin)
        dlg.exec_()

    def _addNewNodeFormat(self):
        formatName = 'Textile'
        fieldName = 'Text'
        self._tpi.newNodeFormat(formatName)
        self._tpi.addNewFormatField(formatName, fieldName, 'Textile')
        self._tpi.setFormatFieldNumLines(formatName, fieldName, 25)
        self._tpi.setOutputFormatLines(formatName, ['{*Name*}','{*Text*}'])

class TextileFormat(fieldformat.TextFormat):
    typeName = 'Textile'

    def formatOutput(self, storedText, titleMode, internal=False):
        """Return formatted text, properly escaped if not in titleMode"""
        prefix = self.prefix
        suffix = self.suffix
        text = storedText
        if not titleMode:
            #text = "The *great* escape from level %s." % self.parentLevel
            head_offset = 0
            text = textile.textile(text, head_offset = 0).replace("\t", "")
            if text.startswith("<p>"):
                text = text[3:]
            if text.endswith("</p>"):
                text = text[:-4]
        return u'%s%s%s' % (prefix, text, suffix)

class AboutTextilePluginDialog(QtGui.QDialog):
    """Dialog to show copyright and licence"""
    def __init__(self, plugins, parent=None):
        QtGui.QDialog.__init__(self, parent)
        self.setWindowFlags(treedialogs.stdWinFlags)
        self.setWindowTitle(_('Textile Plugin'))

        topLayout = QtGui.QVBoxLayout(self)

        pluginText = QtGui.QLabel(__aboutplugin__)
        topLayout.addWidget(pluginText)

        label = QtGui.QLabel(_('Textile for Python'))
        topLayout.addWidget(label)

        copyrightText = QtGui.QLabel(textile.functions.__copyright__)
        topLayout.addWidget(copyrightText)

        licenceText = QtGui.QLabel(textile.functions.__license__)
        topLayout.addWidget(licenceText)


        ctrlLayout = QtGui.QHBoxLayout()
        topLayout.addLayout(ctrlLayout)
        ctrlLayout.addStretch(0)
        okButton = QtGui.QPushButton(_('&OK'))
        okButton.setAutoDefault(False)
        ctrlLayout.addWidget(okButton)
        self.connect(okButton, QtCore.SIGNAL('clicked()'), self,
                     QtCore.SLOT('accept()'))


def main(tpi):
    ttfp = TextileFormatPlugin(tpi)
    return ttfp
