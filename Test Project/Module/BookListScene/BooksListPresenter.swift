//
//  BooksListPresenter.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright (c) 2019 saroj raut. All rights reserved.
//


import UIKit
import RealmSwift

protocol BooksListPresentationLogic
{
    func PresentData(response: BookResponse)
    func presentError(message:String)
}

class BooksListPresenter: BooksListPresentationLogic
{
    weak var viewController: BooksListDisplayLogic?
    
    // MARK: Do something
    
    func PresentData(response: BookResponse)
    {
        
        let realm = try! Realm()
        let results =  realm.objects(BookResponse.self)
        print(results)
        var viewModel = BooksList.ViewModel()
        var bookList = [BooksList.BooksDetail]()
        for value in response.items{
            var bookDetails = BooksList.BooksDetail()
            bookDetails.bookTitle = value.volumeInfo?.title ?? ""
            bookDetails.bookDescription = value.volumeInfo?.publisher ?? ""
            bookDetails.bookImageUrl = value.volumeInfo?.imageLinks?.thumbnail ?? ""
            print(value.volumeInfo?.imageLinks?.thumbnail ?? "")
            bookList.append(bookDetails)
        }
        viewModel.BookList = bookList
        viewController?.displayData(viewModel: viewModel)
    }
    
    
    func presentError(message: String) {
       
        viewController?.displayError(message: message)
    }
    
}
