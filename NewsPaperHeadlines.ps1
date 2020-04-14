#Note Web Scraping could be used for not legal purposes, so please, be responsible when using this technique.
#This program was developed for study only. The developer does not take any responsability of its use.
#Many browsers allow to check html content by pressing F12. Hover over the html code to find what you are looking for.

cls

#El Pais Newspaper
$w = Invoke-WebRequest -Uri “https://elpais.com/“
$allheadlines = $w.AllElements | where tagname -EQ "H2" | select innerText
write-host "El Pais" -ForegroundColor Yellow
$allheadlines[0..2] | ft -HideTableHeaders  #Take only the first three

#El Mundo Newspaper
$w = Invoke-WebRequest -Uri “https://www.elmundo.es/“
$allheadlines = $w.AllElements | where tagname -EQ "header" | select innerText
write-host "El Mundo" -ForegroundColor Yellow
$allheadlines[1..3] | ft -HideTableHeaders  #Take only the first three (First Header of 'El mundo' is blank)

#El ABC Newspaper
$w = Invoke-WebRequest -Uri “https://www.abc.es/“
$allheadlines = $w.AllElements | where tagname -EQ "h3" | select innerText
write-host "El ABC" -ForegroundColor Yellow
$allheadlines[1..3] | ft -HideTableHeaders  #Take only the first three (First Header of 'El ABC' is blank)
pause


