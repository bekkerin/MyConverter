#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         Ernst Bekkering

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; open MyConverter before running this script

winactivate("My Converter") ; give focus to My Converter
$converter = WinWaitActive("My Converter")

AutoItSetOption("SendKeyDelay", 400)

global $decTestArray[4][4] = [["0","0","0","0"], _
								["1","1","1","1"], _
								["255","11111111","377","FF"], _
								["65535","1111111111111111","177777","FFFF"]]


$decimal_text = "[Name:txtDecimal]"
$binary_text = "[Name:txtBinary]"
$octal_text = "[Name:txtOctal]"
$hex_text = "[Name:txtHexadecimal]"

$dec_button = "[Name:btnDecimal]"
$binary_button = "[Name:btnBinary]"
$octal_button = "[Name:btnOctal]"
$hex_button = "[Name:btnHx]"

; testing from decimal to the others
$dec_value = Random(0,255,1) ; 1 for integer, float by default
ControlSetText("My Converter", "", $decimal_text,$dec_value); set value to decimal box
ControlClick("My Converter", "", $dec_button); click on decimal button
; now get the resulting values from the other boxes
$bin_value = ControlGetText("My Converter", "", $binary_text)
$octal_value = ControlGetText("My Converter", "", $octal_text)
$hex_value = ControlGetText("My Converter", "", $hex_text)
; print them to console (could also print to file if desired)
Consolewrite("Decimal: " & $dec_value & @CRLF)
Consolewrite("Binary: " & $bin_value & @CRLF)
Consolewrite("Octal: " & $octal_value & @CRLF)
Consolewrite("Hexadecimal: " & $hex_value & @CRLF)

; error testing - negative numbers
;$dec_value = "-1"
ControlSetText("My Converter","",$decimal_text,$dec_value)
controlclick("My Converter", "", $dec_button)

; error testing - value too large
;$dec_value = "2147483648" ; max limit is 2,147,483,647
ControlSetText("My Converter","",$decimal_text,$dec_value)
controlclick("My Converter", "", $dec_button)





;MsgBox(0,"Reading","my decimal is " & $decimal)


;100WinClose("My Converter")