//
//  DetailWireframe.swift
//  PostKlix
//
//  Created by Anang Nugraha on 21/09/22.
//  
//

import Foundation
import UIKit

class DetailWireframe: DetailWireframeProtocol {
    
    weak var controller: DetailViewController?
    let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func setupDetailViewController(id: Int) -> DetailViewController {
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(interactor: interactor, wireframe: self, id: id)
        let view = DetailViewController()
        interactor.delegate = presenter
        controller = view
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    func setLoadingIndicator(isHidden: Bool) {
        
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

}

extension Router {
    
    func setupDetailViewController(id: Int) -> DetailViewController {
        let wireframe = DetailWireframe(resolver: resolver)
        return wireframe.setupDetailViewController(id: id)
    }
    
}
