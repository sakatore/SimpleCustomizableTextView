# SimpleCustomizableTextView


![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)
[![License](https://img.shields.io/cocoapods/l/SimpleCustomizableTextView.svg?style=flat)](http://cocoapods.org/pods/SimpleCustomizableTextView)
[![Language](http://img.shields.io/badge/language-swift 3.0-orange.svg?style=flat
)](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)

## QuickExample

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```swift

    @IBOutlet weak var textView: SimpleCustomizableTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1
        textView.keyboardAppearance = .dark
        
        // MARK: - Placeholder setting -
        
        textView.placeholder = "placeholder text"
        textView.customDelegate = self
        
        // MARK: - AccessaryView setting -
        
        textView.accessoryViewStyle = .blackOpaque
        textView.barItemTitle = "Close"
        textView.barItemTitleColor = UIColor.white
        textView.barItemTitleFont = UIFont.italicSystemFont(ofSize: 20)
        
        view.addSubview(textView)
        
    }
```


### Initializer in programmatically

***SimpleCustomizableTextView*** can be initialized in a way same as UITextView

```swift
let textView = SimpleCustomizableTextView(frame: CGRect(x: 10, y: 20, width: 200, height: 300))
```

### SimpleCustomizableTextViewDelegate

Asks the delegate if the `SimpleCustomizableTextView` should process the pressing of the bar button.
`true` if the `SimpleCustomizableTextView` should implement its default behavior for the bar button; otherwise, `false`.

```swift
extension ViewController: SimpleCustomizableTextViewDelegate {
    public func SimpleCustomizableTextViewShouldDone(_ textView: SimpleCustomizableTextView) -> Bool {
        return true
    }
}

```

## Requirements

- iOS 8.0+
- Xcode 8.0+
- Swift 3.0+



## Installation

SimpleCustomizableTextView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:


```ruby
pod "SimpleCustomizableTextView"
```

## Author

Kyohei-Sakai, nico_f00tb@yahoo.co.jp

## License

SimpleCustomizableTextView is available under the MIT license. See the LICENSE file for more info.
