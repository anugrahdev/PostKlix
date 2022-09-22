//
//  DetailContract.swift
//  PostKlix
//
//  Created by Anang Nugraha on 21/09/22.
//  
//

import Foundation

protocol DetailViewProtocol: BaseViewProtocol {
    func updateView(with data: PostModel)
}

protocol DetailPresenterProtocol: BasePresenterProtocol {
    var id: Int { set get }
    
    func fetchData()
}

protocol DetailWireframeProtocol: BaseWireframeProtocol {}

protocol DetailInteractorProtocol: BaseInteractorProtocol {
    func getPostDetail(id: Int)
}

protocol DetailInteractorDelegate: BaseInteractorDelegate {
    func getPostDetailDidSuccess(data: PostModel)
}
