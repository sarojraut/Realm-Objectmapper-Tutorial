//
//  BooksListViewController.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright (c) 2019 saroj raut. All rights reserved.
//

import UIKit
import RMessage

protocol BooksListDisplayLogic: class
{
    func displayData(viewModel: BooksList.ViewModel)
    func displayError(message:String)
}

class BooksListViewController: UIViewController, BooksListDisplayLogic
{
    var interactor: BooksListBusinessLogic?
    var router: (NSObjectProtocol & BooksListRoutingLogic & BooksListDataPassing)?
    var viewModel:BooksList.ViewModel?
    let tableView = UITableView()
    var selectedRow = 0
    var activityView = UIActivityIndicatorView(style: .gray)
    // MARK: Object lifecycle
    func configure(){
        let interactor = BooksListInteractor()
        let presenter = BooksListPresenter()
        let router = BooksListRouter()
        self.interactor = interactor
        self.router = router
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
    }
        
    // MARK: View lifecycle
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configure()
        setUpTableView()
        activityView.startAnimating()
        self.interactor?.makeRequest()
    }
    
    func setUpTableView(){
        self.title = "BOOK LIST"
        view.addSubview(tableView)
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .singleLineEtched
        tableView.register(UINib(nibName: "BookCell", bundle: Bundle.main), forCellReuseIdentifier: "BookCellID")
        tableView.tableFooterView = UIView()
    }
    
    func displayData(viewModel: BooksList.ViewModel){
        
        activityView.stopAnimating()
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
    
    func displayError(message:String){
        activityView.stopAnimating()

        RMessage.showNotification(in: self, title: "", subtitle: message , type: .warning, customTypeName: "", duration: 3, callback: {

            }, canBeDismissedByUser: true)
    }
    
}

extension BooksListViewController:UITableViewDelegate,UITableViewDataSource{
    
    // MARK: - UITableViewDataSource
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.BookList?.count ?? 0
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
       let cell = tableView.dequeueReusableCell(withIdentifier: BookCell.identifier, for: indexPath) as! BookCell
        cell.setUpData(viewModel: (self.viewModel?.BookList?[indexPath.row])!)
    
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        self.router?.routeToBookDetails()
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
