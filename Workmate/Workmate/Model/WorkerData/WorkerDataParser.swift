//
//  WorkerDataParser.swift
//  Workmate
//
//  Created by Gaurang Patel on 01/03/20.
//  Copyright © 2020 Workmate. All rights reserved.
//

import Foundation

class WorkerDataParser: NSObject {

    // MARK: - parseWorkerData

    static func parseWorkerData(data : NSDictionary?) -> WorkerData? {
        
        let workerDataEntity = WorkerData()

        if (data != nil) {
         
            workerDataEntity.positionEntity = self.parseWorkerPosition(data: data!["position"] as? NSDictionary)!
            workerDataEntity.managerEntity = self.parseManagerData(data: data!["manager"] as? NSDictionary)!
            workerDataEntity.locationEntity = self.parseLocationData(data: data!["location"] as? NSDictionary)!
            workerDataEntity.clientEntity = self.parseClientData(data: data!["client"] as? NSDictionary)!
            workerDataEntity.wage_amount = data!["wage_amount"] as? String ?? ""
        }
        
        return workerDataEntity
    }
    
    // MARK: - parseWorkerPosition

    static func parseWorkerPosition(data : NSDictionary?) -> Position? {
        
        let positionEntity = Position()
        
        if (data != nil) {

            positionEntity.name = data!["name"] as? String ?? ""
        }
        
        return positionEntity
    }
    
    // MARK: - parseManagerData

    static func parseManagerData(data : NSDictionary?) -> Manager? {
        
        let managerEntity = Manager()
        
        if (data != nil) {

            managerEntity.name = data!["name"] as? String ?? ""
            managerEntity.email = data!["email"] as? String ?? ""
            managerEntity.phone = data!["phone"] as? String ?? ""
        }
        
        return managerEntity
    }
    
    // MARK: - parseLocationData

    static func parseLocationData(data : NSDictionary?) -> Location? {
        
        let locationEntity = Location()
        
        if (data != nil) {

            locationEntity.addressEntity = self.parseAddressData(data: (data!["address"] as! NSDictionary))!
        }
        
        return locationEntity
    }
    
    // MARK: - parseAddressData

    static func parseAddressData(data : NSDictionary?) -> Address? {
        
        let addressEntity = Address()
        
        if (data != nil) {

            addressEntity.street = data!["street_1"] as? String ?? ""
            addressEntity.latitude = (data!["latitude"] as? NSNumber)!
            addressEntity.longitude = (data!["longitude"] as? NSNumber)!
        }
        
        return addressEntity
    }

    // MARK: - parseClientData

    static func parseClientData(data : NSDictionary?) -> Client? {
        
        let clientEntity = Client()
        
        if (data != nil) {

            clientEntity.name = data!["name"] as? String ?? ""
        }
        
        return clientEntity
    }
}

