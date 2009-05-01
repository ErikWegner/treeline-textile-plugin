; treeline.nsi

; Created       : 2003-12-30
; By            : Petko Yotov 5ko@topfr.net
; License       : Free to use, modify and distribute, but with no warranty.
; Last modified : 2009-05-01 by Doug Bell

; TreeLine is a great structured information storage program by Doug Bell.
; Please check the website for details and updates <http://www.bellz.org/>.

;--------------------------------

!include "MUI.nsh"


; The name of the installer

!define NAME "TreeLine"
!define VERSION "1.2.3"

; Uncomment next line to include pyQt libraries in the installer
!define PYQT

; Uncomment next line to include pyQt libraries for Win98 in the installer
;!define PYQT98

!ifdef PYQT
	!define SUFFIX "-install"
!endif

!ifdef PYQT98
	!define SUFFIX "-install"
!endif

!ifndef SUFFIX
        !define SUFFIX "-upgrade"
!endif

Name "${NAME} ${VERSION} by Doug Bell"


; The file to write
OutFile "treeline-${VERSION}${SUFFIX}.exe"
SetCompressor lzma

!define MUI_ICON "install.ico"
!define MUI_UNICON "uninstall.ico"

XPStyle on

; The default installation directory
InstallDir "$PROGRAMFILES\${NAME}"

; Registry key to check for directory (so if you install again, it will
; overwrite the old one automatically)
InstallDirRegKey HKLM "Software\${NAME}" "Install_Dir"

;--------------------------------

!define MUI_COMPONENTSPAGE
!define MUI_COMPONENTSPAGE_SMALLDESC
!define MUI_LICENSEPAGE_TEXT_BOTTOM "Press Continue to install."
!define MUI_LICENSEPAGE_BUTTON "Continue"

!insertmacro MUI_PAGE_LICENSE ".\doc\LICENSE"
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
;Languages

!insertmacro MUI_LANGUAGE "English"


;--------------------------------

AutoCloseWindow false
ShowInstDetails show

InstType Typical
SetOverwrite ifnewer


