//
//  JCPostServicePath.swift
//  Jenny Craig
//
//  Created by Mobileprogrammingllc on 6/27/18.
//  Copyright © 2018 JennyCraig. All rights reserved.
//

import Foundation

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

    case getCenterLocation()

    // MARK: - Path
    internal var path: ServerPaths {
        switch self {

        case .getCenterLocation:
            return .getCenterLocation

        case .getPdf:
            return .getPdf
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
        }

        return params
    }
}

enum ServerPaths: String {
    case getCenterLocation = ""
    case getPdf = "foodmenu/getpdfmenu"
}
