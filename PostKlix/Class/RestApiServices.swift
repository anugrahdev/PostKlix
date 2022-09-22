//
//  RestApiServices.swift
//  PostKlix
//
//  Created by Anang Nugraha on 21/09/22.
//

import Foundation
import Alamofire

class RestApiServices {
    
    static let shared = {
        RestApiServices()
    }()
    
    func request<T: Codable>(url: String, success: @escaping (T) -> Void, failure: @escaping (NSError) -> Void) {
        
        AF.request(url, method: .get)
            .validate(statusCode: 200..<400)
            .responseDecodable(of: T.self){ response in
                debugPrint(response)
            switch response.result {
            case .success(let data):
                success(data)
            case .failure(let error):
                failure(error as NSError)
            }
        }
        
    }
    
    func startPostRequest<T: Codable>(url: String, params: [String:String], method: HTTPMethod, success: @escaping (T) -> Void, failure: @escaping (NSError) -> Void) {
        
        AF.request(url, method: method, parameters: params, encoder: JSONParameterEncoder.default).responseDecodable(of: T.self){ response in
            debugPrint(response)
        switch response.result {
        case .success(let data):
            success(data)
        case .failure(let error):
            failure(error as NSError)
        }
        }
    }
    
}