; The stuff to install
Section "${NAME} (required)" treeline

	SectionIn 1 RO

	; Set output path to the installation directory.
	SetOutPath "$INSTDIR\lib"

	; Put files there
	File ".\lib\treeline.exe"
        File ".\lib\library.zip"
	File ".\treeline.ico"

        ; Create a plugins directory
        SetOutPath "$INSTDIR\lib\plugins"

        ; Create a templates directory
        SetOutPath "$INSTDIR\templates"

        ; Put files there
        File ".\templates\110en_Long_Plain_Text.trl"
        File ".\templates\120en_Long_HTML_Text.trl"
        File ".\templates\210en_Contact_List.trl"
        File ".\templates\220en_Book_List.trl"
        File ".\templates\230en_ToDo_List.trl"

        ; Set output path to the doc install directory.
        SetOutPath "$INSTDIR\doc"

        ; Put files there
        File ".\doc\LICENSE"
        File ".\doc\README.html"
	File ".\doc\readme.trl"
	File ".\doc\doc_condition.png"
	File ".\doc\doc_edit.png"
	File ".\doc\doc_fieldconf.png"
	File ".\doc\doc_filter.png"
	File ".\doc\doc_main.png"
	File ".\doc\doc_output.png"
	File ".\doc\sample_basic_booklist.trl"
	File ".\doc\sample_basic_contacts.trl"
	File ".\doc\sample_basic_longtext.trl"
        File ".\doc\sample_bookmarks.trl"
        File ".\doc\sample_char_format.trl"
        File ".\doc\sample_color_items.trl"
        File ".\doc\sample_conditional_todo.trl"
        File ".\doc\sample_intern_links.trl"
        File ".\doc\sample_other_fields.trl"
	File ".\doc\sample_table_booklist.trl"

        ; Create an icons directory.
        SetOutPath "$INSTDIR\icons"

        ; Create a tool icons directory
        SetOutPath "$INSTDIR\icons\toolbar"

        ; Create a tool icons directory
        SetOutPath "$INSTDIR\icons\toolbar\16x16"

        ; Set output path to a tool icons directory
        SetOutPath "$INSTDIR\icons\toolbar\32x32"

        ; Put files there

        File ".\icons\toolbar\32x32\dataconfigtype.png"
        File ".\icons\toolbar\32x32\datafiltercond.png"
        File ".\icons\toolbar\32x32\datafiltertext.png"
        File ".\icons\toolbar\32x32\datasetdescendtype.png"
        File ".\icons\toolbar\32x32\datasort.png"
        File ".\icons\toolbar\32x32\editaddchild.png"
        File ".\icons\toolbar\32x32\editcopy.png"
        File ".\icons\toolbar\32x32\editcut.png"
        File ".\icons\toolbar\32x32\editdelete.png"
        File ".\icons\toolbar\32x32\editindent.png"
        File ".\icons\toolbar\32x32\editinsertafter.png"
        File ".\icons\toolbar\32x32\editinsertbefore.png"
        File ".\icons\toolbar\32x32\editmovedown.png"
        File ".\icons\toolbar\32x32\editmovefirst.png"
        File ".\icons\toolbar\32x32\editmovelast.png"
        File ".\icons\toolbar\32x32\editmoveup.png"
        File ".\icons\toolbar\32x32\editpaste.png"
        File ".\icons\toolbar\32x32\editredo.png"
        File ".\icons\toolbar\32x32\editrename.png"
        File ".\icons\toolbar\32x32\editundo.png"
        File ".\icons\toolbar\32x32\editunindent.png"
        File ".\icons\toolbar\32x32\filenew.png"
        File ".\icons\toolbar\32x32\fileopen.png"
        File ".\icons\toolbar\32x32\fileprint.png"
        File ".\icons\toolbar\32x32\fileprintpreview.png"
        File ".\icons\toolbar\32x32\filequit.png"
        File ".\icons\toolbar\32x32\filesave.png"
        File ".\icons\toolbar\32x32\filesaveas.png"
        File ".\icons\toolbar\32x32\helpabout.png"
        File ".\icons\toolbar\32x32\helpback.png"
        File ".\icons\toolbar\32x32\helpcontents.png"
        File ".\icons\toolbar\32x32\helpforward.png"
        File ".\icons\toolbar\32x32\helphome.png"
        File ".\icons\toolbar\32x32\textaddboldtag.png"
        File ".\icons\toolbar\32x32\textaddcolortag.png"
        File ".\icons\toolbar\32x32\textadditalicstag.png"
        File ".\icons\toolbar\32x32\textaddsizetag.png"
        File ".\icons\toolbar\32x32\textaddunderlinetag.png"
        File ".\icons\toolbar\32x32\toolsbackcolor.png"
        File ".\icons\toolbar\32x32\toolscollapse.png"
        File ".\icons\toolbar\32x32\toolsexpand.png"
        File ".\icons\toolbar\32x32\toolsfileoptions.png"
        File ".\icons\toolbar\32x32\toolsfind.png"
        File ".\icons\toolbar\32x32\toolsgenoptions.png"
        File ".\icons\toolbar\32x32\toolsshortcuts.png"
        File ".\icons\toolbar\32x32\toolsspellcheck.png"
        File ".\icons\toolbar\32x32\toolstextcolor.png"
        File ".\icons\toolbar\32x32\viewflat.png"
        File ".\icons\toolbar\32x32\viewnextselect.png"
        File ".\icons\toolbar\32x32\viewpreviousselect.png"
        File ".\icons\toolbar\32x32\viewshowchild.png"
        File ".\icons\toolbar\32x32\viewshowdescend.png"
        File ".\icons\toolbar\32x32\viewtree.png"

        ; Set output path to a tree icons directory
        SetOutPath "$INSTDIR\icons\tree"

        ; Put files there

        File ".\icons\tree\anchor.png"
        File ".\icons\tree\arrow_1.png"
        File ".\icons\tree\arrow_2.png"
        File ".\icons\tree\arrow_3.png"
        File ".\icons\tree\arrow_4.png"
        File ".\icons\tree\arrow_5.png"
        File ".\icons\tree\bell.png"
        File ".\icons\tree\bookmark.png"
        File ".\icons\tree\book_1.png"
        File ".\icons\tree\book_2.png"
        File ".\icons\tree\book_3.png"
        File ".\icons\tree\bulb.png"
        File ".\icons\tree\bullet_1.png"
        File ".\icons\tree\bullet_2.png"
        File ".\icons\tree\bullet_3.png"
        File ".\icons\tree\check_1.png"
        File ".\icons\tree\check_2.png"
        File ".\icons\tree\check_3.png"
        File ".\icons\tree\clock.png"
        File ".\icons\tree\colors.png"
        File ".\icons\tree\date_1.png"
        File ".\icons\tree\date_2.png"
        File ".\icons\tree\default.png"
        File ".\icons\tree\disk.png"
        File ".\icons\tree\doc.png"
        File ".\icons\tree\euro.png"
        File ".\icons\tree\folder_1.png"
        File ".\icons\tree\folder_2.png"
        File ".\icons\tree\folder_3.png"
        File ".\icons\tree\gear.png"
        File ".\icons\tree\gnu.png"
        File ".\icons\tree\hand.png"
        File ".\icons\tree\heart.png"
        File ".\icons\tree\home.png"
        File ".\icons\tree\lock_1.png"
        File ".\icons\tree\lock_2.png"
        File ".\icons\tree\mag.png"
        File ".\icons\tree\mail.png"
        File ".\icons\tree\minus.png"
        File ".\icons\tree\misc.png"
        File ".\icons\tree\move.png"
        File ".\icons\tree\music.png"
        File ".\icons\tree\note.png"
        File ".\icons\tree\pencil.png"
        File ".\icons\tree\person.png"
        File ".\icons\tree\plus.png"
        File ".\icons\tree\print.png"
        File ".\icons\tree\question.png"
        File ".\icons\tree\rocket.png"
        File ".\icons\tree\round_minus.png"
        File ".\icons\tree\round_plus.png"
        File ".\icons\tree\smiley_1.png"
        File ".\icons\tree\smiley_2.png"
        File ".\icons\tree\smiley_3.png"
        File ".\icons\tree\smiley_4.png"
        File ".\icons\tree\smiley_5.png"
        File ".\icons\tree\sphere.png"
        File ".\icons\tree\star.png"
        File ".\icons\tree\sum.png"
        File ".\icons\tree\table.png"
        File ".\icons\tree\task_1.png"
        File ".\icons\tree\task_2.png"
        File ".\icons\tree\term.png"
        File ".\icons\tree\text.png"
        File ".\icons\tree\trash.png"
        File ".\icons\tree\treeline.png"
        File ".\icons\tree\tux_1.png"
        File ".\icons\tree\tux_2.png"
        File ".\icons\tree\warning.png"
        File ".\icons\tree\wrench.png"
        File ".\icons\tree\write.png"
        File ".\icons\tree\x_1.png"
        File ".\icons\tree\x_2.png"
        File ".\icons\tree\x_3.png"

SectionEnd

