//
//  BooksListRouter.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright (c) 2019 saroj raut. All rights reserved.


import UIKit

@objc protocol BooksListRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
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
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: BooksListViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: BooksListDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
