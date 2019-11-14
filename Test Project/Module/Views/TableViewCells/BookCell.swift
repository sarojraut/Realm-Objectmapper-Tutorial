//
//  BookCell.swift
//  Test Project
//
//  Created by saroj raut on 11/14/19.
//  Copyright © 2019 saroj raut. All rights reserved.
//

import UIKit
import SDWebImage

class BookCell: UITableViewCell {

    static let identifier = "BookCellID"
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func setUpData(viewModel:BooksList.BooksDetail){
        self.imageView?.sd_setImage(with: URL(string: viewModel.bookImageUrl ?? ""), completed: nil)
        self.titleLabel.text = viewModel.bookTitle
        self.descriptionLabel.text = viewModel.bookDescription
    }
}
