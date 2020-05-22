//
//  LoginClient.swift
//  MVVMTestDemo
//
//  Created by RAVI PARSA on 23/05/20.
//  Copyright © 2020 Ravi Parsa. All rights reserved.
//

import UIKit

class LoginClient: APIClient {
    
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func loginUser(resource: JCAPIResource, completion: @escaping (APIResponse<[LoginModel], APIError>) -> Void) {
        
        fetch(with: resource.request, decode: { json -> [LoginModel]? in
            guard let data = json as? [LoginModel] else { return  nil }
            return data
        }, completion: completion)
    }
    
}

