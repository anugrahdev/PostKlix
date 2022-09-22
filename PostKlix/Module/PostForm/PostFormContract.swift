//
//  PostFormContract.swift
//  PostKlix
//
//  Created by Anang Nugraha on 21/09/22.
//  
//

import Foundation

protocol PostFormViewProtocol: BaseViewProtocol {
    func setTextFieldValue(post: PostModel)
}

protocol PostFormPresenterProtocol: BasePresenterProtocol {
    
    var postId: Int? {set get}
    
    func submitPost(title:String, content: String)
    func editPost(title:String, content: String, id: Int)
    func settingTextFieldForEdit()
}

protocol PostFormWireframeProtocol: BaseWireframeProtocol {
    func showEditAlert()
    func showSubmitAlert()
}

protocol PostFormInteractorProtocol: BaseInteractorProtocol {
    func submitPost(title:String, content: String)
    func editPost(title:String, content: String, id: Int)
    func getPostDetail(id: Int)
}

protocol PostFormInteractorDelegate: BaseInteractorDelegate {
    func submitPostDidSuccess()
    func editPostDidSuccess(postList: PostModel)
    func getPostDetailDidSuccess(data: PostModel)

}
