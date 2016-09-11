Import-Module Boxstarter.Chocolatey

New-PackageFromScript -Source roles\Devenv.ps1 -PackageName Geotrac.Devenv
Install-BoxstarterPackage -Package Geotrac.Devenv
