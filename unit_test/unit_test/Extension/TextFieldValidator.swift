//
//  File.swift
//  unit_test
//
//  Created by Alex Paramonov on 7.01.22.
//

import Foundation
import UIKit


protocol FieldValidator {
     
     func validateTextField (LoginTF: UITextField, passwordTF: UITextField) -> Bool
     
     func asyncValidateTextField (LoginTF: UITextField, passwordTF: UITextField,  completion: @escaping (Bool) -> Void)
}

class TextFieldValidator:  FieldValidator{
     
     func validateTextField (LoginTF: UITextField, passwordTF: UITextField) -> Bool {
          
          return LoginTF.hasText && passwordTF.hasText
     }
     
     func asyncValidateTextField (LoginTF: UITextField, passwordTF: UITextField,  completion: @escaping (Bool) -> Void) {
          
          DispatchQueue.global(qos: .background).asyncAfter(deadline: .now () + 1.5 , execute: {
          
               DispatchQueue.main.async {
                    let result = LoginTF.hasText && passwordTF.hasText
                    completion(result)
               }
               
          })
     }
     
}
