#!/usr/bin/env python

#****************************************************************************
# optiondefaults.py, provides initial config option values
#
# TreeLine, an information storage program
# Copyright (C) 2006, Douglas W. Bell
#
# This is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License, either Version 2 or any later
# version.  This program is distributed in the hope that it will be useful,
# but WITTHOUT ANY WARRANTY.  See the included LICENSE file for details.
#*****************************************************************************

import globalref

# Limits:
minPrintMargin = 0.1
maxPrintMargin = 3.0
maxNumCol = 9
maxNumLines = 200
maxIndentOffset = 250
maxPrintIndent = 3.0
maxNumToolbars = 20


menuKeyBindList = [(N_('FileNew'),             'Ctrl+N'),
                   (N_('FileOpen'),            'Ctrl+O'),
                   (N_('FileOpenSample'),      ''),
                   (N_('FileSave'),            'Ctrl+S'),
                   (N_('FileSaveAs'),          ''),
                   (N_('FileExport'),          ''),
                   (N_('FilePrintOpt'),        ''),
                   (N_('FilePrintPreview'),    ''),
                   (N_('FilePrint'),           'Ctrl+P'),
                   (N_('FileQuit'),            'Ctrl+Q'),
                   (N_('EditUndo'),            'Ctrl+Z'),
                   (N_('EditRedo'),            'Ctrl+Y'),
                   (N_('EditCut'),             'Ctrl+X'),
                   (N_('EditCopy'),            'Ctrl+C'),
                   (N_('EditCopyText'),        ''),
                   (N_('EditPaste'),           'Ctrl+V'),
                   (N_('EditPasteText'),       ''),
                   (N_('EditRename'),          'Ctrl+R'),
                   (N_('EditInsertBefore'),    'Ctrl+B'),
                   (N_('EditInsertAfter'),     'Ctrl+I'),
                   (N_('EditAddChild'),        'Ctrl+A'),
                   (N_('EditDelete'),          'Del'),
                   (N_('EditIndent'),          'Ctrl+Shift+Right'),
                   (N_('EditUnindent'),        'Ctrl+Shift+Left'),
                   (N_('EditMoveUp'),          'Ctrl+Shift+Up'),
                   (N_('EditMoveDown'),        'Ctrl+Shift+Down'),
                   (N_('EditMoveFirst'),       ''),
                   (N_('EditMoveLast'),        ''),
                   (N_('ViewPreviousSelect'),  'Ctrl+Shift+P'),
                   (N_('ViewNextSelect'),      'Ctrl+Shift+N'),
                   (N_('ViewTree'),            ''),
                   (N_('ViewFlat'),            ''),
                   (N_('ViewDataOutput'),      'Ctrl+Shift+O'),
                   (N_('ViewDataEdit'),        'Ctrl+Shift+E'),
                   (N_('ViewTitleList'),       'Ctrl+Shift+L'),
                   (N_('ViewShowChild'),       'Ctrl+Shift+C'),
                   (N_('ViewShowDescend'),     'Ctrl+Shift+D'),
                   (N_('DataSetItemType'),     'Ctrl+T'),
                   (N_('DataSetDescendType'),  ''),
                   (N_('DataConfigType'),      ''),
                   (N_('DataCopyTypes'),       ''),
                   (N_('DataSort'),            ''),
                   (N_('DataChange'),          ''),
                   (N_('DataNumber'),          ''),
                   (N_('DataFilterCond'),      ''),
                   (N_('DataFilterText'),      ''),
                   (N_('DataFilterClear'),     ''),
                   (N_('DataCategoryAdd'),     ''),
                   (N_('DataCategoryFlat'),    ''),
                   (N_('DataRefArrange'),      ''),
                   (N_('DataRefFlat'),         ''),
                   (N_('ToolsExpand'),         'Ctrl+Right'),
                   (N_('ToolsCollapse'),       'Ctrl+Left'),
                   (N_('ToolsFind'),           'Ctrl+F'),
                   (N_('ToolsSpellCheck'),     ''),
                   (N_('ToolsRemXLST'),        ''),
                   (N_('ToolsGenOptions'),     ''),
                   (N_('ToolsFileOptions'),    ''),
                   (N_('ToolsTreeFont'),       ''),
                   (N_('ToolsOutputFont'),     ''),
                   (N_('ToolsEditFont'),       ''),
                   (N_('ToolsShortcuts'),      ''),
                   (N_('ToolsCustomToolbar'),  ''),
                   (N_('ToolsDefaultColor'),   ''),
                   (N_('ToolsBackColor'),      ''),
                   (N_('ToolsTextColor'),      ''),
                   (N_('HelpContents'),        'F1'),
                   (N_('HelpFullReadMe'),      ''),
                   (N_('HelpAbout'),           ''),
                   (N_('HelpPlugin'),          ''),
                   (N_('TextAddBoldTag'),      'Ctrl+Shift+B'),
                   (N_('TextAddItalicsTag'),   'Ctrl+Shift+I'),
                   (N_('TextAddUnderlineTag'), 'Ctrl+Shift+U'),
                   (N_('TextAddSizeTag'),      'Ctrl+Shift+S'),
                   (N_('TextAddColorTag'),     'Ctrl+Shift+T')]
 
