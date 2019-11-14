//
//  BooksListInteractor.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright (c) 2019 saroj raut. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift

protocol BooksListBusinessLogic
{
    func makeRequest()
}

protocol BooksListDataStore
{
    var bookResponse: BookResponse? { get set }
}

class BooksListInteractor: BooksListBusinessLogic, BooksListDataStore
{
    var bookResponse: BookResponse?
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
                    print(jsonString)
                    if let responseData = BookResponse(JSONString: jsonString){
                        print(responseData)
                        let realm = try! Realm()
                        realm.beginWrite()
                        realm.add(responseData, update: Realm.UpdatePolicy.modified)
                        if realm.isInWriteTransaction {
                            try! realm.commitWrite()
                        }
                        self.bookResponse = responseData
                        self.presenter?.PresentData(response: responseData)
                    }else{
                        let realm = try! Realm()
                        let results =  realm.objects(BookResponse.self)
                        if let data = results.first{
                            self.bookResponse = data
                            self.presenter?.PresentData(response: data)
                        }
                        self.presenter?.presentError(message: response.description)
                    }
                }
            case .failure(let error):
                let realm = try! Realm()
                let results =  realm.objects(BookResponse.self)
                if let data = results.first{
                    self.bookResponse = data
                    self.presenter?.PresentData(response: data)
                }
                self.presenter?.presentError(message: error.localizedDescription)
            }
        }
    }
}
