//
//  DetailViewController.swift
//  PostKlix
//
//  Created by Anang Nugraha on 21/09/22.
//  
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    var presenter: DetailPresenterProtocol?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

// MARK: - View Protocol
extension DetailViewController: DetailViewProtocol {
    func updateView(with data: PostModel) {
        self.titleLabel.text = data.title
        self.contentLabel.text = data.content
        self.publishedLabel.text = data.publishedAt
    }
}
