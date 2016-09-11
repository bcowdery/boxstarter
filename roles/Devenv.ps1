# A BoxStarter script for use with http://boxstarter.org/WebLauncher
# Updates a Windows machine and installs a range of developer tools

# Show more info for files in Explorer
Set-WindowsExplorerOptions -EnableShowProtectedOSFiles  -EnableShowFileExtensions -EnableShowFullPathInTitleBar

# Enable remote desktop
Enable-RemoteDesktop

# Small taskbar
Set-TaskbarOptions -Size Small -Combine Always

# Allow running PowerShell scripts
Update-ExecutionPolicy Unrestricted

# Allow unattended reboots
$Boxstarter.RebootOk=$true
$Boxstarter.NoPassword=$false
$Boxstarter.AutoLogin=$true

# Update Windows and reboot if necessary
Install-WindowsUpdate -AcceptEula
if (Test-PendingReboot) { Invoke-Reboot }

# Install Visual Studio 2015
cinst VisualStudio2015Professional -packageParameters "WebTools SQL"
if (Test-PendingReboot) { Invoke-Reboot }

# VS 2015 extensions
cinst webessentials2015
cinst resharper -version 2016.2.0.0
if (Test-PendingReboot) { Invoke-Reboot }

# MS SQL Server
cinst mssqlserver2014express
cinst mssqlservermanagementstudio2014express
if (Test-PendingReboot) { Invoke-Reboot }

# Java & IntelliJ IDEA
cinst jdk8
cinst sbt
cinst intellijidea-ultimate -version 15.0

# Dev tools
cinst git
cinst git-credential-manager-for-windows
cinst gitkraken
cinst python2
cinst nodejs
cinst atom
cinst notepadplusplus
cinst fiddler4
cinst rdcman

# Browsers
cinst googlechrome
cinst firefox

# Other essential junk
cinst 7zip
cinst filezilla
cinst wincdemu
cisnt synergy
cinst adobereader
cinst dropbox

# Fun
cinst vlc
cinst spotify
cinst steam

if (Test-PendingReboot) { Invoke-Reboot }

# Configure windows Hyper-V virtualization
cinst Microsoft-Hyper-V-All -source windowsFeatures
if (Test-PendingReboot) { Invoke-Reboot }

# Cleanup
del C:\eula*.txt
del C:\install.*
del C:\vcredist.*
del C:\vc_red.*
