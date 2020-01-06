# Installer Windows Powershell
# Copyright © 2019 Sylvain Braine
# 
# This script install engineering and programming software package.

param ($godev)
$testchoco = powershell choco -v
$testgo = powershell go version

Write-Output "Welcome to Sorane application installer"

# Check and Install Chocolatey
if(-not($testchoco)){
    Write-Output "Seems Chocolatey is not installed, installing now ..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else{
    Write-Output "Chocolatey Version $testchoco is already installed"
}

# Install apps
for ( $i = 0; $i -lt $args.count; $i++ ) {
  powershell choco install "$($args[$i]).config"
}

# Install Golang binaries
if($godev) {
  if(-not($testgo)){
    Write-Output "Seems Go is not installed, installing now ..."
    powershell choco install go
  }
  else{
    Write-Output "Go Version $testgo is already installed"
  }
  Write-Output "Install Golang binaries ..."
  Get-Content requirements.txt | Foreach-Object{
    powershell go get -u "$_"
  }
}