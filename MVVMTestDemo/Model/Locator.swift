//
//  Locator.swift
//  JennyCraig
//
//  Created by Mobileprogrammingllc on 8/30/18.
//  Copyright © 2018 JennyCraig. All rights reserved.
//

import UIKit

struct LocatorModel: Codable {

    var address_1: String?
    var address_2: String?
    var city: String?
    var country: String?
    var lat: String?
    var lng: String?
    var local_phone: String?
    var location_name: String?
    var post_code: String?
    var region: String?
    var distance: String?
    var fid: String?
}

struct LocatorProfile: Codable {
    var distance = ""
}
