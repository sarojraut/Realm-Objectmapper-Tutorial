//
//  BooksListViewController.swift
//  Test Project
//
//  Created by saroj raut on 11/13/19.
//  Copyright (c) 2019 saroj raut. All rights reserved.
//

import UIKit

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
    @IBOutlet weak var tableView: UITableView!
    // MARK: Object lifecycle
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.configure()
    }
    
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
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "BookCell", bundle: Bundle.main), forCellReuseIdentifier: "BookCellID")
        
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        self.interactor?.makeRequest()
    }
    
    func displayData(viewModel: BooksList.ViewModel){
        self.viewModel = viewModel
        self.tableView.reloadData()
    }
    
    func displayError(message:String){
        
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
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
