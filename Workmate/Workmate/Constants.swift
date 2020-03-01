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
        
    //MARK:- isConnectedToInternet Functions

    static func isConnectedToInternet() -> Bool {
        
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
