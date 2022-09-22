//
//  HomePresenter.swift
//  PostKlix
//
//  Created by Anang Nugraha on 20/09/22.
//  
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    let interactor: HomeInteractorProtocol
    let wireframe: HomeWireframeProtocol
    var allPosts: [PostModel]?
    
    init(interactor: HomeInteractorProtocol, wireframe: HomeWireframeProtocol) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func fetchPost() {
        wireframe.setLoadingIndicator(isHidden: false)
        interactor.getPostList()
    }
    
    func movetoDetail(id: Int) {
        wireframe.pushDetail(id: id)
    }
    
    func moveToPostForm(id: Int?) {
        wireframe.pushPostForm(id: id)
    }
    
    func deletePost(post: PostModel) {
        interactor.deletePost(post: post)
    }
}

extension HomePresenter: HomeInteractorDelegate {
    func getPostListDidSuccess(postList: [PostModel]) {
        wireframe.setLoadingIndicator(isHidden: true)
        allPosts = postList
        DispatchQueue.main.async { [weak self] in
            self?.view?.reloadData()
        }
    }
    
    func deletePostDidSuccess(postList: PostModel) {
        interactor.getPostList()
        DispatchQueue.main.async { [weak self] in
            self?.wireframe.showRemoveAlert()
            self?.view?.reloadData()
        }
    }
    
    func serviceRequestDidFail(_ error: NSError) {
        DispatchQueue.main.async { [weak self] in
            self?.wireframe.setLoadingIndicator(isHidden: true)
            self?.wireframe.showErrorAlert(error.localizedDescription)
        }
    }
    
}
