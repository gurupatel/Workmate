//
//  WorkerData.swift
//  Workmate
//
//  Created by Gaurang Patel on 01/03/20.
//  Copyright © 2020 Workmate. All rights reserved.
//

import Foundation

class WorkerData: NSObject {
    
    // MARK: - Variables And Properties
    
    var positionEntity = Position()
    
    var managerEntity = Manager()
    
    var locationEntity = Location()
    
    var clientEntity = Client()
    
    var wage_amount: String? = nil
}
