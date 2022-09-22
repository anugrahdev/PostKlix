//
//  PostFormInteractor.swift
//  PostKlix
//
//  Created by Anang Nugraha on 21/09/22.
//  
//

import Foundation

class PostFormInteractor: PostFormInteractorProtocol {
    func getPostDetail(id: Int) {
        let searchUserUrl = "https://limitless-forest-49003.herokuapp.com/posts/\(id)"
        
        RestApiServices.shared.request(url: searchUserUrl) { [weak self] (postResult: PostModel) in
            self?.delegate?.getPostDetailDidSuccess(data: postResult)
        } failure: { [weak self] error in
            self?.delegate?.serviceRequestDidFail(error as NSError)
        }
    }
    
    // MARK: Properties
    weak var delegate: PostFormInteractorDelegate?
    
    func submitPost(title: String, content: String) {
  
        let url = "https://limitless-forest-49003.herokuapp.com/posts"
        let params: [String: String] = [
                    "title": title,
                    "content": content
                ]
    
        RestApiServices.shared.post(url: url, params: params) { [weak self] (postResult: PostModel) in
            self?.delegate?.submitPostDidSuccess()
        } failure: { [weak self] error in
            self?.delegate?.serviceRequestDidFail(error)
        }

    }
    
    func editPost(title: String, content: String, id: Int) {
        let url = "https://limitless-forest-49003.herokuapp.com/posts/\(id)"
        let params: [String: String] = [
                    "title": title,
                    "content": content
                ]
    
        RestApiServices.shared.put(url: url, params: params) { [weak self] (postResult: PostModel) in
            self?.delegate?.editPostDidSuccess(postList: postResult)
        } failure: { [weak self] error in
            self?.delegate?.serviceRequestDidFail(error)
        }
    }
}
