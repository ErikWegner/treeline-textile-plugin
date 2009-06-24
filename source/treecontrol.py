#!/usr/bin/env python

#****************************************************************************
# treecontrol.py, provides a class for control of the main windows
#
# TreeLine, an information storage program
# Copyright (C) 2009, Douglas W. Bell
#
# This is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License, either Version 2 or any later
# version.  This program is distributed in the hope that it will be useful,
# but WITTHOUT ANY WARRANTY.  See the included LICENSE file for details.
#****************************************************************************

import sys
import os.path
from PyQt4 import QtCore, QtGui
try:
    from __main__ import __version__, iconPath
except ImportError:
    __version__ = '??'
    iconPath = None
import globalref
import treemainwin
import option
import optiondefaults
import icondict


class TreeControl(object):
    """Program and main window control"""
    def __init__(self, userStyle):
        self.windowList = []
        mainVersion = '.'.join(__version__.split('.')[:2])
        globalref.options = option.Option(u'treeline-%s' % mainVersion, 21)
        globalref.options.loadAll(optiondefaults.defaultOutput())
        iconPathList = [iconPath, os.path.join(globalref.modPath, u'icons/'),
                        os.path.join(globalref.modPath, u'../icons/')]
        if not iconPath:
            del iconPathList[0]
        globalref.treeIcons = icondict.IconDict()
        globalref.treeIcons.addIconPath([os.path.join(path, u'tree') for path
                                         in iconPathList])
        globalref.treeIcons.addIconPath([globalref.options.iconPath])
        treemainwin.TreeMainWin.toolIcons = icondict.IconDict()
        treemainwin.TreeMainWin.toolIcons.\
                    addIconPath([os.path.join(path, u'toolbar')
                                 for path in iconPathList],
                                [u'', u'32x32', u'16x16'])
        treemainwin.TreeMainWin.toolIcons.loadAllIcons()
        windowIcon = globalref.treeIcons.getIcon(u'treeline')
        if windowIcon:
            QtGui.QApplication.setWindowIcon(windowIcon)
        if not userStyle:
            if sys.platform.startswith('dar'):
                QtGui.QApplication.setStyle('macintosh')
            elif not sys.platform.startswith('win'):
                QtGui.QApplication.setStyle('plastique')

    def firstWindow(self, fileNames=None):
        """Open first main window"""
        win = treemainwin.TreeMainWin()
        self.windowList.append(win)
        if fileNames:
            win.openFile(unicode(fileNames[0], globalref.localTextEncoding))
        else:
            win.autoOpen()
        win.show()
