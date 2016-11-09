//
//  ViewController.swift
//  SimpleCustomizableTextView
//
//  Created by Kyohei-Sakai on 11/09/2016.
//  Copyright (c) 2016 Kyohei-Sakai. All rights reserved.
//

import UIKit
import SimpleCustomizableTextView

class ViewController: UIViewController {
    
    private var textView = SimpleCustomizableTextView(frame: .zero)
    private var textField = UITextField(frame: .zero)
    
    private let width: CGFloat = 300
    private let textViewHeight: CGFloat = 300
    private let textFieldhHeight: CGFloat = 50
    private let buttonHeight: CGFloat = 50
    private var centerPositionX: CGFloat { return self.view.frame.width / 2}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextView()
        configureTextField()
        configureButton()
        
    }
    
    private func configureTextView() {
        textView.frame.size = CGSize(width: width, height: textViewHeight)
        textView.frame.origin = CGPoint(x: centerPositionX - width / 2, y: 100)
        //        textView.text = "Fist text"
        //        textView.textAlignment = .center
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1
        //        textView.font = .systemFont(ofSize: 22.0)
        textView.keyboardAppearance = .dark
        
        textView.placeholder = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        textView.customDelegate = self
        textView.barItemTitle = "Hello"
        //        textView.accessoryViewIsHidden = true
        textView.accessoryViewStyle = .blackOpaque
        textView.barItemTitleColor = UIColor.yellow
        textView.barItemTitleFont = UIFont.italicSystemFont(ofSize: 20)
        //        textView.font = UIFont.italicSystemFont(ofSize: 30)
        
        view.addSubview(textView)
    }
    
    private func configureTextField() {
        textField.frame.size = CGSize(width: width, height: textFieldhHeight)
        textField.frame.origin = CGPoint(x: centerPositionX - width / 2, y: textView.frame.origin.y + textViewHeight)
        textField.text = "Fist text"
        textField.placeholder = "Placeholder"
        textField.borderStyle = .line
        textField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidChanged(_:)), name: .UITextFieldTextDidChange, object: nil)
        
        view.addSubview(textField)
    }
    
    @objc private func textFieldTextDidChanged(_ notification: NSNotification) {
        print("Notification->UITextFieldTextDidChange!")
    }
    
    private func configureButton() {
        let size = CGSize(width: width, height: buttonHeight)
        let point = CGPoint(x: centerPositionX - width / 2, y: textField.frame.origin.y + textFieldhHeight)
        let button = UIButton(frame: CGRect(origin: point, size: size))
        button.setTitle("Button", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.setTitle("Pushed", for: .highlighted)
        button.setTitleColor(UIColor.blue, for: .highlighted)
        button.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    @objc private func tapButton(_ sender: UIButton) {
        print("TapButton!")
        // textを追加
        //        textView.text = textView.text + "+addText"
        //        textField.text = textField.text ?? "" + "+addText"
        
        // textSizeを変更
        if let text = textField.text, let size = Int(text) {
            textView.font = .systemFont(ofSize: CGFloat(size))
        }
        
        // textContainerInsetのtopを変更
        //        if let text = textField.text, let top = Int(text) {
        //            textView.textContainerInset.top = CGFloat(top)
        //        }
    }
    
}


// MARK: - delegate methods

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}


//extension ViewController: UITextViewDelegate {
//
//    func textViewDidChange(_ textView: UITextView) {
//        print("Delegate->textViewDidChange")
//    }
//
//}


extension ViewController: CustomTextViewDelegate {
    
    func customTextViewShouldDone(_ textView: CustomTextView) -> Bool {
        print("Delegate->customTextViewShouldDone")
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("Delegate->customTextViewDidChange")
    }
    
}
