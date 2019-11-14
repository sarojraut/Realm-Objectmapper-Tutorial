//
//  BooksListPresenterTests.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright (c) 2019 saroj raut. All rights reserved.
//

@testable import Test_Project
import XCTest

class BooksListPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: BooksListPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupBooksListPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupBooksListPresenter()
  {
    sut = BooksListPresenter()
  }
  
  // MARK: Test doubles
  
  class BooksListDisplayLogicSpy: BooksListDisplayLogic
  {
    
    var displayDataCalled = false

    func displayData(viewModel: BooksList.ViewModel) {
        displayDataCalled = true
    }
    
    func displayError(message: String) {
        
    }
    
   
  }
  
  // MARK: Tests
  
  func testPresentSomething()
  {
    // Given
    let spy = BooksListDisplayLogicSpy()
    sut.viewController = spy
    let response = BookResponse()
    
    // When
    sut.PresentData(response: response)
    
    // Then
    XCTAssertTrue(spy.displayDataCalled, "presentSomething(response:) should ask the view controller to display the result")
  }
}