!ifdef PYQT

	Section "PyQt libraries (required)" py_qt

		SectionIn 1 RO

                Delete "$INSTDIR\lib\_qt.pyd"
                Delete "$INSTDIR\lib\_sre.pyd"
                Delete "$INSTDIR\lib\_winreg.pyd"
                Delete "$INSTDIR\lib\libqtc.pyd"
                Delete "$INSTDIR\lib\libsip.dll"
                Delete "$INSTDIR\lib\mingwm10.dll"
                Delete "$INSTDIR\lib\msvcp71.dll"
                Delete "$INSTDIR\lib\MSVCR71.dll"
                Delete "$INSTDIR\lib\python25.dll"
                Delete "$INSTDIR\lib\python24.dll"
                Delete "$INSTDIR\lib\python23.dll"
                Delete "$INSTDIR\lib\QtCore.pyd"
                Delete "$INSTDIR\lib\QtGui.pyd"
                Delete "$INSTDIR\lib\qt-mt230nc.dll"
                Delete "$INSTDIR\lib\zlib.pyd"


                SetOutPath "$INSTDIR\lib"

                File ".\lib\_ctypes.pyd"
                File ".\lib\_hashlib.pyd"
		File ".\lib\_socket.pyd"
		File ".\lib\_ssl.pyd"
                File ".\lib\bz2.pyd"
                File ".\lib\Microsoft.VC90.CRT.manifest"
                File ".\lib\msvcp90.dll"
                File ".\lib\msvcr90.dll"
                File ".\lib\pyexpat.pyd"
                File ".\lib\PyQt4.QtCore.pyd"
                File ".\lib\PyQt4.QtGui.pyd"
		File ".\lib\python26.dll"
                File ".\lib\QtCore4.dll"
                File ".\lib\QtGui4.dll"
                File ".\lib\select.pyd"
                File ".\lib\sip.pyd"
                File ".\lib\unicodedata.pyd"
                File ".\lib\w9xpopen.exe"

                SetOutPath "$INSTDIR\lib\imageformats"

                File ".\lib\imageformats\qgif4.dll"
                File ".\lib\imageformats\qico4.dll"
                File ".\lib\imageformats\qjpeg4.dll"
                File ".\lib\imageformats\qsvg4.dll"
                File ".\lib\imageformats\qtiff4.dll"
                File ".\lib\Microsoft.VC90.CRT.manifest"
                File ".\lib\msvcp90.dll"
                File ".\lib\msvcr90.dll"

	SectionEnd
!endif

!ifdef PYQT98

	Section "PyQt libraries (required)" py_qt

		SectionIn 1 RO

                Delete "$INSTDIR\lib\_ctypes.pyd"
                Delete "$INSTDIR\lib\_qt.pyd"
                Delete "$INSTDIR\lib\_sre.pyd"
                Delete "$INSTDIR\lib\_winreg.pyd"
                Delete "$INSTDIR\lib\libqtc.pyd"
                Delete "$INSTDIR\lib\libsip.dll"
                Delete "$INSTDIR\lib\Microsoft.VC90.CRT.manifest"
                Delete "$INSTDIR\lib\msvcp90.dll"
                Delete "$INSTDIR\lib\msvcr90.dll"
                Delete "$INSTDIR\lib\python26.dll"
                Delete "$INSTDIR\lib\python24.dll"
                Delete "$INSTDIR\lib\python23.dll"
                Delete "$INSTDIR\lib\QtCore.pyd"
                Delete "$INSTDIR\lib\QtGui.pyd"
                Delete "$INSTDIR\lib\qt-mt230nc.dll"
                Delete "$INSTDIR\lib\zlib.pyd"
                Delete "$INSTDIR\lib\imageformats\Microsoft.VC90.CRT.manifest"
                Delete "$INSTDIR\lib\imageformats\msvcp90.dll"
                Delete "$INSTDIR\lib\imageformats\msvcr90.dll"

                SetOutPath "$INSTDIR\lib"

                File ".\lib\_hashlib.pyd"
		File ".\lib\_socket.pyd"
		File ".\lib\_ssl.pyd"
                File ".\lib\bz2.pyd"
                File ".\lib\mingwm10.dll"
                File ".\lib\msvcp71.dll"
                File ".\lib\MSVCR71.dll"
                File ".\lib\pyexpat.pyd"
                File ".\lib\PyQt4.QtCore.pyd"
                File ".\lib\PyQt4.QtGui.pyd"
		File ".\lib\python25.dll"
                File ".\lib\QtCore4.dll"
                File ".\lib\QtGui4.dll"
                File ".\lib\select.pyd"
                File ".\lib\sip.pyd"
                File ".\lib\unicodedata.pyd"
                File ".\lib\w9xpopen.exe"

                SetOutPath "$INSTDIR\lib\imageformats"

                File ".\lib\imageformats\qgif4.dll"
                File ".\lib\imageformats\qico4.dll"
                File ".\lib\imageformats\qjpeg4.dll"
                File ".\lib\imageformats\qsvg4.dll"
                File ".\lib\imageformats\qtiff4.dll"

	SectionEnd
!endif

Section "Default action for *.trl files" explorer
	; Optional section (can be disabled by the user)
	SectionIn 1
	WriteRegStr HKCR ".trl" "" "trl_auto_file"

	WriteRegStr HKEY_CLASSES_ROOT "trl_auto_file" "" "TreeLine Outline"
	WriteRegDWORD HKEY_CLASSES_ROOT "trl_auto_file" "EditFlags" 0x0
	WriteRegDWORD HKEY_CLASSES_ROOT "trl_auto_file" "BrowserFlags" 0x8
	WriteRegStr HKEY_CLASSES_ROOT "trl_auto_file\DefaultIcon" "" "$INSTDIR\lib\treeline.ico,0"
	WriteRegStr HKEY_CLASSES_ROOT "trl_auto_file\shell" "" ""
	WriteRegStr HKEY_CLASSES_ROOT "trl_auto_file\shell\open" "" ""
	WriteRegStr HKEY_CLASSES_ROOT "trl_auto_file\shell\open\command" "" '"$INSTDIR\lib\treeline.exe" "%1"'
SectionEnd

Section "Start menu shortcuts" startmenu
	; Optional section (can be disabled by the user)
  SectionIn 1
  CreateDirectory "$SMPROGRAMS\${NAME}"
  CreateShortCut "$SMPROGRAMS\${NAME}\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\${NAME}\Readme.lnk" "$INSTDIR\doc\Readme.html"
  CreateShortCut "$SMPROGRAMS\${NAME}\${NAME}.lnk" "$INSTDIR\lib\treeline.exe" "" "$INSTDIR\lib\treeline.exe" 0

