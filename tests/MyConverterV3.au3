#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Ernst Bekkering

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------
#include <File.au3>
#include <Array.au3>
#include <MsgBoxConstants.au3>

; open MyConverter before running this script
winactivate("My Converter") ; give focus to My Converter
$converter = WinWaitActive("My Converter")

AutoItSetOption("SendKeyDelay", 400)

$sFilePath = "testingV00.csv"
local $aArray ; not necessary to set size of array


if not _FileReadToArray($sFilePath,$aArray, 2, ",") Then
	MsgBox($MB_SYSTEMMODAL, "", "There was an error reading the file. @error: " & @error) ; An error occurred reading the current script file.
EndIf
;_ArrayDisplay($aArray) ; just to check if file shows right. Need to close popup before script continues

#cs
For $row in $aArray
	For $field in $row
		ConsoleWrite($field &@CRLF)
	Next
Next
#ce

; define the controls - text boxes and buttons
$decimal_text = "[Name:txtDecimal]"
$binary_text = "[Name:txtBinary]"
$octal_text = "[Name:txtOctal]"
$hex_text = "[Name:txtHex]"
$dec_button = "[Name:btnDecimal]"
$binary_button = "[Name:btnBinary]"
$octal_button = "[Name:btnOctal]"
$hex_button = "[Name:btnHx]"
$close_button= "[Name:btnClose]"

For $row in $aArray
	$decInput = $row[1]
	$binaryInput = $row[2]
	$octalInput = $row[3]
	$hexInput = $row[4]
	$decOutput = $row[6]
	$binOutput = $row[7]
	$octalOutput = $row[8]
	$hexOutput = $row[9]

	If $decInput == "Decimal" Then
		ContinueLoop
	EndIf

	; if we check decimal input and button 1
	If $decInput <> "" Then
		ControlSetText("My Converter", "", $decimal_text,$decInput); set value to decimal box
		ControlClick("My Converter", "", $dec_button); click on decimal button
		; now get the resulting values from the other boxes
		$bin_value = ControlGetText("My Converter", "", $binary_text)
		$octal_value = ControlGetText("My Converter", "", $octal_text)
		$hex_value = ControlGetText("My Converter", "", $hex_text)
		if $bin_value == $binOutput And $octal_value == $octalOutput And $hex_value == $hexOutput Then
			ConsoleWrite("Decimal input " & $decInput & " correct" & @CRLF)
		Else
			ConsoleWrite($decInput & " does not work")
		EndIf
	EndIf

	; if we check binary input and button 2
	If $binaryInput <> "" Then
		ControlSetText("My Converter", "", $binary_text,$binaryInput); set value to decimal box
		ControlClick("My Converter", "", $binary_button); click on decimal button
		; now get the resulting values from the other boxes
		$dec_value = ControlGetText("My Converter", "", $decimal_text)
		$octal_value = ControlGetText("My Converter", "", $octal_text)
		$hex_value = ControlGetText("My Converter", "", $hex_text)
		if $dec_value == $decOutput And $octal_value == $octalOutput And $hex_value == $hexOutput Then
			ConsoleWrite("Binary input " & $binaryInput & " correct" & @CRLF)
		Else
			ConsoleWrite($binaryInput & " does not work")
		EndIf
	EndIf

	; if we check octal input and button 3
	If $octalInput <> "" Then
		ControlSetText("My Converter", "", $octal_text,$octalInput); set value to decimal box
		ControlClick("My Converter", "", $octal_button); click on decimal button
		; now get the resulting values from the other boxes
		$dec_value = ControlGetText("My Converter", "", $decimal_text)
		$bin_value = ControlGetText("My Converter", "", $binary_text)
		$hex_value = ControlGetText("My Converter", "", $hex_text)
		if $bin_value == $binOutput And $dec_value == $decOutput And $hex_value == $hexOutput Then
			ConsoleWrite("Octal input " & $octalInput & " correct" & @CRLF)
		Else
			ConsoleWrite($octalInput & " does not work")
		EndIf
	EndIf

	; if we check hex input and button 4
	If $hexInput <> "" Then
		ControlSetText("My Converter", "", $hex_text,$hexInput); set value to decimal box
		ControlClick("My Converter", "", $hex_button); click on decimal button
		; now get the resulting values from the other boxes
		$dec_value = ControlGetText("My Converter", "", $decimal_text)
		$bin_value = ControlGetText("My Converter", "", $binary_text)
		$octal_value = ControlGetText("My Converter", "", $octal_text)
		if $bin_value == $binOutput And $octal_value == $octalOutput And $dec_value == $decOutput Then
			ConsoleWrite("Hex input " & $hexInput & " correct" & @CRLF)
		Else
			ConsoleWrite($hexInput & " does not work" & @CRLF)
		EndIf
	EndIf

Next


;100WinClose("My Converter")