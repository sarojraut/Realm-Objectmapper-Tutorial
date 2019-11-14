//
//  BooksListInteractor.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright (c) 2019 saroj raut. All rights reserved.
//

import UIKit
import Alamofire

protocol BooksListBusinessLogic
{
    func makeRequest()
}

protocol BooksListDataStore
{
    var bookResponse: BooksList.Response? { get set }
}

class BooksListInteractor: BooksListBusinessLogic, BooksListDataStore
{
    var bookResponse: BooksList.Response?
    var presenter: BooksListPresentationLogic?
    
    // MARK: Do something
    
    func makeRequest()
    {
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=flowers+inauthor:keyes&key=AIzaSyCXtfir93vgsETeCB8aLFTeuD6xrVxTVvE")
        Alamofire.request(url!, method: .get).responseJSON { response in
            switch response.result {
            case .success:
                if response.result.value != nil {
                let jsonString = String(data: response.data!, encoding: .utf8)!
                if let responseData = BooksList.Response(JSONString: jsonString){
                    self.bookResponse = responseData
                    self.presenter?.PresentData(response: responseData)
                }else{
                    
                    }
                }
            case .failure(let error):
                print(error)

            }
        }
    }
}
