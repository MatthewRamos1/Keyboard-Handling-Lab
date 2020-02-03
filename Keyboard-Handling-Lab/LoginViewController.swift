//
//  LoginViewController.swift
//  Keyboard-Handling-Lab
//
//  Created by Matthew Ramos on 2/3/20.
//  Copyright © 2020 Matthew Ramos. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logoTopConstraint: NSLayoutConstraint!
    private var heightChanged: CGFloat = 0.0
    private var keyboardIsVisable = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotifications()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        unregisterForKeyboardNotifications()
    }
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    private func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc
    private func keyboardWillShow(_ notification: NSNotification) {
        
        guard let keyboardFrame = notification.userInfo?[ "UIKeyboardFrameBeginUserInfoKey"] as? CGRect else {
            return
        }
        moveKeyboardUp(keyboardFrame.size.height)
    }
    
    @objc
    private func keyboardWillHide(_ notification: NSNotification) {
        
    }
    
    private func moveKeyboardUp(_ height: CGFloat) {
        if keyboardIsVisable { return }
        keyboardIsVisable = true
        logoTopConstraint.constant -= height
        heightChanged = height
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    public func resetUI() {
        keyboardIsVisable = false
        logoTopConstraint.constant += heightChanged
    }
}


extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        resetUI()
        return true
    }

}
