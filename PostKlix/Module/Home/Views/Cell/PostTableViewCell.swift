//
//  PostTableViewCell.swift
//  PostKlix
//
//  Created by Anang Nugraha on 21/09/22.
//

import UIKit

class PostTableViewCell: UITableViewCell, TableViewCellProtocol {

    static var identifier: String = "PostTableViewCell"

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    static func nib() -> UINib {
        return .init(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with data: PostModel) {
        self.titleLabel.text = data.title
        self.contentLabel.text = data.content
    }
    
}
