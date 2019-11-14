//
//  BooksListRouter.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright (c) 2019 saroj raut. All rights reserved.


import UIKit

@objc protocol BooksListRoutingLogic
{
    func routeToBookDetails()
}

protocol BooksListDataPassing
{
  var dataStore: BooksListDataStore? { get }
}

class BooksListRouter: NSObject, BooksListRoutingLogic, BooksListDataPassing
{
  weak var viewController: BooksListViewController?
  var dataStore: BooksListDataStore?
  
  // MARK: Routing
  
  func routeToBookDetails()
  {
      let storyboard = UIStoryboard(name: "BookDetails", bundle: nil)
      let destinationVC = storyboard.instantiateViewController(withIdentifier: "BookDetailsViewController") as! BookDetailsViewController
      destinationVC.data = dataStore!.bookResponse?.items[(viewController?.selectedRow)!]
      navigateToBookDetails(source: viewController!, destination: destinationVC)
  }

  // MARK: Navigation
  
  func navigateToBookDetails(source: BooksListViewController, destination: BookDetailsViewController)
  {
    source.show(destination, sender: nil)
  }
  
}

