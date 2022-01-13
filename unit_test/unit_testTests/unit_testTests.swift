//
//  unit_testTests.swift
//  unit_testTests
//
//  Created by Alex Paramonov on 6.01.22.
//

import XCTest
@testable import unit_test

class unit_testTests: XCTestCase {
     
     var textFieldValidator: TextFieldValidator!
     
    override func setUpWithError() throws {
         
		textFieldValidator = TextFieldValidator()
    }

    override func tearDownWithError() throws {
         textFieldValidator = nil
    }

    func testValidatorCorrectWithEmptyValues() throws {
         // Given
         let textFieldLogin = UITextField()
         let textFieldPassword = UITextField()
         let expectedResult = false
         var validateResult: Bool
         // When
         validateResult = textFieldValidator.validateTextField(LoginTF: textFieldLogin, passwordTF: textFieldPassword)
         
         // Then
         XCTAssertEqual(expectedResult, validateResult)
    }
     
     func testValidatorCorrectWithValues() throws {
          // Given
          let textFieldLogin = UITextField()
          textFieldLogin.text = "login"
          let textFieldPassword = UITextField()
          textFieldPassword.text = "password"
          let expectedResult = true
          var validateResult: Bool
          // When
          validateResult = textFieldValidator.validateTextField(LoginTF: textFieldLogin, passwordTF: textFieldPassword)
          
          // Then
          XCTAssertEqual(expectedResult, validateResult)
     }
     
     func testAsyncValidatorCorrectWithValues() throws {
          // Given
          let textFieldLogin = UITextField()
          textFieldLogin.text = "login"
          let textFieldPassword = UITextField()
          textFieldPassword.text = "password"
          let expectedResult = true
          var validateResult: Bool?
          let validatorExpectetion = expectation(description: "Expectetion in " +  #function)
          
         // When
          textFieldValidator.asyncValidateTextField(LoginTF: textFieldLogin, passwordTF: textFieldPassword, completion: { (isValid) in
               validateResult = isValid
               
               validatorExpectetion.fulfill()
          })
          
          // Then
          
          waitForExpectations(timeout: 2.0) { (error) in
               if error != nil {
                    XCTFail()
               }
               XCTAssertEqual(expectedResult, validateResult)
          }
         
     }



    

}
