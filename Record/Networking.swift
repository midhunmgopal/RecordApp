//
//  Networking.swift
//  Record
//
//  Created by Ovoid on 24/06/17.
//  Copyright © 2017 myproject. All rights reserved.
//

import UIKit

let kBaseUrl = "http://recordio.empressemdemo.com/"

let kRegisterUrl = "register/signupapi/"
let kLoginUser = "register/login/"




func getComplete(url: String, path: String = "") -> String {
    return kBaseUrl + url + path
}

