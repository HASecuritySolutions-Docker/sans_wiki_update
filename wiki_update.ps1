if(Test-Path /labs){
  chown -R student:student /labs/
}
if(Test-Path /root/.config/git){
  chown -R root:root /root/.config/git
}
if(Test-Path /home/student/.config/git){
  chown -R student:student /home/student/.config/git
}
if(Test-Path /labs){
  Set-Location /labs
  git reset --hard origin/master
  git pull
}
if(Test-Path /var/www/public-wiki){
  Set-Location /var/www/public-wiki
  git reset --hard origin/master
  git pull
}
if(Test-Path /var/www/public-wiki/private-labs){
  Set-Location /var/www/public-wiki/private-labs
  git reset --hard origin/master
  sudo -u student git pull
}
if((Test-Path /var/www/public-wiki/navigation.md) -and (Test-Path /var/www/public-wiki/labnav.md) -and (Test-Path /var/www/public-wiki/quicknav.md)){
  $navigation_file = Get-Content -Path /var/www/public-wiki/navigation.md | Select -Skip 2
  
  $labnav = Get-Content -Path /var/www/public-wiki/private-labs/Labs/labnav.md
  $quicknav = Get-Content -Path /var/www/public-wiki/private-labs/Labs/quicknav.md

  $new_navigation_file = $labnav
  $new_navigation_file += $navigation_file
  $new_navigation_file += $quicknav

  $new_navigation_file | Out-File -Encoding ascii /var/www/public-wiki/navigation.md -Force
}
if(Test-Path /labs){
  chown -R student:student /labs
}
