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
    
    @IBOutlet weak var textView: SimpleCustomizableTextView!
    
    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var edgeInsetsButton: UIButton!
    @IBOutlet weak var topInset: UITextField!
    @IBOutlet weak var leftInset: UITextField!
    @IBOutlet weak var bottomInset: UITextField!
    @IBOutlet weak var rightInset: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1
        textView.keyboardAppearance = .dark
        
        // AccessaryView setting
        
        textView.accessoryViewStyle = .blackOpaque
        textView.barItemTitle = "Close"
        textView.barItemTitleColor = UIColor.white
        textView.barItemTitleFont = UIFont.italicSystemFont(ofSize: 20)
        
        textView.customDelegate = self
        
        view.addSubview(textView)
        
    }
    
    @IBAction func sizeChanged(_ sender: UISlider) {
        textView.font = .systemFont(ofSize: CGFloat(sizeSlider.value))
    }
    
    @IBAction func setEdgeInsets(_ sender: UIButton) {
        if let text = topInset.text, let top = Int(text) {
            textView.textContainerInset.top = CGFloat(top)
        }
        
        if let text = leftInset.text, let left = Int(text) {
            textView.textContainerInset.left = CGFloat(left)
        }
        
        if let text = bottomInset.text, let bottom = Int(text) {
            textView.textContainerInset.bottom = CGFloat(bottom)
        }
        
        if let text = rightInset.text, let right = Int(text) {
            textView.textContainerInset.right = CGFloat(right)
        }
    }
    
}


// MARK: - SimpleCustomizableTextViewDelegate

extension ViewController: SimpleCustomizableTextViewDelegate {
    public func SimpleCustomizableTextViewShouldDone(_ textView: SimpleCustomizableTextView) -> Bool {
        // do something
        return true
    }
}