otherKeyBindList = [(N_('TreeFocusView'),       'Ctrl+G'),
                    (N_('TreeSelectPrev'),      'Ctrl+K'),
                    (N_('TreeSelectNext'),      'Ctrl+J'),
                    (N_('TreePrevSibling'),     'Ctrl+Shift+K'),
                    (N_('TreeNextSibling'),     'Ctrl+Shift+J'),
                    (N_('TreeSelectParent'),    'Ctrl+U'),
                    (N_('TreeOpenItem'),        'Ctrl+L'),
                    (N_('TreeCloseItem'),       'Ctrl+H'),
                    (N_('TreePageUp'),          'Ctrl+Shift+PgUp'),
                    (N_('TreePageDown'),        'Ctrl+Shift+PgDown'),
                    (N_('TreeIncremSearch'),    'Ctrl+/'),
                    (N_('TreeIncremNext'),      'F3'),
                    (N_('TreeIncremPrev'),      'Shift+F3'),
                    (N_('RightChildPageUp'),    'Ctrl+PgUp'),
                    (N_('RightChildPageDown'),  'Ctrl+PgDown'),
                    (N_('RightParentPageUp'),   'Shift+PgUp'),
                    (N_('RightParentPageDown'), 'Shift+PgDown')]

cmdTranslationDict = dict([(cmd, _(cmd)) for cmd, key in
                           menuKeyBindList + otherKeyBindList])

def defaultOutput():
    """Return a list of defaults for the config file"""
    defaultList = ["# Options for TreeLine, an information storage program",
            "#",
            "# All options are set from within the program,",
            "# editing here is not recommended",
            "#",
            "##############################################################",
            "# Keyboard key bindings",
            "##############################################################",
            "#"]
    defaultList.extend(['%-20s %s' % key for key in menuKeyBindList])
    defaultList.extend(['%-20s %s' % key for key in otherKeyBindList])
    defaultList.extend([
            "#",
            "##############################################################",
            "# Other options",
            "##############################################################",
            "#",
            "AutoFileOpen         no",
            "StartShowChildren    yes",
            "StartShowDescend     no",
            "PersistTreeState     yes",
            "SaveWindowGeom       yes",
            "ClickRename          yes",
            "DragTree             yes",
            "InsertOnEnter        yes",
            "RenameNewNodes       yes",
            "OpenSearchNodes      yes",
            "ShowTreeIcons        yes",
            "EnableExecLinks      yes",
            "CompressNewFiles     no",
            "EncryptNewFiles      no",
            "HtmlNewFields        no",
            "#",
            "IndentOffset         20",
            "MaxEditLines         7",
            "UndoLevels           8",
            "AutoSaveMinutes      0",
            "RecentFiles          4",
            "EditorPages          1",
            "SelectOrder          tree",
            "#",
            "EditDateFormat       mm/dd/yyyy",
            "EditTimeFormat       H:MM",
            "#",
            "PrintWhat            tree",
            "PrintRoot            yes",
            "PrintLines           no",
            "PrintOpenOnly        no",
            "PrintKeepFirstChild  yes",
            "PrintUseOutputFont   yes",
            "PrintFont            ",
            "PrintFontSize        ",
            "PrintFontBold        no",
            "PrintFontItalic      no",
            "PrintFontUnderline   no",
            "PrintFontStrikeOut   no",
            "PrintPageSize        Letter",
            "PrintLandscape       no",
            "PrintNumCols         1",
            "PrintColSpace        0.30",
            "PrintIndentOffset    0.30",
            "HorizMargin          0.50",
            "VertMargin           0.70",
            "PrintUnits           inch",
            "#",
            "UseDefaultColors     yes",
            "BackgroundR          255",
            "BackgroundG          255",
            "BackgroundB          255",
            "ForegroundR          0",
            "ForegroundG          0",
            "ForegroundB          0",
            "#",
            "TreeFont             ",
            "TreeFontSize         ",
            "TreeFontBold         no",
            "TreeFontItalic       no",
            "TreeFontUnderline    no",
            "TreeFontStrikeOut    no",
            "OutputFont           ",
            "OutputFontSize       ",
            "OutputFontBold       no",
            "OutputFontItalic     no",
            "OutputFontUnderline  no",
            "OutputFontStrikeOut  no",
            "EditorFont           ",
            "EditorFontSize       ",
            "EditorFontBold       no",
            "EditorFontItalic     no",
            "EditorFontUnderline  no",
            "EditorFontStrikeOut  no",
            "#",
            "ToolbarQuantity      2",
            "ToolbarSize          16",
            "Toolbar0             FileNew,FileOpen,FileSave,FilePrintPreview,"\
            "FilePrint,,EditCut,EditCopy,EditPaste,,ViewPreviousSelect,"\
            "ViewNextSelect,,ViewShowChild,ViewShowDescend,,HelpContents",
            "Toolbar1             EditInsertAfter,EditAddChild,,EditDelete,"\
            "EditIndent,EditUnindent,,EditMoveUp,EditMoveDown,,"\
            "DataSetDescendType,DataConfigType,,DataSort",
            "ToolbarPosition      ",
            "RecentFile1          ",
            "RecentFile2          ",
            "RecentFile3          ",
            "RecentFile4          ",
            "TreeState1           0:0:0:0",
            "TreeState2           0:0:0:0",
            "TreeState3           0:0:0:0",
            "TreeState4           0:0:0:0",
            "SpellCheckPath       ",
            "ExtEditorPath        ",
            "#",
            "WindowXSize          640",
            "WindowYSize          500",
            "WindowXPos           0",
            "WindowYPos           0",
            "TreeSplitPercent     40",
            "OutputSplitPercent   20",
            "EditorSplitPercent   25",
            "TitleSplitPercent    10",
            "ActiveRightView      0",
            "PrintPrevXSize       300",
            "PrintPrevYSize       560",
            "PrintPrevXPos        0",
            "PrintPrevYPos        0"])
    return defaultList
