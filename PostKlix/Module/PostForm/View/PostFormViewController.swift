//
//  PostFormViewController.swift
//  PostKlix
//
//  Created by Anang Nugraha on 21/09/22.
//  
//

import UIKit

class PostFormViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: PostFormPresenterProtocol?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if let title = titleTextField.text, let content = contentTextField.text {
            if let post = presenter?.postId {
                presenter?.editPost(title: title, content: content, id: post)
            } else {
                presenter?.submitPost(title: title, content: content)
            }
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        
    }

}

// MARK: - View Protocol
extension PostFormViewController: PostFormViewProtocol {
    func setTextFieldValue(post: PostModel) {
        self.titleTextField.text = post.title
        self.contentTextField.text = post.content
    }
}
