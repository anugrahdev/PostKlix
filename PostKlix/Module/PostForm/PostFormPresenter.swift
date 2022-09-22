//
//  PostFormPresenter.swift
//  PostKlix
//
//  Created by Anang Nugraha on 21/09/22.
//  
//

import Foundation

class PostFormPresenter: PostFormPresenterProtocol {
    
    // MARK: Properties
    weak var view: PostFormViewController?
    let interactor: PostFormInteractorProtocol
    let wireframe: PostFormWireframeProtocol
    var postId: Int?

    init(interactor: PostFormInteractorProtocol, wireframe: PostFormWireframeProtocol, postId: Int?) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.postId = postId
        settingTextFieldForEdit()
    }
    
    func submitPost(title: String, content: String) {
        interactor.submitPost(title: title, content: content)
    }
    
    func editPost(title: String, content: String, id: Int) {
        interactor.editPost(title: title, content: content, id: id)
    }
    
    func settingTextFieldForEdit() {
        if let post = self.postId {
            interactor.getPostDetail(id: post)
        }
    }

}

extension PostFormPresenter: PostFormInteractorDelegate {
    
    func getPostDetailDidSuccess(data: PostModel) {
        self.view?.setTextFieldValue(post: data)
    }
    
    func editPostDidSuccess(postList: PostModel) {
        self.wireframe.showEditAlert()
    }
    
    func submitPostDidSuccess() {
        self.wireframe.showSubmitAlert()
    }
    
    func serviceRequestDidFail(_ error: NSError) {
        DispatchQueue.main.async { [weak self] in
            self?.wireframe.setLoadingIndicator(isHidden: true)
            self?.wireframe.showErrorAlert(error.localizedDescription)
        }
    }
    
}
