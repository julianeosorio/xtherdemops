param (
    [string]$searchString = "Colombia tierra querida"
)

#create the chromedriver
$chromeDriver = Start-SeChrome

# Navigate to the google page
Write-Host "Opening website"
Enter-SeUrl -Driver $chromeDriver -Url 'https://www.google.com'

Write-Host "Entering the string [$searchString]"
$searchBox = Find-SeElement -Driver $chromeDriver -Name "q"
Send-SeKeys -Element $searchBox -Keys $searchString
Send-SeKeys -Element $searchBox -Keys ([OpenQA.Selenium.Keys]::Enter)

# save picture
Write-Host "Taking screenshot"
New-SeScreenshot -Driver $chromeDriver -Path "c:\xther\webPicture.png"

# Cleanup resources
$chromeDriver.close()
$chromeDriver.quit()