#!/usr/bin/env python
from distutils.core import setup
import py2exe

setup(name = 'treeline',
      windows = [{'script': 'treeline.py',
                  'icon_resources': [(1, '../win/treeline.ico')]}],
      options = {'py2exe': {'includes': ['sip', 'urllib2'],
                            'dist_dir': 'dist/lib'}})

# run with: python setup.py py2exe
