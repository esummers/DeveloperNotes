# AppKit

## Links

Preference Panes:

- [Implementing Custom Preference Panes (Archived)](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/PreferencePanes/Tasks/Creation.html#//apple_ref/doc/uid/20000709-CJBDGJFA) – *Preference Panes may also be used within an application*

Rich Text:

- [malcommac/SwiftRichString](https://github.com/malcommac/SwiftRichString) – *`UITextView` or `NSTextView`*

## User Defaults

User defaults may use Key-Value Observing to detect remote changes.

- [Internals guide to user defaults](https://www.vadimbulavin.com/advanced-guide-to-userdefaults-in-swift/)

Example to make user defaults KeyPath compatible:

```
extension UserDefaults
{
    static let showMenuKey = "showMenu"
    @objc var showMenu: Bool {
        get { bool(forKey: Self.showMenuKey) }
        set { set(newValue, forKey: Self.showMenuKey) }
    }

    /// Find out if a key is managed by an MDM.
    var isShowMenuForced: Bool { objectIsForced(forKey: Self.showMenuKey) }
}
```

> Todo: I’m not sure if there is a way to observe a “forced” state change dynamically to update the UI. Check if there is a KVO notification on the value even if the value doesn't change.

Core Foundation:

> Todo: It may be interesting to go straight to CFPreferences instead of using UserDefaults in a Swift wrapper.  Look in to this more.

