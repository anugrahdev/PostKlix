//
//  HomeContract.swift
//  PostKlix
//
//  Created by Anang Nugraha on 20/09/22.
//  
//

import Foundation

protocol HomeViewProtocol: BaseViewProtocol {
    func reloadData()
}

protocol HomePresenterProtocol: BasePresenterProtocol {
    var allPosts: [PostModel]? { get set }

    func fetchPost()
    func movetoDetail(id: Int)
    func moveToPostForm(id: Int?)
    func deletePost(post: PostModel)
}

protocol HomeWireframeProtocol: BaseWireframeProtocol {
    func pushPostForm(id: Int?)
    func pushDetail(id: Int)
    func showRemoveAlert()
}

protocol HomeInteractorProtocol: BaseInteractorProtocol {
    func getPostList()
    func deletePost(post: PostModel)
}

protocol HomeInteractorDelegate: BaseInteractorDelegate {
    func getPostListDidSuccess(postList: [PostModel])
    func deletePostDidSuccess(postList: PostModel)
}
