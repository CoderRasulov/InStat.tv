//
//  AFRequest.swift
//  e-auksion.uz
//
//  Created by Asliddin Rasulov on 11/02/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class AFRequest {
    
    static let request = AFRequest()
    
    private let headers: HTTPHeaders? = [
        .contentType("application/json")
    ]
    
    func sendRequestWithBody<T: Codable>(
        url: String, method: HTTPMethod, typeResponse: T.Type, params: Parameters, completion: @escaping(T?) -> Void
    ) {
        
        AF.request(
            url,
            method: method,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: headers
        ).responseJSON { (response) in
            
            switch response.result {
            
            case .success:
                
                guard let responseData = response.data else { return }
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                    print(json)
                    
                    let temp: T = try AFRequest.request.jsonToObject(from: responseData)
                    completion(temp)
                    
                } catch let error {
                    print(error)
                    completion(nil)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func jsonToObject<T : Decodable>(from data : Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
    
}


