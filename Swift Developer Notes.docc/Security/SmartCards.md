# SmartCards

## Linux

- [Debian SmartCards](https://wiki.debian.org/Smartcards)
- [Linux TPM Simulator](https://wiki.ubuntu.com/TPM/Testing) – *Only works on Intel since it starts a VM*

## FileVault 2 with SmartCards

- [SmartCard Logon for macOS](https://randomoracle.wordpress.com/2015/02/09/smart-card-logon-for-os-x-part-iii/)

Notes:
 
* This restriction only affects the unlocking portion of FileVault at boot-time - Smart card authentication can still be used after the Mac has been unlocked - this means that a restricted local account could be created solely for unlocking the FileVault login screen, after which the smart card user can login as normal at the standard login screen.

* On OS X 10.8 and below, FileVault 2 is designed to automatically log the user straight into their Desktop session after unlocking FileVault. This means the "unlocking account" will need to logout to get to the login screen after unlocking the disk: 

    * [HT4790](https://support.apple.com/kb/HT4790)

* On OS X 10.9, Apple introduced the ability to disable this behaviour and let the authorised user to only unlock the FileVault and then go straight to the login screen:

    * [HT5989](https://support.apple.com/kb/HT5989)

    * `sudo defaults write /Library/Preferences/com.apple.loginwindow DisableFDEAutoLogin -bool YES`

* For steps on setting up FileVault with Centrify group policies, see:

    * KB-2148: How to set up FileVault 2 on Mac OS X
