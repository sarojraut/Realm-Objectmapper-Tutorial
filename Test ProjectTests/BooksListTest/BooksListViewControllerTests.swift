//
//  BooksListViewControllerTests.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright (c) 2019 saroj raut. All rights reserved.
//

@testable import Test_Project
import XCTest

class BooksListViewControllerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: BooksListViewController!
  var window: UIWindow!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    window = UIWindow()
    setupBooksListViewController()
  }
  
  override func tearDown()
  {
    window = nil
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupBooksListViewController()
  {
    sut =  BooksListViewController()
  }
  
  func loadView()
  {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  
  // MARK: Test doubles
  
  class BooksListBusinessLogicSpy: BooksListBusinessLogic
  {
    var makeRequestCalled = false

    func makeRequest() {
        makeRequestCalled = true
    }
    
  
  }
  
  // MARK: Tests
  
  func testShouldMakeRequestWhenViewIsLoaded()
  {
    // Given
    let spy = BooksListBusinessLogicSpy()
    sut.interactor = spy
    
    // When
    loadView()
    spy.makeRequest()
    // Then
    XCTAssertTrue(spy.makeRequestCalled, "viewDidLoad() should ask the interactor to do something")
  }
  
  func testDisplayData()
  {
    // Given
    let viewModel = BooksList.ViewModel()
    
    // When
    loadView()
    sut.displayData(viewModel:  viewModel)
    
  }
}
