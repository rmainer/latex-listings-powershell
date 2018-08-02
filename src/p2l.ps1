# Extracts PowerShell aliases, cmdlets and functions for the listings package (https://ctan.org/pkg/listings).

$texfile = 'latex-listings-powershell.tex'

$header = @"
\lstdefinelanguage{PowerShell}{`n
"@

$footer = @'
	morekeywords={Do, Else, For, ForEach, If, In, Until, While},
	alsodigit={-},
	sensitive=false,
	morecomment=[l]{\#},
	morecomment=[n]{<\#}{\#>},
	morestring=[b]{"},
	morestring=[b]{'},
	morestring=[s]{\@'}{'\@},
	morestring=[s]{\@"}{"\@}
}
'@

function convert($file) {
    Get-Content -Path $file | Sort-Object -Unique | Set-Content $file
    (Get-Content -Path $file) `
        -replace '[A-Z]:', '' `
        -replace 'cd(\.\.)?\\?', '' `
        -replace '\s+$', '' `
        | Where-Object {$_.trim() -ne "" } | Set-Content $file
    (Get-Content -Path $file) -join ',' | Set-Content $file
}

Get-Command -Type Cmdlet | Sort-Object -Property Name -Unique | Format-Table -Property Name -HideTableHeaders > cmdlets.txt
Get-Command -Type Function | Sort-Object -Property Name -Unique | Format-Table -Property Name -HideTableHeaders > functions.txt
Get-Command -Type Alias | Select ResolvedCommand | Sort-Object -Property ResolvedCommand -Unique | Format-Table -Property ResolvedCommand -HideTableHeaders > aliases.txt

convert('aliases.txt')
convert('cmdlets.txt')
convert('functions.txt')

$aliases = Get-Content 'aliases.txt'
$cmdlets = Get-Content 'cmdlets.txt'
$functions = Get-Content 'functions.txt'

$keywords = "`tmorekeywords={`n`t`t" + $aliases + "`n`t},`n"
$keywords = $keywords + "`tmorekeywords={`n`t`t" + $cmdlets + "`n`t},`n"
$keywords = $keywords + "`tmorekeywords={`n`t`t" + $functions + "`n`t},`n"

$content = $header + $keywords + $footer

Set-Content -Path $texfile -Value $content

Remove-Item 'aliases.txt', 'cmdlets.txt', 'functions.txt'