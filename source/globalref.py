#!/usr/bin/env python

#****************************************************************************
# globalref.py, provides accessible global variables for TreeLine
#
# TreeLine, an information storage program
# Copyright (C) 2006, Douglas W. Bell
#
# This is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License, either Version 2 or any later
# version.  This program is distributed in the hope that it will be useful,
# but WITTHOUT ANY WARRANTY.  See the included LICENSE file for details.
#****************************************************************************


docRef = None
mainWin = None
options = None
treeIcons = None
pluginInterface = None
lang = ''
localTextEncoding = 'utf-8'
modPath = ''

def dummyFunction(*args, **kw):
    """Placeholder for update callbacks, generally replaced with a real
       function reference"""
    pass

updateViewAll = dummyFunction
updateLeftView = dummyFunction
updateRightView = dummyFunction
updateViewSelection = dummyFunction
updateViewItem = dummyFunction    # called with item parameter
updateViewMenuStat = dummyFunction
setStatusBar = dummyFunction  # called with text and optional duration (ms)
focusTree = dummyFunction