SectionEnd

Section "Desktop shortcut" deskicon
	; Optional section (can be disabled by the user)
  SectionIn 1
  CreateShortCut "$DESKTOP\${NAME}.lnk" "$INSTDIR\lib\treeline.exe" "" "$INSTDIR\lib\treeline.exe" 0

SectionEnd

Section "Install and uninstall registry keys" reg_keys
        ; Optional section (can be disabled by the user)
        SectionIn 1

	; Write the installation path into the registry
	WriteRegStr HKLM "SOFTWARE\${NAME}" "Install_Dir" "$INSTDIR"

	; Write the uninstall keys for Windows
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "DisplayName" "${NAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}" "UninstallString" '"$INSTDIR\uninstall.exe"'
	WriteUninstaller "uninstall.exe"

SectionEnd

Section /o "${NAME} source code" source
	; Optional section (can be disabled by the user)
        SectionIn 1

        SetOutPath "$INSTDIR\source"

	File ".\treeline.nsi"
	File ".\install.ico"
	File ".\uninstall.ico"
        File ".\source\cmdline.py"
        File ".\source\conditional.py"
        File ".\source\configdialog.py"
	File ".\source\fieldformat.py"
	File ".\source\genboolean.py"
	File ".\source\gendate.py"
	File ".\source\gennumber.py"
	File ".\source\gentime.py"
        File ".\source\globalref.py"
	File ".\source\helpview.py"
	File ".\source\icondict.py"
	File ".\source\nodeformat.py"
	File ".\source\numbering.py"
	File ".\source\option.py"
	File ".\source\optiondefaults.py"
	File ".\source\optiondlg.py"
        File ".\source\output.py"
        File ".\source\p3.py"
        File ".\source\plugininterface.py"
	File ".\source\printdata.py"
	File ".\source\printdialogs.py"
	File ".\source\recentfiles.py"
	File ".\source\setup.py"
        File ".\source\spellcheck.py"
	File ".\source\treedialogs.py"
	File ".\source\treedoc.py"
        File ".\source\treeeditviews.py"
        File ".\source\treeflatview.py"
	File ".\source\treeformats.py"
	File ".\source\treeitem.py"
	File ".\source\treeline.py"
	File ".\source\treemainwin.py"
	File ".\source\treerightviews.py"
        File ".\source\treeselection.py"
	File ".\source\treeview.py"
        File ".\source\treexmlparse.py"
        File ".\source\undo.py"

SectionEnd

;--------------------------------
;Descriptions

LangString DESC_treeline ${LANG_ENGLISH} "TreeLine program, help and example files."
LangString DESC_pyqt ${LANG_ENGLISH} "Required PyQt library files."
LangString DESC_explorer ${LANG_ENGLISH} "Open TreeLine files in the Explorer (recommended)."
LangString DESC_startmenu ${LANG_ENGLISH} "Add TreeLine to the Start menu."
LangString DESC_deskicon ${LANG_ENGLISH} "Add a TreeLine shortcut to the desktop."
LangString DESC_reg_keys ${LANG_ENGLISH} "Write install and uninstall information."
LangString DESC_source ${LANG_ENGLISH} "TreeLine source code (for developers)."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${treeline} $(DESC_treeline)

	!ifdef PYQT
		!insertmacro MUI_DESCRIPTION_TEXT ${py_qt} $(DESC_pyqt)
	!endif
	!ifdef PYQT98
		!insertmacro MUI_DESCRIPTION_TEXT ${py_qt} $(DESC_pyqt)
	!endif

	!insertmacro MUI_DESCRIPTION_TEXT ${explorer} $(DESC_explorer)
	!insertmacro MUI_DESCRIPTION_TEXT ${startmenu} $(DESC_startmenu)
	!insertmacro MUI_DESCRIPTION_TEXT ${deskicon} $(DESC_deskicon)
        !insertmacro MUI_DESCRIPTION_TEXT ${reg_keys} $(DESC_reg_keys)
	!insertmacro MUI_DESCRIPTION_TEXT ${source} $(DESC_source)
!insertmacro MUI_FUNCTION_DESCRIPTION_END


;--------------------------------

; Uninstaller

