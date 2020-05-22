//
//  LoginViewModel.swift
//  MVVMTestDemo
//
//  Created by RAVI PARSA on 23/05/20.
//  Copyright © 2020 Ravi Parsa. All rights reserved.
//

import UIKit
import Foundation

enum LoginType {
    case loginUser
}
class LoginViewModel: NSObject {

    // MARK: Private Variables
    private let client = LoginClient()
    var pinCode = ""

    internal var alertMessage: String = "Error" {
      /*  didSet {
            if  alertMessage.caseInsensitiveCompare(Identifiers.Message.IncorrectEmailOrPassword) == .orderedSame {
                AWSHandler.sharedInstance.logOut()
            } else if alertMessage.caseInsensitiveCompare("Not Found.") == .orderedSame {
                self.successViewClosure?(.getLocation)
            } else {
                self.showAlertClosure!(alertMessage)
            }
        }
        */
        didSet {
            if alertMessage.caseInsensitiveCompare("Not Found.") == .orderedSame {
                self.successViewClosure?(.loginUser)
            } else {
                self.showAlertClosure!(alertMessage)
            }
        }
    }

    var successViewClosure: ((LoginType) -> Void)?
    var showAlertClosure: ((String) -> Void)?

    // MARK: - Computed Properties
    internal var loginModel: [LoginModel]? {
        didSet {
            if loginModel != nil {
                self.successViewClosure?(.loginUser)
            }
        }
    }
   // internal var loginModel: LoginModel?

    
    //func login(email: String, password: String, deviceToken: String, deviceType: String) {
    func login() {
        let path = JCPostServicePath.login(email: "john@mobileprogramming.com", password: "Welcome@123", deviceToken: "F8F96E2C-B13B-48FA-999E-1307E1ECAD6E", deviceType: "IOS")
        self.callGetLocation(servicePath: path, with: .loginUser)
    }

    private func callGetLocation2(servicePath: JCPostServicePath, with type: LoginType) {

        let strPath = "https://api.jennycraig.com/api/locations?addr=" + pinCode
        let resource = GenericResource(path: servicePath.path.rawValue, parameters: servicePath.parameters, basePat: strPath)

        client.loginUser(resource: resource) { (result) in
            if result.isSuccess {
                //get the parse data from result
                self.loginModel = result.value
                self.successViewClosure?(.loginUser)
            } else {
                //if response did not come from services then show alert message
                if let error = result.error {
                    self.alertMessage = error.debugDescription
                }
            }
        }
    }
    private func callGetLocation(servicePath: JCPostServicePath, with type: LoginType) {

        let resource = GenericResource(path: servicePath.path.rawValue, parameters: servicePath.parameters )

         client.loginUser(resource: resource) { (result) in
            if result.isSuccess {
                //get the parse data from result
                self.loginModel = result.value
                self.successViewClosure?(.loginUser)
                
            } else {
                //if response did not come from services then show alert message
                if let error = result.error {
                    self.alertMessage = error.debugDescription
                }
            }
        }
    }


}
