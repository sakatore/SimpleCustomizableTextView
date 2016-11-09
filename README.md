# SimpleCustomizableTextView

[![CI Status](http://img.shields.io/travis/Kyohei-Sakai/SimpleCustomizableTextView.svg?style=flat)](https://travis-ci.org/Kyohei-Sakai/SimpleCustomizableTextView)
[![Version](https://img.shields.io/cocoapods/v/SimpleCustomizableTextView.svg?style=flat)](http://cocoapods.org/pods/SimpleCustomizableTextView)
[![License](https://img.shields.io/cocoapods/l/SimpleCustomizableTextView.svg?style=flat)](http://cocoapods.org/pods/SimpleCustomizableTextView)
[![Platform](https://img.shields.io/cocoapods/p/SimpleCustomizableTextView.svg?style=flat)](http://cocoapods.org/pods/SimpleCustomizableTextView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

***SimpleCustomizableTextView*** can be initialized in a way same as UITextView

```swift
let rect = CGRect(x: 10, y: 20, width: 200, height: 300)
let textView = SimpleCustomizableTextView(frame: rect)
```

`SimpleCustomizableTextView` is available in Interface Builder.
Set custom class of `UITextView ` to `SimpleCustomizableTextView`

```swift
@IBOutlet weak var textView: SimpleCustomizableTextView!
```












## Requirements



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
