#!/usr/bin/env python

"""
****************************************************************************
 uninstall.py, Linux uninstall script for TreeLine

 Copyright (C) 2003, Douglas W. Bell

 This is free software; you can redistribute it and/or modify it under the
 terms of the GNU General Public License, either Version 2 or any later
 version.  This program is distributed in the hope that it will be useful,
 but WITTHOUT ANY WARRANTY.  See the included LICENSE file for details.
*****************************************************************************
"""

import sys
import os.path
import getopt
import shutil

prefixDir = '/usr/local'
progName = 'treeline'
hasData = 0

def usage(exitCode=2):
    """Display usage info and exit"""
    global prefixDir
    print 'Usage:'
    print '    python uninstall.py [-h] [-p dir]'
    print 'where:'
    print '    -h         display this help message'
    print '    -p dir     install prefix [default: %s]' % prefixDir
    sys.exit(exitCode)

def removeAll(path):
    """Remove path, whether it is a file or a directory,
       print status"""
    print '  Removing %s...' % path,
    try:
        if os.path.isdir(path):
            shutil.rmtree(path)
        elif os.path.isfile(path):
            os.remove(path)
        else:
            print '  not found'
            return
        print '  done'
    except OSError, e:
        if str(e).find('Permission denied') >= 0:
            print '\nError - must be root to remove files'
            sys.exit(4)
        raise


def main():
    try:
        opts, args = getopt.getopt(sys.argv[1:], 'hp:')
    except getopt.GetoptError:
        usage(2)
    global prefixDir
    for opt, val in opts:
        if opt == '-h':
            usage(0)
        elif opt == '-p':
            prefixDir = val
    print 'Removing files...'
    global progName
    removeAll(os.path.join(prefixDir, 'lib', progName))
    removeAll(os.path.join(prefixDir, 'share', 'doc', progName))
    global hasData
    if hasData:
        removeAll(os.path.join(prefixDir, 'share', progName))
    removeAll(os.path.join(prefixDir, 'share', 'icons', progName))
    removeAll(os.path.join(prefixDir, 'share', 'icons', '%s_lg.png' % progName))
    removeAll(os.path.join(prefixDir, 'share', 'icons', '%s_sm.png' % progName))
    removeAll(os.path.join(prefixDir, 'bin', progName))
    print 'Uninstall complete.'


if __name__ == '__main__':
    main()
