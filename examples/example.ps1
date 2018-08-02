# comment

<#
multi
line
comment
#>

$tmp = 'string'
$tmp = "string"

$tmp = @'
mutli
"line"
strings
'@

$tmp = @"
multi
'line'
strings
"@

If (1 -lt 2) { Write-Output "Hello World!" }
