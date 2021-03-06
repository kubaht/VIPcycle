//
//  ShowNameViewControllerTests.swift
//  VipTddApp
//
//  Created by Jakub Hutny on 21.12.2016.
//  Copyright (c) 2016 Jakub Hutny. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

@testable import VipTddApp
import XCTest

class ShowNameViewControllerTests: XCTestCase
{
  // MARK: - Subject under test
  
  var sut: ShowNameViewController!
  var window: UIWindow!
  
  // MARK: - Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    window = UIWindow()
    setupShowNameViewController()
  }
  
  override func tearDown()
  {
    window = nil
    super.tearDown()
  }
  
  // MARK: - Test setup
  
  func setupShowNameViewController()
  {
    let bundle = Bundle.main
    let storyboard = UIStoryboard(name: "Main", bundle: bundle)
    sut = storyboard.instantiateViewController(withIdentifier: "ShowNameViewController") as! ShowNameViewController
  }
  
  func loadView()
  {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  // MARK: - Test doubles
    
    class ShowNameViewControllerOutputStub: ShowNameViewControllerOutput {
        var createLabelMessageCalled = false
        
        func createLabelMessage(request: ShowName.DisplayMessage.Request) {
            createLabelMessageCalled = true
        }
    }
  
  // MARK: - Tests
    
    func testShouldCreateLabelMessageWhenUserPutsDataInTextField() {
        // Given
        let showNameViewControllerOutputStub = ShowNameViewControllerOutputStub()
        sut.output = showNameViewControllerOutputStub
        sut.inputTextField = UITextField()
        
        // When
        sut.inputTextFieldValueChanged(sut.inputTextField)
        
        // Then
        XCTAssert(showNameViewControllerOutputStub.createLabelMessageCalled, "inputTextFieldValuChanged() method should call createLabelMessage()")
    }
    
    func testShouldDisplayMessageInOutputLabel() {
        // Given
        let viewModel = ShowName.DisplayMessage.ViewModel(message: "So you’re name is ABC and your number is 65")
        sut.outputLabel = UILabel()
        
        // When
        sut.displayLabelMessage(viewModel: viewModel)
        
        // Then
        XCTAssertEqual(sut.outputLabel.text, viewModel.message, "ViewController should display message from ViewModel in output label.")
    }
  
}
