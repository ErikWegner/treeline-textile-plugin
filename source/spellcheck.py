#!/usr/bin/env python

#****************************************************************************
# spellcheck.py, provides a class for a interface to aspell or ispell
#
# Copyright (C) 2006, Douglas W. Bell
#
# This is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License, either Version 2 or any later
# version.  This program is distributed in the hope that it will be useful,
# but WITTHOUT ANY WARRANTY.  See the included LICENSE file for details.
#*****************************************************************************

import os.path
import re
import sys

class SpellCheck(object):
    """Interfaces with aspell or ispell and stores session hooks"""
    def __init__(self, spellPath='', langCode=''):
        """Create initial hooks to outside program"""
        aspellOpts = ['-a -H --encoding=utf-8']
        ispellOpts = ['-a -h -Tutf8', '-a']
        if langCode:
            aspellOpts.insert(0, '%s --lang=%s' % (aspellOpts[0], langCode))
        if not spellPath:
            cmdList = ['aspell %s' % opt for opt in aspellOpts]
            cmdList.extend(['ispell %s' % opt for opt in ispellOpts])
        elif spellPath.find('aspell') >= 0:
            cmdList = ['%s %s' % (spellPath, opt) for opt in aspellOpts]
        else:
            cmdList = ['%s %s' % (spellPath, opt) for opt in ispellOpts]
        for cmd in cmdList:
            try:
                self.stdIn, self.stdOut, err = os.popen3(cmd)
                self.stdOut.readline()  # read header
                self.stdIn.write('!\n')  # set terse mode (no correct returns)
                self.stdIn.flush()
                return
            except IOError:
                pass
        raise SpellCheckError('Could not init aspell or ispell')
 
    def checkLine(self, line, skipList=None):
        """Check one (and only one!) line of text, ignore words in skipList,
           return a list of tuples, each with the mispelled word, position in
           the line, and a list of suggestions"""
        if not skipList:
            skipList = []
        self.stdIn.write('^%s\n' % line.encode('utf-8'))
        self.stdIn.flush()
        results = [self.stdOut.readline()]
        while results[-1] != '\n':
            results.append(self.stdOut.readline())
        return filter(None, [formatOutput(unicode(line, 'utf-8'), skipList)
                             for line in results])

    def close(self):
        """Shut down hooks to outside program"""
        self.stdIn.close()
        self.stdOut.close()

    def acceptWord(self, word):
        """Accept given word for the remainder of this session"""
        self.stdIn.write('@%s\n' % word.encode('utf-8'))
        self.stdIn.flush()

    def addToDict(self, word, lowCase=0):
        """Add word to dictionary, all lowercase if lowCase"""
        if lowCase:
            self.stdIn.write('&%s\n' % word.encode('utf-8'))
        else:
            self.stdIn.write('*%s\n' % word.encode('utf-8'))
        self.stdIn.write('#\n')  # saves dict
        self.stdIn.flush()


class SpellCheckError(Exception):
    """Exception class for errors on reading file content"""
    pass


guessRe = re.compile('[&?] (\S+) \d+ (\d+): (.+)')
noGuessRe = re.compile('# (\S+) (\d+)')

def formatOutput(line, skipList=[]):
    """Return tuple of word, position and guess list"""
    line = line.strip()
    guessMatch = guessRe.match(line)
    if guessMatch:
        word = guessMatch.group(1)
        if word not in skipList:
            return (word, int(guessMatch.group(2)) - 1,
                    guessMatch.group(3).split(', '))
        else:
            return None
    noGuessMatch = noGuessRe.match(line)
    if noGuessMatch:
        word = noGuessMatch.group(1)
        if word not in skipList:
            return (word, int(noGuessMatch.group(2)) - 1, [])
    return None


if __name__ == '__main__':
    try:
        sp = SpellCheck()
    except SpellCheckError:
        print 'Error - could not initialize aspell or ispell'
        sys.exit()
    while 1:
        s = raw_input('Enter line-> ').strip()
        if not s:
            sys.exit()
        if s.startswith('Accept->'):
            sp.acceptWord(s[8:])
        elif s.startswith('Add->'):
            sp.addToDict(s[5:])
        elif s.startswith('AddLow->'):
            sp.addToDict(s[8:], 1)
        else:
            for word, pos, suggests in sp.checkLine(s):
                print '%s @%i:  %s' % (word, pos, ', '.join(suggests))
                print
    sp.close()
