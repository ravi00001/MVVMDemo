
//
//  Login.swift
//  MVVMTestDemo
//
//  Created by RAVI PARSA on 23/05/20.
//  Copyright © 2020 Ravi Parsa. All rights reserved.
//

import UIKit

struct LoginModel: Codable {

    var response_code: Int?
    var message: String?
    var type: String?
    var _id: String?
    var firstName: String?
    var country: String?
    var profileImage: String?
    var thumbnail: String?
    var isVerified: Int?
    var authToken: String?
    var userType: Int?
    var deviceToken: String?
    var email: String?
    var created_date: Date?
    var updated_date: Date?
    var deviceType: String?
    var registrationDate: String?
    var userId: Int?
    
//    "response_code": 200,
//    "message": "Success",
//    "type": "DEFAULT",
//    "_id": "5eb459e147a63a0695c00ad8",
//    "firstName": "john doe",
//    "country": "INDIA",
//    "profileImage": "/profilePics/1590170834.jpg",
//    "thumbnail": "/profilePics/thumbnail/1590170834.jpg",
//    "isVerified": true,
//    "authToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVlYjQ1OWUxNDdhNjNhMDY5NWMwMGFkOCIsImVtYWlsIjoiam9obkBtb2JpbGVwcm9ncmFtbWluZy5jb20iLCJleHAiOjE1OTA4NzIxNDYsImlhdCI6MTU5MDE4MDk0Nn0.MqPCHq6W1BtgxDGxT2RJ0HOUETiJc-eLID3Xv15yrsE",
//    "userType": 2,
//    "deviceToken": "",
//    "email": "john@mobileprogramming.com",
//    "created_date": "2020-05-07T18:56:33.727Z",
//    "updated_date": "2020-05-22T20:55:46.085Z",
//    "deviceType": "ANDROID",
//    "registrationDate": "2020-05-07T18:56:33.729Z",
//    "userId": 52
 
}

//struct LocatorProfile: Codable {
//    var distance = ""
//}
