#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Ernst Bekkering

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; open MyConverter before running this script

#include<Array.au3> ; needed for arrays of test values

winactivate("My Converter") ; give focus to My Converter
$converter = WinWaitActive("My Converter")

AutoItSetOption("SendKeyDelay", 400)

$decimal_text = "[Name:txtDecimal]"
$binary_text = "[Name:txtBinary]"
$octal_text = "[Name:txtOctal]"
$hex_text = "[Name:txtHex]"

$dec_button = "[Name:btnDecimal]"
$binary_button = "[Name:btnBinary]"
$octal_button = "[Name:btnOctal]"
$hex_button = "[Name:btnHx]"

; testing from decimal to the others
Local $decValues[5] = [0,1,128,254,255]
ConsoleWrite(@CRLF & "Conversions from decimal:" & @CRLF)
For $x= 0 to UBound($decValues) -1 ; size of array minus 1
	$dec_value = $decValues[$x]
	ControlSetText("My Converter", "", $decimal_text,$dec_value); set value to decimal box
	ControlClick("My Converter", "", $dec_button); click on decimal button
	; now get the resulting values from the other boxes
	$bin_value = ControlGetText("My Converter", "", $binary_text)
	$octal_value = ControlGetText("My Converter", "", $octal_text)
	$hex_value = ControlGetText("My Converter", "", $hex_text)
	; print them to console (could also print to file if desired)
	Consolewrite("Decimal: " & $dec_value & @TAB  & "Binary: " & $bin_value & @TAB  & "Octal: " & $octal_value & @TAB  & "Hex: " & $hex_value & @CRLF)
Next

; testing from binary to the others
Local $binValues[5] = [0,1,1111,11111110,11111111]
ConsoleWrite(@CRLF & "Conversions from binary:" & @CRLF)
For $x= 0 to UBound($binValues) -1 ; size of array minus 1
	$bin_value = $binValues[$x]
	ControlSetText("My Converter", "", $binary_text,$bin_value); set value to binary box
	ControlClick("My Converter", "", $binary_button); click on decimal button
	; now get the resulting values from the other boxes
	$dec_value = ControlGetText("My Converter", "", $decimal_text)
	$octal_value = ControlGetText("My Converter", "", $octal_text)
	$hex_value = ControlGetText("My Converter", "", $hex_text)
	; print them to console (could also print to file if desired)
	Consolewrite("Decimal: " & $dec_value & @TAB  & "Binary: " & $bin_value & @TAB  & "Octal: " & $octal_value & @TAB  & "Hex: " & $hex_value & @CRLF)
Next







;MsgBox(0,"Reading","my decimal is " & $decimal)

;$dec_value = Random(0,255,1) ; 1 for integer, float by default

;100WinClose("My Converter")