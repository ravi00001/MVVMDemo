//
//  LocatorViewModel.swift
//  JennyCraig
//
//  Created by Mobileprogrammingllc on 8/30/18.
//  Copyright © 2018 JennyCraig. All rights reserved.
//

import UIKit
enum LocationType {
    case getLocation
}

class LocatorViewModel: NSObject {

    // MARK: Private Variables
    private let client = LocatorClient()
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
                self.successViewClosure?(.getLocation)
            } else {
                self.showAlertClosure!(alertMessage)
            }
        }
    }

    var successViewClosure: ((LocationType) -> Void)?
    var showAlertClosure: ((String) -> Void)?

    // MARK: - Computed Properties
    internal var locatorModel: [LocatorModel]? {
        didSet {
            if locatorModel != nil {
                self.successViewClosure?(.getLocation)
            }
        }
    }

    func getLocationList() {
        let path = JCPostServicePath.getCenterLocation()
        self.callGetLocation(servicePath: path, with: .getLocation)
    }

    private func callGetLocation(servicePath: JCPostServicePath, with type: LocationType) {

        let strPath = "https://api.jennycraig.com/api/locations?addr=" + pinCode
        let resource = GenericResource(path: servicePath.path.rawValue, parameters: servicePath.parameters, basePat: strPath)

        client.getCenterList(resource: resource) { (result) in
            if result.isSuccess {
                //get the parse data from result
                self.locatorModel = result.value?.filter { Double($0.distance!)! <= 50.0 }
            } else {
                //if response did not come from services then show alert message
                if let error = result.error {
                    self.alertMessage = error.debugDescription
                }
            }
        }
    }

}
