//
//  HomeWireframe.swift
//  PostKlix
//
//  Created by Anang Nugraha on 20/09/22.
//  
//

import Foundation
import UIKit

class HomeWireframe: HomeWireframeProtocol {
    
    weak var controller: HomeViewController?
    let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func setupHomeViewController() -> HomeViewController {
        let interactor = HomeInteractor()
        let presenter = HomePresenter(interactor: interactor, wireframe: self)
        let view = HomeViewController()
        interactor.delegate = presenter
        controller = view
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    func setLoadingIndicator(isHidden: Bool) {
        if isHidden {
            controller?.homeTableView.hideLoading()
        } else {
            controller?.homeTableView.showLoading()
        }
    }
    
    func showNoInternetAlert() {
        let alert = UIAlertController(title: StringResources.noInternetTitle, message: StringResources.noInternetMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: StringResources.backText, style: .default, handler: nil))
        self.controller?.present(alert, animated: true)
    }
    
    func showErrorAlert(_ message: String) {
        let alert = UIAlertController(title: StringResources.errorLoadData, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: StringResources.backText, style: .default, handler: nil))
        self.controller?.present(alert, animated: true)
    }
    
    func pushDetail(id: Int) {
        let router = resolver.resolve(Router.self)
        let viewController = router.setupDetailViewController(id: id)
        controller?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func pushPostForm(id: Int?) {
        let router = resolver.resolve(Router.self)
        let viewController = router.setupPostFormViewController(id: id)
        controller?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showRemoveAlert() {
        let dialogMessage = UIAlertController(
            title: "",
            message: "You are successfully remove content",
            preferredStyle: .alert)
         
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in
        })
         
        dialogMessage.addAction(ok)

        controller?.present(dialogMessage, animated: true, completion: nil)
    }

}

extension Router {
    
    func setupHomeViewController() -> HomeViewController {
        let wireframe = HomeWireframe(resolver: resolver)
        return wireframe.setupHomeViewController()
    }
    
}
