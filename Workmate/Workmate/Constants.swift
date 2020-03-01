//
//  Constants.swift
//  Workmate
//
//  Created by Gaurang Patel on 01/03/20.
//  Copyright © 2020 Workmate. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

struct Constants {
        
    //--------------- Server Request URL's ---------------

    static let authenticateUser: String = "https://api.helpster.tech/v1/auth/login/"

    static let getWorkerDataAPI: String = "https://api.helpster.tech/v1/staff-requests/26074/"
    
    static let clockInAPI: String = "https://api.helpster.tech/v1/staff-requests/26074/clock-in/"

    static let clockOutAPI: String = "https://api.helpster.tech/v1/staff-requests/26074/clock-out/"
    
    //--------------- Method Name ---------------
    
    static let getMethode: String = "GET"

    static let postMethode: String = "POST"

    //--------------- User Details ---------------

    static let userDict : [String : AnyObject] = ["username" : "+6281313272005" as AnyObject , "password" : "alexander" as AnyObject]

    //MARK:- isConnectedToInternet Functions

    static func isConnectedToInternet() -> Bool {
        
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
