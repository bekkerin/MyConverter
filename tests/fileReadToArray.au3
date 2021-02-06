#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

; need the File library
#include <File.au3>
#include <Array.au3>
#include <MsgBoxConstants.au3>

$sFilePath = "testingV00.csv"

local $aArray = 0

if not _FileReadToArray($sFilePath,$aArray,0) Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error reading the file. @error: " & @error) ; An error occurred reading the current script file.
EndIf

_ArrayDisplay($aArray)