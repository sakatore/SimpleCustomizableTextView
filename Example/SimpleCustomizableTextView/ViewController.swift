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
    
    let rect = CGRect(x: 10, y: 20, width: 200, height: 300)
    let textViewa = SimpleCustomizableTextView(frame: rect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.layer.borderColor = UIColor.black.cgColor
        textView.layer.borderWidth = 1
        textView.keyboardAppearance = .dark
        
        // MARK: - Placeholder setting -
        
        textView.placeholder = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        textView.customDelegate = self
        
        // MARK: - AccessaryView setting -
        
        textView.accessoryViewStyle = .blackOpaque
        textView.barItemTitle = "Close"
        textView.barItemTitleColor = UIColor.white
        textView.barItemTitleFont = UIFont.italicSystemFont(ofSize: 20)
        
        view.addSubview(textView)
        
    }
}


// MARK: - SimpleCustomizableTextViewDelegate

extension ViewController: SimpleCustomizableTextViewDelegate {
    public func SimpleCustomizableTextViewShouldDone(_ textView: SimpleCustomizableTextView) -> Bool {
        return true
    }
}
