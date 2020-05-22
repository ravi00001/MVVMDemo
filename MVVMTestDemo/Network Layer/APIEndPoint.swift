//  JCNetworkEndPoints.swift
//  Jenny Craig
//  Created by Mobileprogrammingllc on 6/27/18.
//  Copyright © 2018 JennyCraig. All rights reserved.

import Foundation

struct JCNetworkEndPoints {

    //209
    static func getDevBaseURL() -> String {
       // return "https://0630p5qdph.execute-api.us-west-2.amazonaws.com/jc-npd-mbl-http/admin/"
        
   
       // return "http://localhost:1043/"
        return "https://glucotrackapp.mobileprogramming.net/"

    }

    //AWS
    static func getAwsBaseURL() -> String {
        return "https://frh8xa1jg4.execute-api.us-west-2.amazonaws.com/mp_npd/admin/"

    }

    //Production Release
    static func getProductionReleaseBaseURL() -> String {
        return "https://954hgzwxqg.execute-api.us-west-2.amazonaws.com/jc_mbl_prd/admin/"
    }

    static func getProductionReleaseBaseHeader() -> String {
        return "sjlC7axsJEaD5CjwO4Tm45J3jt8H3wBu99QoET2K"
    }

    static func getAwsBaseHeader() -> String {
        return "hHsGH1LHbT20MZvZAM6d4XaXLJ7VBA5SUvuTLQ50"
    }

    static func getDevBaseHeader() -> String {
        return "hHsGH1LHbT20MZvZAM6d4XaXLJ7VBA5SUvuTLQ50"
    }

    static func getProductionReleaseCognitoIdentityUserPoolAppClientId() -> String {
        return "4mgqd3qm4oqd1gu4713o9o8l7o"
    }

    static func getAwsCognitoIdentityUserPoolAppClientId() -> String {
        return "7m4bqpn5con7g4jt3o1egi6dpi"
    }

    static func getDevCognitoIdentityUserPoolAppClientId() -> String {
        return "7m4bqpn5con7g4jt3o1egi6dpi"
    }

    static func getProductionReleaseCognitoIdentityUserPoolAppClientSecret() -> String {
        return "6te9420gu9i9m7v24qs3a8se5g04sh5b95nlu6clu73opsh5hos"
    }

    static func getAwsCognitoIdentityUserPoolAppClientSecret() -> String {
        return "1p8m65lnoop3imkfu8mfdnlpd182m2utb0qkgacogsc2kkkmduma"
    }

    static func getDevCognitoIdentityUserPoolAppClientSecret() -> String {
        return "1p8m65lnoop3imkfu8mfdnlpd182m2utb0qkgacogsc2kkkmduma"
    }

    static func getProductionReleaseCognitoIdentityUserPoolId() -> String {
        return "us-west-2_Y5nBQiUBF"
    }

    static func getAwsCognitoIdentityUserPoolId() -> String {
        return "us-west-2_gb0MOmsHN"
    }

    static func getDevCognitoIdentityUserPoolId() -> String {
        return "us-west-2_gb0MOmsHN"
    }

    static func getDevGoogleInfoPlist() -> String {
        return Bundle.main.path(forResource: "GoogleService-Info209", ofType: "plist")!
    }

    static func getAwsGoogleInfoPlist() -> String {
        return Bundle.main.path(forResource: "GoogleService-InfoDevAWS", ofType: "plist")!
    }

    static func getProductionGoogleInfoPlist() -> String {
        return Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")!
    }

}

/*
 This structure has member function to set the current build scheme. Current build scheme selected in XCode will be set into project info.plist key named as APP_ENV. This key is also mentioned under Build Setting
 where each schemes names are mentioned. All these name must be equal to the names as mentioned under the Enum of AppEnvMode.
 */

struct JCConfigEndPoints {

    internal enum AppEnvMode: String {

        case undefined = "Undefined"
        case debug = "Debug"
        case productionRelease = "ProductionRelease"
        case aws = "Aws"

        /*
         Set your project scheme base urls
         */
        func baseEndPoint() -> String? {

            switch self {
            case .debug:
                return JCNetworkEndPoints.getDevBaseURL()
            case .aws:
                return JCNetworkEndPoints.getAwsBaseURL()
            case .productionRelease:
                return JCNetworkEndPoints.getProductionReleaseBaseURL()
            default:
                return JCNetworkEndPoints.getDevBaseURL()
            }
        }

        func baseHeader() -> String? {

            switch self {
            case .debug:
                return JCNetworkEndPoints.getDevBaseHeader()
            case .aws:
                return JCNetworkEndPoints.getAwsBaseHeader()
            case .productionRelease:
                return JCNetworkEndPoints.getProductionReleaseBaseHeader()
            default:
                return JCNetworkEndPoints.getDevBaseHeader()
            }
        }

        func cognitoIdentityUserPoolAppClientId() -> String? {

            switch self {
            case .debug:
                return JCNetworkEndPoints.getDevCognitoIdentityUserPoolAppClientId()
            case .aws:
                return JCNetworkEndPoints.getAwsCognitoIdentityUserPoolAppClientId()
            case .productionRelease:
                return JCNetworkEndPoints.getProductionReleaseCognitoIdentityUserPoolAppClientId()
            default:
                return JCNetworkEndPoints.getDevCognitoIdentityUserPoolAppClientId()
            }
        }

        func cognitoIdentityUserPoolAppSecret() -> String? {

            switch self {
            case .debug:
                return JCNetworkEndPoints.getDevCognitoIdentityUserPoolAppClientSecret()
            case .aws:
                return JCNetworkEndPoints.getAwsCognitoIdentityUserPoolAppClientSecret()
            case .productionRelease:
                return JCNetworkEndPoints.getProductionReleaseCognitoIdentityUserPoolAppClientSecret()
            default:
                return JCNetworkEndPoints.getDevCognitoIdentityUserPoolAppClientSecret()
            }
        }

        func cognitoIdentityUserPoolID() -> String? {

            switch self {
            case .debug:
                return JCNetworkEndPoints.getDevCognitoIdentityUserPoolId()
            case .aws:
                return JCNetworkEndPoints.getAwsCognitoIdentityUserPoolId()
            case .productionRelease:
                return JCNetworkEndPoints.getProductionReleaseCognitoIdentityUserPoolId()
            default:
                return JCNetworkEndPoints.getDevCognitoIdentityUserPoolId()
            }
        }

        func googleInfoPlist() -> String? {

            switch self {
            case .debug:
                return JCNetworkEndPoints.getDevGoogleInfoPlist()
            case .aws:
                return JCNetworkEndPoints.getAwsGoogleInfoPlist()
            case .productionRelease:
                return JCNetworkEndPoints.getProductionGoogleInfoPlist()
            default:
                return JCNetworkEndPoints.getDevGoogleInfoPlist()
            }
        }

    }

    private var mode: AppEnvMode = .undefined
    static var shared = JCConfigEndPoints()

    var appMode: AppEnvMode {
            return mode
    }

    /* This method need to be called when app launches. Ideal place to call this method at the very beginining of AppDelegate delegate method didFinishLaunching */
    mutating func initialize() {

        //self.mode = .Debug

        /* Value is captured from info.plist. Value in info.plist will come from User-Defined Variables APP_ENV */
        if let modeString = Bundle.main.infoDictionary?["APP_ENV"] as? String,
            let modeType = AppEnvMode(rawValue: modeString) {
            self.mode = modeType
        }
    }
}
