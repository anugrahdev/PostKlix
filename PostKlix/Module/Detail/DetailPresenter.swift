//
//  DetailPresenter.swift
//  PostKlix
//
//  Created by Anang Nugraha on 21/09/22.
//  
//

import Foundation

class DetailPresenter: DetailPresenterProtocol {

    // MARK: Properties
    weak var view: DetailViewProtocol?
    let interactor: DetailInteractorProtocol
    let wireframe: DetailWireframeProtocol
    var id: Int = 0
    
    init(interactor: DetailInteractorProtocol, wireframe: DetailWireframeProtocol, id: Int) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.id = id
        fetchData()
    }
    
    func fetchData() {
        interactor.getPostDetail(id: self.id)
    }
    
}

extension DetailPresenter: DetailInteractorDelegate {
    func getPostDetailDidSuccess(data: PostModel) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.updateView(with: data)
        }
    }

    func serviceRequestDidFail(_ error: NSError) {
        DispatchQueue.main.async { [weak self] in
            self?.wireframe.setLoadingIndicator(isHidden: true)
            self?.wireframe.showErrorAlert(error.localizedDescription)
        }
    }
    
}
