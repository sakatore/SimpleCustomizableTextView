//
//  SimpleCustomizableTextView.swift
//  Pods
//
//  Created by 酒井恭平 on 2016/11/09.
//
//

import UIKit

// MARK: - SimpleCustomizableTextViewDelegate -

public protocol SimpleCustomizableTextViewDelegate: UITextViewDelegate {
    func SimpleCustomizableTextViewShouldDone(_ textView: SimpleCustomizableTextView) -> Bool
}


// MARK: - SimpleCustomizableTextView -

@IBDesignable
public class SimpleCustomizableTextView: UITextView {
    
    // MARK: - fileprivate properties -
    
    fileprivate let placeholderLabel = UILabel()
    // adjust label position
    fileprivate let paddingLeft: CGFloat = 2
    
    fileprivate let notificatin = NotificationCenter.default
    
    fileprivate var doneButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: #selector(doneButtonDidPush(_:)))
    
    
    // MARK: - Initialization -
    
    override init(frame: CGRect, textContainer: NSTextContainer? = nil) {
        super.init(frame: frame, textContainer: textContainer)
        observeTextDidChange()
        configurePlaceholder()
        configureAccessoryView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        observeTextDidChange()
        configurePlaceholder()
        configureAccessoryView()
    }
    
    deinit {
        notificatin.removeObserver(self)
    }
    
    
    // MARK: - override properties -
    
    override public var frame: CGRect {
        didSet {
            adjustLabelToFit()
        }
    }
    
    override public var text: String! {
        didSet {
            placeholderIsHidden()
        }
    }
    
    override public var textAlignment: NSTextAlignment {
        didSet {
            placeholderLabel.textAlignment = textAlignment
        }
    }
    
    override public var font: UIFont? {
        didSet {
            placeholderLabel.font = font
            adjustLabelToFit()
        }
    }
    
    override public var textContainerInset: UIEdgeInsets {
        didSet {
            placeholderLabel.frame.origin = CGPoint(x: textContainerInset.left + paddingLeft, y: textContainerInset.top)
            
            if oldValue.left != textContainerInset.left {
                placeholderLabel.frame.size.width = placeholderLabel.frame.width + oldValue.left - textContainerInset.left
            }
            
            if oldValue.right != textContainerInset.right {
                placeholderLabel.frame.size.width = placeholderLabel.frame.width + oldValue.right - textContainerInset.right
            }
            
        }
    }
    
    
    // MARK: - public properties -
    
    // default is nil. string is drawn 70% gray
    @IBInspectable public var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
            adjustLabelToFit()
        }
    }
    
    @IBInspectable public let accessoryView = UIToolbar()
    
    @IBInspectable public var accessoryViewIsHidden: Bool = false {
        didSet {
            accessoryView.isHidden = accessoryViewIsHidden
        }
    }
    
    @IBInspectable public var barItemTitleColor: UIColor = UIColor.black {
        didSet {
            doneButton.setTitleTextAttributes([
                NSForegroundColorAttributeName: barItemTitleColor, NSFontAttributeName: barItemTitleFont], for: .normal)
        }
    }
    
    @IBInspectable public var barItemTitle: String = "Done" {
        didSet {
            doneButton.title = barItemTitle
        }
    }
    
    public var accessoryViewStyle: UIBarStyle = .default {
        didSet {
            accessoryView.barStyle = accessoryViewStyle
        }
    }
        
    public var barItemTitleFont: UIFont = .systemFont(ofSize: UIFont.buttonFontSize) {
        didSet {
            doneButton.setTitleTextAttributes([
                NSFontAttributeName: barItemTitleFont, NSForegroundColorAttributeName: barItemTitleColor], for: .normal)
        }
    }
    
    public weak var customDelegate: SimpleCustomizableTextViewDelegate? {
        didSet {
            delegate = customDelegate
        }
    }
    
    
    
}


// MARK: - private methods -

private extension SimpleCustomizableTextView {
    
    // MARK: - Placeholder -
    
    @objc func controlPlaceholder(_ notification: Notification) {
        placeholderIsHidden()
    }
    
    func observeTextDidChange() {
        notificatin.addObserver(self, selector: #selector(controlPlaceholder(_:)), name: .UITextViewTextDidChange, object: nil)
    }
    
    func placeholderIsHidden() {
        placeholderLabel.isHidden = !text.isEmpty
    }
    
    func configurePlaceholder() {
//        placeholderLabel.backgroundColor = UIColor.clear
        placeholderLabel.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        placeholderLabel.textColor = UIColor.gray.withAlphaComponent(0.7)
        placeholderLabel.numberOfLines = 0
        placeholderLabel.lineBreakMode = .byWordWrapping
        
        placeholderLabel.font = font ?? .systemFont(ofSize: 12)
        placeholderLabel.textAlignment = textAlignment
        placeholderLabel.frame.origin = CGPoint(x: textContainerInset.left + paddingLeft, y: textContainerInset.top)
        placeholderIsHidden()
        
        self.addSubview(placeholderLabel)
    }
    
    func adjustLabelToFit() {
        placeholderLabel.frame.size.width = textContainer.size.width - paddingLeft * 2
        placeholderLabel.sizeToFit()
    }
    
    
    // MARK: - AccessaryView -
    
    @objc func doneButtonDidPush(_ sender: UIButton) {
        if customDelegate?.SimpleCustomizableTextViewShouldDone(self) != false {
            self.resignFirstResponder()
        }
    }
    
    func configureAccessoryView() {
        doneButton.title = barItemTitle
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        accessoryView.setItems([spacer, doneButton], animated: false)
        
        self.inputAccessoryView = accessoryView
        accessoryView.sizeToFit()
        accessoryView.isHidden = accessoryViewIsHidden
        accessoryView.barStyle = accessoryViewStyle
    }
    
}




















