//
//  WebServices.swift
//  Workmate
//
//  Created by Gaurang Patel on 01/03/20.
//  Copyright © 2020 Workmate. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class WebServices : NSObject {

    var session: URLSession!

    public override init(){}

    // MARK: - authenticateUser Method

    func authenticateUser(params: [String : AnyObject], completion: @escaping (_ response: NSDictionary?, _ error: Error?) -> Void) {
        
        let URL: String = Constants.authenticateUser
                
        Network.sharedInstance.request(URL, method: Constants.postMethode, params: params, onCompletion: { (reponse) in
        
                let jsonObject = try? (JSONSerialization.jsonObject(with: reponse.rawData(), options: []) as! NSDictionary)

                let serverResponseDict = jsonObject as NSDictionary?

                //print("authenticateUser : ", serverResponseDict!)

                completion(serverResponseDict, reponse.error)
        })
    }
    
    // MARK: - getWorkerData Method

    func getWorkerData(completion: @escaping (_ response: NSDictionary?, _ error: Error?) -> Void) {
        
        let URL: String = Constants.getWorkerDataAPI
                
        Network.sharedInstance.request(URL, method: Constants.getMethode, params: nil, onCompletion: { (reponse) in
        
                let jsonObject = try? (JSONSerialization.jsonObject(with: reponse.rawData(), options: []) as! NSDictionary)

                let serverResponseDict = jsonObject as NSDictionary?

                //print("getWorkerData : ", getWorkerData!)

                completion(serverResponseDict, reponse.error)
        })
    }

    // MARK: - postClockInTime Method

    func postClockInTime(params: [String : AnyObject], completion: @escaping (_ response: NSDictionary?, _ error: Error?) -> Void) {
        
        let URL: String = Constants.clockInAPI
                
        Network.sharedInstance.request(URL, method: Constants.postMethode, params: params, onCompletion: { (reponse) in
        
                let jsonObject = try? (JSONSerialization.jsonObject(with: reponse.rawData(), options: []) as! NSDictionary)

                let serverResponseDict = jsonObject as NSDictionary?

                //print("postClockInTime : ", serverResponseDict!)

                completion(serverResponseDict, reponse.error)
        })
    }
    
    // MARK: - postClockOutTime Method

    func postClockOutTime(params: [String : AnyObject], completion: @escaping (_ response: NSDictionary?, _ error: Error?) -> Void) {
        
        let URL: String = Constants.clockOutAPI
                
        Network.sharedInstance.request(URL, method: Constants.postMethode, params: params, onCompletion: { (reponse) in
        
                let jsonObject = try? (JSONSerialization.jsonObject(with: reponse.rawData(), options: []) as! NSDictionary)

                let serverResponseDict = jsonObject as NSDictionary?

                //print("postClockOutTime : ", serverResponseDict!)

                completion(serverResponseDict, reponse.error)
        })
    }

}
