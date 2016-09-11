# Boxstarter

[Boxstarter](http://boxstarter.org/) setup scripts for setting up a customized windows environment in a completely unattended manner using PowerShell and [Chocolatey](https://chocolatey.org/) packages. This boxstarter script installs my development environment for C#.Net and Java/Scala web development. Beyond unattended software installs, boxstarter will set:

* Explorer Options: Show hidden files/folders, Show file extensions
* Taskbar Options: Small taskbar, always combine taskbar buttons
* Set PowerShell execution policy to "Unrestricted"
* Install all pending Windows Updates
* Install Microsoft Hyper-V virtualization



## Getting Started
### Web Installer

Invoke the Boxstarter WebLauncher by browsing to the URL below in Internet Explorer or by invoking it as a START command in either the CMD prompt or PowerShell:

```
START http://boxstarter.org/package/nr/url?https://github?https://raw.githubusercontent.com/geotracsystems/boxstarter/master/roles/Devenv.ps1
```

*You can use any browser that supports "Click Once" applications. This is limited to IE unless you add extensions to (Chrome)[https://chrome.google.com/webstore/detail/clickonce-for-google-chro/eeifaoomkminpbeebjdmdojbhmagnncl?hl=en] and (Firefox)[https://addons.mozilla.org/en-us/firefox/addon/microsoft-net-framework-assist/]. You can also use either the Command Line or a Powershell console, both using the same command as long as IE is your default browser.*


### Command Line
You can also run the installer scripts from a local clone of this repository using the `install [role]` command. This script will install Chocolatey and the Boxstarter shell before running the Boxstarter package.

```
> install Devenv
```


## Troubleshooting

**Allow Empty Checksums**

Occurs on newer versions of Boxstarter and Chocolatey due to a [recent Update](https://github.com/mwrock/boxstarter/issues/198). This can be fixed by downgrading Chocolatey to version 0.9.10.3.

```
choco upgrade chocolatey --version 0.9.10.3 --allow-downgrade
```
