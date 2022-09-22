//
//  PostFormWireframe.swift
//  PostKlix
//
//  Created by Anang Nugraha on 21/09/22.
//  
//

import Foundation
import UIKit

class PostFormWireframe: PostFormWireframeProtocol {
    
    weak var controller: PostFormViewController?
    let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func setupPostFormViewController(id: Int?) -> PostFormViewController {
        let interactor = PostFormInteractor()
        let presenter = PostFormPresenter(interactor: interactor, wireframe: self, postId: id)
        let view = PostFormViewController()
        interactor.delegate = presenter
        controller = view
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    func setLoadingIndicator(isHidden: Bool) {
        
    }
    
    func showNoInternetAlert() {
        
    }
    
    func showErrorAlert(_ message: String) {
        
    }
    
    func showSubmitAlert() {
        let dialogMessage = UIAlertController(
            title: "",
            message: "You are successfully submit content",
            preferredStyle: .alert)
         
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in
        })
         
        dialogMessage.addAction(ok)

        controller?.present(dialogMessage, animated: true, completion: nil)
    }
    
    func showEditAlert() {
        let dialogMessage = UIAlertController(
            title: "",
            message: "You are successfully edit content",
            preferredStyle: .alert)
         
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in
        })
         
        dialogMessage.addAction(ok)

        controller?.present(dialogMessage, animated: true, completion: nil)
    }

}

extension Router {
    
    func setupPostFormViewController(id: Int?) -> PostFormViewController {
        let wireframe = PostFormWireframe(resolver: resolver)
        return wireframe.setupPostFormViewController(id: id)
    }
    
}
