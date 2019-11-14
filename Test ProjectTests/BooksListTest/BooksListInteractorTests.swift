//
//  BooksListInteractorTests.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright (c) 2019 saroj raut. All rights reserved.
//

@testable import Test_Project
import XCTest
import Alamofire

class BooksListInteractorTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: BooksListInteractor!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupBooksListInteractor()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupBooksListInteractor()
  {
    sut = BooksListInteractor()
  }
  
  // MARK: Test doubles
  
  class BooksListPresentationLogicSpy: BooksListPresentationLogic
  {
    
    var presentDataCalled = false
    var presentErrorCalled = false


    func presentError(message: String) {
        presentErrorCalled = true
    }
    
    func PresentData(response: BookResponse)
    {
      presentDataCalled = true
    }
  }
  
  // MARK: Tests
  
  func testMakeRequest()
  {
    // Given
    let spy = BooksListPresentationLogicSpy()
    sut.presenter = spy
    
    // When
    let promise = expectation(description: "Successfully get Response")
    // when
    let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=flowers+inauthor:keyes&key=AIzaSyCXtfir93vgsETeCB8aLFTeuD6xrVxTVvE")
    Alamofire.request(url!, method: .get).responseJSON { response in
        switch response.result {
        case .success:
            if response.result.value != nil {
                let jsonString = String(data: response.data!, encoding: .utf8)!
                print(jsonString)
                if BookResponse(JSONString: jsonString) != nil{
                   promise.fulfill()
                }
            }
        case .failure( _):
            break
           
        }
    }
        waitForExpectations(timeout: 5) { (error) in
        }

    // Then
  }
}