Section "Uninstall"

	; Remove registry keys
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}"
	DeleteRegKey HKLM "SOFTWARE\${NAME}"

	DeleteRegKey HKCR "trl_auto_file"
	DeleteRegKey HKCR ".trl"


	; Remove files and uninstaller
	Delete "$INSTDIR\lib\treeline.exe"
        Delete "$INSTDIR\lib\library.zip"
	Delete "$INSTDIR\lib\treeline.ico"
        Delete "$INSTDIR\lib\treeline.exe.log"

        Delete "$INSTDIR\templates\110en_Long_Plain_Text.trl"
        Delete "$INSTDIR\templates\120en_Long_HTML_Text.trl"
        Delete "$INSTDIR\templates\210en_Contact_List.trl"
        Delete "$INSTDIR\templates\220en_Book_List.trl"
        Delete "$INSTDIR\templates\230en_ToDo_List.trl"

        Delete "$INSTDIR\doc\LICENSE"
        Delete "$INSTDIR\doc\README.html"
	Delete "$INSTDIR\doc\readme.trl"
	Delete "$INSTDIR\doc\doc_condition.png"
	Delete "$INSTDIR\doc\doc_edit.png"
	Delete "$INSTDIR\doc\doc_fieldconf.png"
	Delete "$INSTDIR\doc\doc_filter.png"
	Delete "$INSTDIR\doc\doc_main.png"
	Delete "$INSTDIR\doc\doc_output.png"
        Delete "$INSTDIR\doc\config_dlg.png"
        Delete "$INSTDIR\doc\condition_dlg.png"
        Delete "$INSTDIR\doc\field_dlg.png" 
	Delete "$INSTDIR\doc\sample_basic_booklist.trl"
	Delete "$INSTDIR\doc\sample_basic_contacts.trl"
	Delete "$INSTDIR\doc\sample_basic_longtext.trl"
        Delete "$INSTDIR\doc\sample_bookmarks.trl"
        Delete "$INSTDIR\doc\sample_char_format.trl"
        Delete "$INSTDIR\doc\sample_color_items.trl"
        Delete "$INSTDIR\doc\sample_conditional_todo.trl"
        Delete "$INSTDIR\doc\sample_intern_links.trl"
        Delete "$INSTDIR\doc\sample_other_fields.trl"
	Delete "$INSTDIR\doc\sample_table_booklist.trl"

	Delete "$INSTDIR\doc\sample_basic.trl"
        Delete "$INSTDIR\doc\sample_bookmarks.trl"
        Delete "$INSTDIR\doc\sample_char_format.trl"
        Delete "$INSTDIR\doc\sample_color_items.trl"
        Delete "$INSTDIR\doc\sample_intern_links.trl"
	Delete "$INSTDIR\doc\sample_table.trl"

        Delete "$INSTDIR\icons\toolbar\32x32\dataconfigtype.png"
        Delete "$INSTDIR\icons\toolbar\32x32\datafiltercond.png"
        Delete "$INSTDIR\icons\toolbar\32x32\datafiltertext.png"
        Delete "$INSTDIR\icons\toolbar\32x32\datasetdescendtype.png"
        Delete "$INSTDIR\icons\toolbar\32x32\datasort.png"
        Delete "$INSTDIR\icons\toolbar\32x32\datasortchildren.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editaddchild.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editcopy.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editcut.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editdelete.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editindent.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editinsertafter.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editinsertbefore.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editmovedown.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editmovefirst.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editmovelast.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editmoveup.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editpaste.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editredo.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editrename.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editundo.png"
        Delete "$INSTDIR\icons\toolbar\32x32\editunindent.png"
        Delete "$INSTDIR\icons\toolbar\32x32\filenew.png"
        Delete "$INSTDIR\icons\toolbar\32x32\fileopen.png"
        Delete "$INSTDIR\icons\toolbar\32x32\fileprint.png"
        Delete "$INSTDIR\icons\toolbar\32x32\fileprintpreview.png"
        Delete "$INSTDIR\icons\toolbar\32x32\filequit.png"
        Delete "$INSTDIR\icons\toolbar\32x32\filesave.png"
        Delete "$INSTDIR\icons\toolbar\32x32\filesaveas.png"
        Delete "$INSTDIR\icons\toolbar\32x32\helpabout.png"
        Delete "$INSTDIR\icons\toolbar\32x32\helpback.png"
        Delete "$INSTDIR\icons\toolbar\32x32\helpcontents.png"
        Delete "$INSTDIR\icons\toolbar\32x32\helpforward.png"
        Delete "$INSTDIR\icons\toolbar\32x32\helphome.png"
        Delete "$INSTDIR\icons\toolbar\32x32\textaddboldtag.png"
        Delete "$INSTDIR\icons\toolbar\32x32\textaddcolortag.png"
        Delete "$INSTDIR\icons\toolbar\32x32\textadditalicstag.png"
        Delete "$INSTDIR\icons\toolbar\32x32\textaddsizetag.png"
        Delete "$INSTDIR\icons\toolbar\32x32\textaddunderlinetag.png"
        Delete "$INSTDIR\icons\toolbar\32x32\toolsbackcolor.png"
        Delete "$INSTDIR\icons\toolbar\32x32\toolscollapse.png"
        Delete "$INSTDIR\icons\toolbar\32x32\toolsexpand.png"
        Delete "$INSTDIR\icons\toolbar\32x32\toolsfileoptions.png"
        Delete "$INSTDIR\icons\toolbar\32x32\toolsfind.png"
        Delete "$INSTDIR\icons\toolbar\32x32\toolsgenoptions.png"
        Delete "$INSTDIR\icons\toolbar\32x32\toolsshortcuts.png"
        Delete "$INSTDIR\icons\toolbar\32x32\toolsspellcheck.png"
        Delete "$INSTDIR\icons\toolbar\32x32\toolstextcolor.png"
        Delete "$INSTDIR\icons\toolbar\32x32\viewflat.png"
        Delete "$INSTDIR\icons\toolbar\32x32\viewhidechild.png"
        Delete "$INSTDIR\icons\toolbar\32x32\viewnextselect.png"
        Delete "$INSTDIR\icons\toolbar\32x32\viewpreviousselect.png"
        Delete "$INSTDIR\icons\toolbar\32x32\viewshowchild.png"
        Delete "$INSTDIR\icons\toolbar\32x32\viewshowdescend.png"
        Delete "$INSTDIR\icons\toolbar\32x32\viewtree.png"

        Delete "$INSTDIR\icons\tree\anchor.png"
        Delete "$INSTDIR\icons\tree\arrow_1.png"
        Delete "$INSTDIR\icons\tree\arrow_2.png"
        Delete "$INSTDIR\icons\tree\arrow_3.png"
        Delete "$INSTDIR\icons\tree\arrow_4.png"
        Delete "$INSTDIR\icons\tree\arrow_5.png"
        Delete "$INSTDIR\icons\tree\bell.png"
        Delete "$INSTDIR\icons\tree\bookmark.png"
        Delete "$INSTDIR\icons\tree\book_1.png"
        Delete "$INSTDIR\icons\tree\book_2.png"
        Delete "$INSTDIR\icons\tree\book_3.png"
        Delete "$INSTDIR\icons\tree\bulb.png"
        Delete "$INSTDIR\icons\tree\bullet_1.png"
        Delete "$INSTDIR\icons\tree\bullet_2.png"
        Delete "$INSTDIR\icons\tree\bullet_3.png"
        Delete "$INSTDIR\icons\tree\check_1.png"
        Delete "$INSTDIR\icons\tree\check_2.png"
        Delete "$INSTDIR\icons\tree\check_3.png"
        Delete "$INSTDIR\icons\tree\clock.png"
        Delete "$INSTDIR\icons\tree\colors.png"
        Delete "$INSTDIR\icons\tree\date_1.png"
        Delete "$INSTDIR\icons\tree\date_2.png"
        Delete "$INSTDIR\icons\tree\default.png"
        Delete "$INSTDIR\icons\tree\disk.png"
        Delete "$INSTDIR\icons\tree\doc.png"
        Delete "$INSTDIR\icons\tree\euro.png"
        Delete "$INSTDIR\icons\tree\folder_1.png"
        Delete "$INSTDIR\icons\tree\folder_2.png"
        Delete "$INSTDIR\icons\tree\folder_3.png"
        Delete "$INSTDIR\icons\tree\gear.png"
        Delete "$INSTDIR\icons\tree\gnu.png"
        Delete "$INSTDIR\icons\tree\hand.png"
        Delete "$INSTDIR\icons\tree\heart.png"
        Delete "$INSTDIR\icons\tree\home.png"
        Delete "$INSTDIR\icons\tree\lock_1.png"
        Delete "$INSTDIR\icons\tree\lock_2.png"
        Delete "$INSTDIR\icons\tree\mag.png"
        Delete "$INSTDIR\icons\tree\mail.png"
        Delete "$INSTDIR\icons\tree\minus.png"
        Delete "$INSTDIR\icons\tree\misc.png"
        Delete "$INSTDIR\icons\tree\move.png"
        Delete "$INSTDIR\icons\tree\music.png"
        Delete "$INSTDIR\icons\tree\note.png"
        Delete "$INSTDIR\icons\tree\pencil.png"
        Delete "$INSTDIR\icons\tree\person.png"
        Delete "$INSTDIR\icons\tree\plus.png"
        Delete "$INSTDIR\icons\tree\print.png"
        Delete "$INSTDIR\icons\tree\question.png"
        Delete "$INSTDIR\icons\tree\rocket.png"
        Delete "$INSTDIR\icons\tree\round_minus.png"
        Delete "$INSTDIR\icons\tree\round_plus.png"
        Delete "$INSTDIR\icons\tree\smiley_1.png"
        Delete "$INSTDIR\icons\tree\smiley_2.png"
        Delete "$INSTDIR\icons\tree\smiley_3.png"
        Delete "$INSTDIR\icons\tree\smiley_4.png"
        Delete "$INSTDIR\icons\tree\smiley_5.png"
        Delete "$INSTDIR\icons\tree\sphere.png"
        Delete "$INSTDIR\icons\tree\star.png"
        Delete "$INSTDIR\icons\tree\sum.png"
        Delete "$INSTDIR\icons\tree\table.png"
        Delete "$INSTDIR\icons\tree\task_1.png"
        Delete "$INSTDIR\icons\tree\task_2.png"
        Delete "$INSTDIR\icons\tree\term.png"
        Delete "$INSTDIR\icons\tree\text.png"
        Delete "$INSTDIR\icons\tree\trash.png"
        Delete "$INSTDIR\icons\tree\treeline.png"
        Delete "$INSTDIR\icons\tree\tux_1.png"
        Delete "$INSTDIR\icons\tree\tux_2.png"
        Delete "$INSTDIR\icons\tree\warning.png"
        Delete "$INSTDIR\icons\tree\wrench.png"
        Delete "$INSTDIR\icons\tree\write.png"
        Delete "$INSTDIR\icons\tree\x_1.png"
        Delete "$INSTDIR\icons\tree\x_2.png"
        Delete "$INSTDIR\icons\tree\x_3.png"

        Delete "$INSTDIR\icons\anchor.png"
        Delete "$INSTDIR\icons\arrow_1.png"
        Delete "$INSTDIR\icons\arrow_2.png"
        Delete "$INSTDIR\icons\arrow_3.png"
        Delete "$INSTDIR\icons\arrow_4.png"
        Delete "$INSTDIR\icons\arrow_5.png"
        Delete "$INSTDIR\icons\bell.png"
        Delete "$INSTDIR\icons\book_1.png"
        Delete "$INSTDIR\icons\book_2.png"
        Delete "$INSTDIR\icons\book_3.png"
        Delete "$INSTDIR\icons\bookmark.png"
        Delete "$INSTDIR\icons\bulb.png"
        Delete "$INSTDIR\icons\bullet_1.png"
        Delete "$INSTDIR\icons\bullet_2.png"
        Delete "$INSTDIR\icons\bullet_3.png"
        Delete "$INSTDIR\icons\check_1.png"
        Delete "$INSTDIR\icons\check_2.png"
        Delete "$INSTDIR\icons\check_3.png"
        Delete "$INSTDIR\icons\clock.png"
        Delete "$INSTDIR\icons\colors.png"
        Delete "$INSTDIR\icons\dataconfigtype.png"
        Delete "$INSTDIR\icons\dataconf.png"
        Delete "$INSTDIR\icons\datafiltercond.png"
        Delete "$INSTDIR\icons\datafiltertext.png"
        Delete "$INSTDIR\icons\datafilter.png"
        Delete "$INSTDIR\icons\datasetdescendtype.png"
        Delete "$INSTDIR\icons\dataset.png"
        Delete "$INSTDIR\icons\datasortchildren.png"
        Delete "$INSTDIR\icons\datasort.png"
        Delete "$INSTDIR\icons\date_1.png"
        Delete "$INSTDIR\icons\date_2.png"
        Delete "$INSTDIR\icons\default.png"
        Delete "$INSTDIR\icons\disk.png"
        Delete "$INSTDIR\icons\doc.png"
        Delete "$INSTDIR\icons\editaddchild.png"
        Delete "$INSTDIR\icons\editadd.png"
        Delete "$INSTDIR\icons\editcopy.png"
        Delete "$INSTDIR\icons\editcut.png"
        Delete "$INSTDIR\icons\editdelete.png"
        Delete "$INSTDIR\icons\editdel.png"
        Delete "$INSTDIR\icons\editindent.png"
        Delete "$INSTDIR\icons\editinsertafter.png"
        Delete "$INSTDIR\icons\editinsertbefore.png"
        Delete "$INSTDIR\icons\editmovedown.png"
        Delete "$INSTDIR\icons\editmoveup.png"
        Delete "$INSTDIR\icons\editpaste.png"
        Delete "$INSTDIR\icons\editredo.png"
        Delete "$INSTDIR\icons\editrename.png"
        Delete "$INSTDIR\icons\editundo.png"
        Delete "$INSTDIR\icons\editunindent.png"
        Delete "$INSTDIR\icons\euro.png"
        Delete "$INSTDIR\icons\filenew.png"
        Delete "$INSTDIR\icons\fileopen.png"
        Delete "$INSTDIR\icons\fileprint.png"
        Delete "$INSTDIR\icons\fileprintpreview.png"
        Delete "$INSTDIR\icons\filequit.png"
        Delete "$INSTDIR\icons\filesave.png"
        Delete "$INSTDIR\icons\filesaveas.png"
        Delete "$INSTDIR\icons\folder_1.png"
        Delete "$INSTDIR\icons\folder_2.png"
        Delete "$INSTDIR\icons\folder_3.png"
        Delete "$INSTDIR\icons\gear.png"
        Delete "$INSTDIR\icons\gnu.png"
        Delete "$INSTDIR\icons\hand.png"
        Delete "$INSTDIR\icons\heart.png"
        Delete "$INSTDIR\icons\helpabout.png"
        Delete "$INSTDIR\icons\helpback.png"
        Delete "$INSTDIR\icons\helpcontents.png"
        Delete "$INSTDIR\icons\helpforward.png"
        Delete "$INSTDIR\icons\helphome.png"
        Delete "$INSTDIR\icons\helpreadme.png"
        Delete "$INSTDIR\icons\home.png"
        Delete "$INSTDIR\icons\lock_1.png"
        Delete "$INSTDIR\icons\lock_2.png"
        Delete "$INSTDIR\icons\mag.png"
        Delete "$INSTDIR\icons\mail.png"
        Delete "$INSTDIR\icons\minus.png"
        Delete "$INSTDIR\icons\misc.png"
        Delete "$INSTDIR\icons\move.png"
        Delete "$INSTDIR\icons\music.png"
        Delete "$INSTDIR\icons\note.png"
        Delete "$INSTDIR\icons\pencil.png"
        Delete "$INSTDIR\icons\person.png"
        Delete "$INSTDIR\icons\plus.png"
        Delete "$INSTDIR\icons\print.png"
        Delete "$INSTDIR\icons\question.png"
        Delete "$INSTDIR\icons\rocket.png"
        Delete "$INSTDIR\icons\smiley_1.png"
        Delete "$INSTDIR\icons\smiley_2.png"
        Delete "$INSTDIR\icons\smiley_3.png"
        Delete "$INSTDIR\icons\smiley_4.png"
        Delete "$INSTDIR\icons\smiley_5.png"
        Delete "$INSTDIR\icons\sphere.png"
        Delete "$INSTDIR\icons\star.png"
        Delete "$INSTDIR\icons\sum.png"
        Delete "$INSTDIR\icons\table.png"
        Delete "$INSTDIR\icons\task_1.png"
        Delete "$INSTDIR\icons\task_2.png"
        Delete "$INSTDIR\icons\term.png"
        Delete "$INSTDIR\icons\text.png"
        Delete "$INSTDIR\icons\toolsbackcolor.png"
        Delete "$INSTDIR\icons\toolscollapse.png"
        Delete "$INSTDIR\icons\toolsexpand.png"
        Delete "$INSTDIR\icons\toolsfileoptions.png"
        Delete "$INSTDIR\icons\toolsfind.png"
        Delete "$INSTDIR\icons\toolsgenoptions.png"
        Delete "$INSTDIR\icons\toolsshortcuts.png"
        Delete "$INSTDIR\icons\toolsoptions.png"
        Delete "$INSTDIR\icons\toolsspellcheck.png"
        Delete "$INSTDIR\icons\toolsspell.png"
        Delete "$INSTDIR\icons\toolstextcolor.png"
        Delete "$INSTDIR\icons\trash.png"
        Delete "$INSTDIR\icons\treeline.png"
        Delete "$INSTDIR\icons\tux_1.png"
        Delete "$INSTDIR\icons\tux_2.png"
        Delete "$INSTDIR\icons\viewflat.png"
        Delete "$INSTDIR\icons\viewhidechild.png"
        Delete "$INSTDIR\icons\viewchild.png"
        Delete "$INSTDIR\icons\viewshowchild.png"
        Delete "$INSTDIR\icons\viewselect.png"
        Delete "$INSTDIR\icons\viewtree.png"
        Delete "$INSTDIR\icons\warning.png"
        Delete "$INSTDIR\icons\wrench.png"
        Delete "$INSTDIR\icons\write.png"
        Delete "$INSTDIR\icons\x_1.png"
        Delete "$INSTDIR\icons\x_2.png"
        Delete "$INSTDIR\icons\x_3.png"

        Delete "$INSTDIR\lib\_ctypes.pyd"
        Delete "$INSTDIR\lib\_hashlib.pyd"
        Delete "$INSTDIR\lib\_qt.pyd"
        Delete "$INSTDIR\lib\_socket.pyd"
        Delete "$INSTDIR\lib\_sre.pyd"
        Delete "$INSTDIR\lib\_ssl.pyd"
        Delete "$INSTDIR\lib\_winreg.pyd"
        Delete "$INSTDIR\lib\bz2.pyd"
        Delete "$INSTDIR\lib\libqtc.pyd"
        Delete "$INSTDIR\lib\libsip.dll"
        Delete "$INSTDIR\lib\mingwm10.dll"
        Delete "$INSTDIR\lib\msvcp71.dll"
        Delete "$INSTDIR\lib\MSVCR71.dll"
        Delete "$INSTDIR\lib\Microsoft.VC90.CRT.manifest"
        Delete "$INSTDIR\lib\msvcp90.dll"
        Delete "$INSTDIR\lib\msvcr90.dll"
        Delete "$INSTDIR\lib\pyexpat.pyd"
        Delete "$INSTDIR\lib\python26.dll"
        Delete "$INSTDIR\lib\python25.dll"
        Delete "$INSTDIR\lib\python24.dll"
        Delete "$INSTDIR\lib\python23.dll"
        Delete "$INSTDIR\lib\PyQt4.QtCore.pyd"
        Delete "$INSTDIR\lib\PyQt4.QtGui.pyd"
        Delete "$INSTDIR\lib\QtCore4.dll"
        Delete "$INSTDIR\lib\QtCore.pyd"
        Delete "$INSTDIR\lib\QtGui4.dll"
        Delete "$INSTDIR\lib\QtGui.pyd"
        Delete "$INSTDIR\lib\qt-mt230nc.dll"
        Delete "$INSTDIR\lib\select.pyd"
        Delete "$INSTDIR\lib\sip.pyd"
        Delete "$INSTDIR\lib\unicodedata.pyd"
        Delete "$INSTDIR\lib\w9xpopen.exe"
	Delete "$INSTDIR\lib\zlib.pyd"

        Delete "$INSTDIR\lib\imageformats\qgif4.dll"
        Delete "$INSTDIR\lib\imageformats\qico4.dll"
        Delete "$INSTDIR\lib\imageformats\qjpeg4.dll"
        Delete "$INSTDIR\lib\imageformats\qsvg4.dll"
        Delete "$INSTDIR\lib\imageformats\qtiff4.dll"
        Delete "$INSTDIR\lib\imageformats\Microsoft.VC90.CRT.manifest"
        Delete "$INSTDIR\lib\imageformats\msvcp90.dll"
        Delete "$INSTDIR\lib\imageformats\msvcr90.dll"

	Delete "$INSTDIR\source\treeline.nsi"
	Delete "$INSTDIR\source\install.ico"
	Delete "$INSTDIR\source\uninstall.ico"
        Delete "$INSTDIR\source\cmdline.py"
        Delete "$INSTDIR\source\conditional.py"
        Delete "$INSTDIR\source\configdialog.py"
	Delete "$INSTDIR\source\docparam.py"
	Delete "$INSTDIR\source\fieldformat.py"
	Delete "$INSTDIR\source\formatlist.py"
	Delete "$INSTDIR\source\genboolean.py"
	Delete "$INSTDIR\source\gendate.py"
	Delete "$INSTDIR\source\gennumber.py"
	Delete "$INSTDIR\source\gentime.py"
	Delete "$INSTDIR\source\globalref.py"
	Delete "$INSTDIR\source\helpview.py"
	Delete "$INSTDIR\source\icondict.py"
	Delete "$INSTDIR\source\nodeformat.py"
	Delete "$INSTDIR\source\numbering.py"
	Delete "$INSTDIR\source\option.py"
	Delete "$INSTDIR\source\optiondefaults.py"
	Delete "$INSTDIR\source\optiondlg.py"
        Delete "$INSTDIR\source\output.py"
        Delete "$INSTDIR\source\p3.py"
        Delete "$INSTDIR\source\plugininterface.py"
	Delete "$INSTDIR\source\printdata.py"
	Delete "$INSTDIR\source\printdialogs.py"
	Delete "$INSTDIR\source\printpreview.py"
	Delete "$INSTDIR\source\recentfiles.py"
	Delete "$INSTDIR\source\setup.py"
	Delete "$INSTDIR\source\sitecustomize.py"
        Delete "$INSTDIR\source\spellcheck.py"
	Delete "$INSTDIR\source\textedit2.py"
	Delete "$INSTDIR\source\textedit3.py"
	Delete "$INSTDIR\source\tmpcontrol.py"
	Delete "$INSTDIR\source\treedialogs.py"
	Delete "$INSTDIR\source\treedoc.py"
        Delete "$INSTDIR\source\treeeditviews.py"
        Delete "$INSTDIR\source\treeflatview.py"
	Delete "$INSTDIR\source\treeformat.py"
	Delete "$INSTDIR\source\treeformats.py"
	Delete "$INSTDIR\source\treeitem.py"
	Delete "$INSTDIR\source\treeline.py"
	Delete "$INSTDIR\source\treemainwin.py"
	Delete "$INSTDIR\source\treerightviews.py"
        Delete "$INSTDIR\source\treeselection.py"
        Delete "$INSTDIR\source\treestates.py"
	Delete "$INSTDIR\source\treeview.py"
        Delete "$INSTDIR\source\treexmlparse.py"
        Delete "$INSTDIR\source\undo.py"
	Delete "$INSTDIR\source\xpm.py"

	Delete "$INSTDIR\lib\treeline.ini"

	Delete "$INSTDIR\uninstall.exe"

	; Remove shortcuts, if any
	RMDir /r "$SMPROGRAMS\${NAME}"

	; Remove directories used
        RMDir "$INSTDIR\lib\plugins"
        RMDir "$INSTDIR\lib\imageformats"
        RMDir "$INSTDIR\lib"
        RMDir "$INSTDIR\templates"
        RMDir "$INSTDIR\doc"
        RMDir "$INSTDIR\icons\toolbar\16x16"
        RMDir "$INSTDIR\icons\toolbar\32x32"
        RMDir "$INSTDIR\icons\toolbar"
        RMDir "$INSTDIR\icons\tree"
        RMDir "$INSTDIR\icons"
        RMDir "$INSTDIR\source"
	RMDir "$INSTDIR" ;remove if empty
	; RMDir /r "$INSTDIR" ;remove even if not empty

SectionEnd
