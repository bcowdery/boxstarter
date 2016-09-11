Import-Module Boxstarter.Chocolatey

New-PackageFromScript -Source roles\Devenv.ps1 -PackageName BeardedDeveloper.Devenv
Install-BoxstarterPackage -Package BeardedDeveloper.Devenv
