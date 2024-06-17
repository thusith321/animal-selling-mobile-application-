//
//  AnimalSellingUITests.swift
//  AnimalSellingUITests
//
//  Created by Thusith Hettiarachchi on 2024-06-07.
//

import XCTest

final class AnimalSellingUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        let app = XCUIApplication()
        app.launch()

        app.buttons["Get Started"].tap()
        app.textFields["Email"].tap()
        
        let passwordSecureTextField = app.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.tap()
        app.buttons["Sign In"].tap()
        app.tabBars["Tab Bar"].buttons["Animals"].tap()
        
        app.navigationBars["All Animals"]/*@START_MENU_TOKEN@*/.buttons["Add Animal"]/*[[".otherElements[\"Add Animal\"].buttons[\"Add Animal\"]",".buttons[\"Add Animal\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        let enterAnimalNameTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Enter Animal Name"]/*[[".cells.textFields[\"Enter Animal Name\"]",".textFields[\"Enter Animal Name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        enterAnimalNameTextField.tap()
        enterAnimalNameTextField.tap()
        
        let enterAnimalBreedTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Enter Animal Breed"]/*[[".cells.textFields[\"Enter Animal Breed\"]",".textFields[\"Enter Animal Breed\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        enterAnimalBreedTextField.tap()
        enterAnimalBreedTextField.tap()
        
        let enterAnimalLocationTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Enter Animal Location"]/*[[".cells.textFields[\"Enter Animal Location\"]",".textFields[\"Enter Animal Location\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        enterAnimalLocationTextField.tap()
        enterAnimalLocationTextField.tap()
        
        let enterAnimalAgeTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Enter Animal Age"]/*[[".cells.textFields[\"Enter Animal Age\"]",".textFields[\"Enter Animal Age\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        enterAnimalAgeTextField.tap()
        enterAnimalAgeTextField.tap()
        
        let enterDescriptionTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Enter Description"]/*[[".cells.textFields[\"Enter Description\"]",".textFields[\"Enter Description\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        enterDescriptionTextField.tap()
        enterDescriptionTextField.tap()
        
        let enterPriceTextField = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Enter Price"]/*[[".cells.textFields[\"Enter Price\"]",".textFields[\"Enter Price\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        enterPriceTextField.tap()
        enterPriceTextField.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Save"]/*[[".cells.buttons[\"Save\"]",".buttons[\"Save\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
       
                
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
