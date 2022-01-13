//
//  ViewController.swift
//  unit_test
//
//  Created by Alex Paramonov on 6.01.22.
//

import UIKit

class UserViewController: UIViewController, UITextFieldDelegate {
     
     @IBOutlet weak var textFieldLogin: UITextField!
     @IBOutlet weak var textFieldPassword: UITextField!
     @IBOutlet weak var labelError: UILabel!
     
     var textFieldValidator = TextFieldValidator()
     
     override func viewDidLoad() {
          super.viewDidLoad()
          setupTextField()
     }
     
     func setupTextField() {
          textFieldLogin.returnKeyType = .next
          textFieldPassword.returnKeyType = .done
          textFieldLogin.delegate = self
          textFieldPassword.delegate = self
          
          textFieldLogin.accessibilityIdentifier = "textFieldLogin"
          textFieldPassword.accessibilityIdentifier = "textFieldPassword"
          labelError.accessibilityIdentifier = "labelError"
     }
     
     
     //MARK: - UITextViewDelegate
     
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          
          switch textField {
          case textFieldLogin :
               textFieldPassword.becomeFirstResponder()
          case textFieldPassword:
               guard textFieldValidator.validateTextField(LoginTF: textFieldLogin, passwordTF: textFieldPassword) else {
                    setLabelError()
                    break
               }
               
               toNextScreen()
          default: break
          }
          return true
     }
     
     func toNextScreen() {
          
          self.navigationController?.pushViewController(getViewController("MainViewController", nameViewController: "MainViewController"), animated: true)
          labelError.text = ""
     }
     
     private func setLabelError() {
          
          labelError.text = "Введите имя и пароль"
          labelError.textColor  = .red
     }
}

