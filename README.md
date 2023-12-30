# What, Why, How
### What
This script was made to make a QoL improvement for windows user when using "Windows" as their primary working device.

### Why
I, as Windows user, who already tried mac as development machine and using zsh as primary terminal app, feels default windows cmd/powershell is less powerful, therefore this script will make powershell feels like zsh. Also, when we are using mac/linux, there is apt/yum/brew to take care of app installations.

This script was inspired by [DevMyMac](https://github.com/adamisntdead/DevMyMac)

### How
This script will automatically install following apps:
- [scoop](https://scoop.sh) -> command-line installer, in short just treat it as apt/yum/brew
- [aria2](https://aria2.github.io/) -> support app for scoop, kind of command line download manager
- [git](https://gitforwindows.org/) -> git command
- [oh-my-posh](https://ohmyposh.dev/) -> zsh-like theme for powershell

And configure:
- git username & email (optional)
- oh-my-posh theme (robbyrussel)
- up and down handler using history search handler (lets say you have already use "git commit" command, now you only need to write "git c" and press up to find previous git commit command)

# How to Use
1. Install [Powershell 7](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2#msi) (scoop can use powershell 5, but personally recommend powershell 7)
2. (Optional) Install [Windows Terminal](https://apps.microsoft.com/store/detail/9N0DX20HK701) (via microsoft store)
3. Open Powershell/Windows Terminal
4. insert this command:
```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm https://raw.githubusercontent.com/nridwan/DevMyWin/main/setup.ps1 | iex
```
5. Follow the optional question
6. Done

# What's next
I'll create more additional scripts to install development pack of things (most of them just scoop install of collections):
- [ ] Android
- [ ] Javascript
- [ ] Go
- [ ] Flutter

I'm open to request, as long as it's available in main/extras scoop bucket I'll be able to add it. and if it's not, as long as I can identify it as portable apps (not leaving junk configuration anywhere at system), I'll try to add it.
