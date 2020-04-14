#Note Web Scraping could be used for not legal purposes, so please, be responsible when using this technique.
#This program was developed for study only. The developer does not take any responsability of its use.
#Many browsers allow to check html content by pressing F12. Hover over the html code to find what you are looking for.

function Set-WindowSize ([int]$x=$host.ui.rawui.windowsize.width, [int]$y=$host.ui.rawui.windowsize.heigth){
    $size=New-Object System.Management.Automation.Host.Size($x, $y)
    $host.ui.rawui.WindowSize=$size   
}
function Move-Cursor([int]$x, [int] $y) {
    $host.UI.RawUI.CursorPosition = New-Object System.Management.Automation.Host.Coordinates($x, $y) 
} 
Set-WindowSize 80 20
cls


#Copy after "-Uri" the link to weather.com
$w = Invoke-WebRequest -Uri “https://weather.com/es-ES/tiempo/hoy/l/40.42,-3.70?par=google&temp=c“
$loc = $w.AllElements | where class -EQ "today_nowcard-loc-title-wrqpper" | select outerText | ft -HideTableHeaders | Out-String  
$temp = $w.AllElements | where class -EQ "today_nowcard-temp" | select outerText | ft -HideTableHeaders | Out-String  
$desc = $w.AllElements | where class -EQ "today_nowcard-phrase" | select outerText | ft -HideTableHeaders | Out-String   
$feel = $w.AllElements | where class -EQ "today_nowcard-feels" | select outerText  | ft -HideTableHeaders | Out-String 
$var = $w.AllElements | where class -EQ "today_nowcard-hilo" | select outerText | ft -HideTableHeaders | Out-String 

$loc = $loc.Trim() #Removes the "returns" in strings
$temp = $temp.Trim()
$desc = $desc.Trim()
$feel = $feel.Trim()
$var = $var.Trim()

$yr = (Get-Date).Year
$mt = (Get-Date).Month
$dy = (Get-Date).Day
$dw = (Get-Date).DayOfWeek
$hr = (Get-Date).Hour
$mn = (Get-Date).Minute
$sd = (Get-Date).Second

write-host ""
write-host " ┌─────────────────────────────────────────────────────────────────────────┐"
write-host " │                                                                         │"
write-host " ├──────┬─────────────────────────────────┬────────────────────────────────┤"
write-host " │      │                                 │                                │"
write-host " ├──────┴─────────────────────────────────┴────────────────────────────────┤"
write-host " │                                                                         │"
write-host " └─────────────────────────────────────────────────────────────────────────┘"
write-host " ┌──────────────┬──────────────────────────────────────────────────────────┐"
write-host " │              │                                                          │"
write-host " └──────────────┴──────────────────────────────────────────────────────────┘"

Move-Cursor 19 2
write-host "The location is: " -NoNewline; write-host "$loc" -ForegroundColor Yellow
Move-Cursor 3 4
write-host "$temp" -ForegroundColor Yellow
Move-Cursor 10 4
write-host "$desc" -ForegroundColor Yellow
Move-Cursor 44 4
write-host "$feel" -ForegroundColor Yellow
Move-Cursor 3 6
write-host "$var" -ForegroundColor Yellow

Move-Cursor 3 9
write-host "$hr : " -ForegroundColor Cyan
Move-Cursor 7 9
write-host "$mn : " -ForegroundColor Cyan
Move-Cursor 12 9
write-host "$sd" -ForegroundColor Cyan
Move-Cursor 21 9
write-host "$dw" -NoNewline; write-host ":"
Move-Cursor 30 9
write-host "$dy" -ForegroundColor Cyan
Move-Cursor 41 9
write-host "Month: " -NoNewline; write-host "$mt" -ForegroundColor Cyan
Move-Cursor 56 9
write-host "Year: " -NoNewline; write-host "$yr" -ForegroundColor Cyan

Move-Cursor 2 12
pause

