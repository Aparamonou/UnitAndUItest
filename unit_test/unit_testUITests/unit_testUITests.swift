//
//  unit_testUITests.swift
//  unit_testUITests
//
//  Created by Alex Paramonov on 6.01.22.
//

import XCTest

class unit_testUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testError() throws {
        let app = XCUIApplication()
     	app.launch()
         
         app.textFields["textFieldLogin"].tap()
         app.textFields["textFieldLogin"].typeText("")
         
         app.buttons["Next:"].tap()
         
         app.textFields["textFieldPassword"].typeText("")
         
         app.buttons["Done"].tap()
     
         
         XCTAssert(app.staticTexts["Введите имя и пароль"].waitForExistence(timeout: 1.0))
    }
     
     func testPushNextScreen() throws {
         let app = XCUIApplication()
           app.launch()
          
          app.textFields["textFieldLogin"].tap()
          app.textFields["textFieldLogin"].typeText("User name")
          
          app.buttons["Next:"].tap()
          
          app.textFields["textFieldPassword"].typeText("password")
          
          app.buttons["Done"].tap()
          
          XCTAssert(app.navigationBars["Main"].waitForExistence(timeout: 1.0))
     }
}
