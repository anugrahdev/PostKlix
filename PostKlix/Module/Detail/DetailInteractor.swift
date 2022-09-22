//
//  DetailInteractor.swift
//  PostKlix
//
//  Created by Anang Nugraha on 21/09/22.
//  
//

import Foundation

class DetailInteractor: DetailInteractorProtocol {

    // MARK: Properties
    weak var delegate: DetailInteractorDelegate?
    
    func getPostDetail(id: Int) {
        let searchUserUrl = "https://limitless-forest-49003.herokuapp.com/posts/\(id)"
        
        RestApiServices.shared.request(url: searchUserUrl) { [weak self] (postResult: PostModel) in
            self?.delegate?.getPostDetailDidSuccess(data: postResult)
        } failure: { [weak self] error in
            self?.delegate?.serviceRequestDidFail(error as NSError)
        }
    }
    
}
