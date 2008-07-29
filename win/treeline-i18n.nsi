; treeline-i18n.nsi

; Created       : 2005-7-1
; By            : Doug Bell
; License       : Free to use, modify and distribute, but with no warranty.
; Last modified : 2008-06-16 by Doug Bell

; TreeLine is a great structured information storage program by Doug Bell.
; Please check the website for details and updates <http://www.bellz.org/>.

;--------------------------------

!include "MUI.nsh"


; The name of the installer

!define NAME "TreeLine"
!define VERSION "1.2.0a"


Name "${NAME} Translations ${VERSION} by Doug Bell"


; The file to write
OutFile "treeline-i18n-${VERSION}.exe"
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

; !define MUI_COMPONENTSPAGE
; !define MUI_COMPONENTSPAGE_SMALLDESC
; !define MUI_LICENSEPAGE_TEXT_BOTTOM "Press Continue to install."
;!define MUI_LICENSEPAGE_BUTTON "Continue"

;!insertmacro MUI_PAGE_LICENSE ".\doc\LICENSE"
; !insertmacro MUI_PAGE_COMPONENTS
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
Section "Translation Files (required)" translations

	SectionIn 1 RO

	; Set output path to the translation directory.
	SetOutPath "$INSTDIR\lib\translations"

	; Put files there
        ;File ".\translations\treeline_de.ts"
        ;File ".\translations\treeline_de.qm"
        ;File ".\translations\treeline_es.ts"
        ;File ".\translations\treeline_es.qm"
        File ".\translations\treeline_fr.ts"
        File ".\translations\treeline_fr.qm"
        ;File ".\translations\treeline_pt.ts"
        ;File ".\translations\treeline_pt.qm"
        ;File ".\translations\treeline_ru.ts"
        ;File ".\translations\treeline_ru.qm"
	;File ".\translations\qt_de.qm"
        ;File ".\translations\qt_es.qm"
	File ".\translations\qt_fr.qm"
        ;File ".\translations\qt_pt.qm"
        ;File ".\translations\qt_ru.qm"

        ; Set output path to the doc install directory.
        SetOutPath "$INSTDIR\doc"

	; Put files there
        ;File ".\translations\README_de.html"
        ;File ".\translations\readme_de.trl"
        ;File ".\translations\README_es.html"
        ;File ".\translations\readme_es.trl"
        File ".\translations\README_fr.html"
        File ".\translations\readme_fr.trl"
        ;File ".\translations\README_pt.html"
        ;File ".\translations\readme_pt.trl"
        ;File ".\translations\README_ru.html"
        ;File ".\translations\readme_ru.trl"

	; Write the installation path into the registry
	; WriteRegStr HKLM "SOFTWARE\${NAME}" "Install_Dir" "$INSTDIR"

	; Write the uninstall keys for Windows
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}-i18n" "DisplayName" "${NAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}-i18n" "UninstallString" '"$INSTDIR\uninstall-i18n.exe"'
	WriteUninstaller "uninstall-i18n.exe"

SectionEnd

;--------------------------------
;Descriptions

LangString DESC_translations ${LANG_ENGLISH} "TreeLine translation files."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${translations} $(DESC_translations)
!insertmacro MUI_FUNCTION_DESCRIPTION_END


;--------------------------------

; Uninstaller

Section "Uninstall"

	; Remove files and uninstaller
	Delete "$INSTDIR\lib\translations\treeline_de.ts"
        Delete "$INSTDIR\lib\translations\treeline_de.qm"
        Delete "$INSTDIR\lib\translations\qt_de.qm"
	Delete "$INSTDIR\lib\translations\treeline_es.ts"
        Delete "$INSTDIR\lib\translations\treeline_es.qm"
        Delete "$INSTDIR\lib\translations\qt_es.qm"
	Delete "$INSTDIR\lib\translations\treeline_fr.ts"
        Delete "$INSTDIR\lib\translations\treeline_fr.qm"
        Delete "$INSTDIR\lib\translations\qt_fr.qm"
	Delete "$INSTDIR\lib\translations\treeline_pt.ts"
        Delete "$INSTDIR\lib\translations\treeline_pt.qm"
        Delete "$INSTDIR\lib\translations\qt_pt.qm"
	Delete "$INSTDIR\lib\translations\treeline_ru.ts"
        Delete "$INSTDIR\lib\translations\treeline_ru.qm"
        Delete "$INSTDIR\lib\translations\qt_ru.qm"

        Delete "$INSTDIR\doc\README_de.html"
	Delete "$INSTDIR\doc\readme_de.trl"
        Delete "$INSTDIR\doc\README_es.html"
	Delete "$INSTDIR\doc\readme_es.trl"
        Delete "$INSTDIR\doc\README_fr.html"
	Delete "$INSTDIR\doc\readme_fr.trl"
        Delete "$INSTDIR\doc\README_pt.html"
	Delete "$INSTDIR\doc\readme_pt.trl"
        Delete "$INSTDIR\doc\README_ru.html"
	Delete "$INSTDIR\doc\readme_ru.trl"

        Delete "$INSTDIR\uninstall-i18n.exe"

	; Remove directories used
        RMDir "$INSTDIR\lib\translations"

SectionEnd
