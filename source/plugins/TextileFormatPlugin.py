"""Textile Format Plugin"""

from configdialog import FieldConfigPage
import fieldformat
import textile

__author__="Erik Wegner"
__date__ ="$12.10.2010 17:07:22$"

class TextileFormatPlugin():
    _tpi = None

    def __init__(self, tpi):
        self._tpi = tpi
        fieldTypeName = 'Textile'
        fieldTypeClass = TextileFormat
        FieldConfigPage.types.append(fieldTypeName)
        FieldConfigPage.typeTransDict = dict([(_(name), name) for name in FieldConfigPage.types])
        fieldformat.__dict__[fieldTypeName + 'Format'] = fieldTypeClass

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
            text = textile.textile(text, head_offset)
        return u'%s%s%s' % (prefix, text, suffix)

def main(tpi):
    ttfp = TextileFormatPlugin(tpi)
    return ttfp