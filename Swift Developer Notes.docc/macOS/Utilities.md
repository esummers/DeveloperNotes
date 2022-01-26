# Utilities

A collection of sample code.

## Timer

*For backwards compatibility with older operating systems.*

```swift
import Foundation

extension Timer {
    /// Call a block from a scheduled timer. Equivalent to `Timer.scheduledTimer(...)`.
    ///
    /// Needed for backwards compatibility with macOS 10.10 and 10.11.
    public static func timerWithTimeInterval(_ interval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Void) -> Timer {
        if #available(macOS 10.12, *) {
            return Timer(timeInterval: interval, repeats: repeats, block: block)
        } else {
            return Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(_executeBlock(timer:)), userInfo: block, repeats: repeats)
        }
    }
    
    @objc func _executeBlock(timer: Timer) {
        let block = timer.userInfo as! (Timer) -> Void
        block(timer)
    }
}
```

