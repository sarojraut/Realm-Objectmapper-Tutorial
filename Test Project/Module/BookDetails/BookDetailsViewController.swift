//
//  BookDetailsViewController.swift
//  Test Project
//
//  Created by saroj on 11/14/19.
//  Copyright (c) 2019 saroj raut. All rights reserved.
//

import UIKit



class BookDetailsViewController: UIViewController
{

    
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleOfBookLabel: UILabel!
    @IBOutlet weak var descriptionOfBookLabel: UILabel!
    var data:Items?
        
    // MARK: View lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
         setUpUI()
    }
    
    func setUpUI(){
        self.title = "BOOK DETAILS"
        let url = URL.init(string: data?.volumeInfo?.imageLinks?.thumbnail ?? "")
        self.bookImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"), completed: nil)
        self.titleOfBookLabel.text = data?.volumeInfo?.title
        self.descriptionOfBookLabel.text = (data?.volumeInfo?.publisher)
    }
}
