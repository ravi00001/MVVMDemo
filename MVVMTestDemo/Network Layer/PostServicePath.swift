//
//  JCPostServicePath.swift
//  Jenny Craig
//
//  Created by Mobileprogrammingllc on 6/27/18.
//  Copyright © 2018 JennyCraig. All rights reserved.
//

import Foundation
import UIKit

protocol ParameterBodyMaker {

    var parameters: [String: Any]? {get}
    var path: ServerPaths {get}
}

/*
 ALL services post dictionary is mentioned under enum switch statement.
 These cases get their values in ViewController (or respective controller or other class).
 This enum also wrap a method which provides dictionary for post body.
 */

internal enum JCPostServicePath: ParameterBodyMaker {


    //case getPdf(week : String, menuId : Int, calorieValue : Int)
    case getPdf(weekstart : String, weekend : String)

    case getCenterLocation
    
    case login(email : String, password : String, deviceToken: String, deviceType: String)
    
    // MARK: - Path
    internal var path: ServerPaths {
        switch self {

        case .getCenterLocation:
            return .getCenterLocation

        case .getPdf:
            return .getPdf
            
        case .login:
             return .login
        }
 
    }

    // MARK: - Parameters
    internal var parameters: [String: Any]? {
        var params = [String: Any]()
        switch self {

        case .getCenterLocation:
            break
 
        case .getPdf(let weekstart, let weekend):
            params["weekstart"] = weekstart
            params["weekend"] = weekend
            
            
        case .login(let email, let password, let deviceToken, let deviceType):
            params["email"] = email
            params["password"] = password
            params["deviceToken"] = deviceToken
            params["deviceType"] = deviceType
         }

        return params
    }
}

enum ServerPaths: String {
    case getCenterLocation = ""
    case getPdf = "foodmenu/getpdfmenu"
    case login =  "users/loginUser"
}
