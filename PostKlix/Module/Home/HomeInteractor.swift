//
//  HomeInteractor.swift
//  PostKlix
//
//  Created by Anang Nugraha on 20/09/22.
//  
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {

    // MARK: Properties
    weak var delegate: HomeInteractorDelegate?
    
    func getPostList() {
        let searchUserUrl = "https://limitless-forest-49003.herokuapp.com/posts"
        
        RestApiServices.shared.request(url: searchUserUrl) { [weak self] (postResult: PostModelList) in
            self?.delegate?.getPostListDidSuccess(postList: postResult)
        } failure: { [weak self] error in
            self?.delegate?.serviceRequestDidFail(error as NSError)
        }
    }
    
    func deletePost(post: PostModel) {
        
        guard let title = post.title, let content = post.content, let id = post.id else { return }

        let url = "https://limitless-forest-49003.herokuapp.com/posts/\(id)"
        let params: [String: String] = [
            "title": title,
            "content": content
        ]
    
        RestApiServices.shared.delete(url: url, params: params) { [weak self] (postResult: PostModel) in
            self?.delegate?.deletePostDidSuccess(postList: postResult)
        } failure: { [weak self] error in
            self?.delegate?.serviceRequestDidFail(error)
        }
    }
    
}
