//
//  WorkerController.swift
//  Workmate
//
//  Created by Gaurang Patel on 01/03/20.
//  Copyright © 2020 Workmate. All rights reserved.
//

import UIKit

class WorkerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

        self.getWorkerData()
    }
    
    // MARK: - getWorkerData Method

    func getWorkerData() {
        
        let webServices = WebServices()
        
        webServices.getWorkerData(completion: { (response, error) in

            if (error != nil) {
                
                //Error
            }
            else {
                
                //API Success
                
                if (response != nil) {
                    
                    let workerDataEntity = WorkerDataParser.parseWorkerData(data: response)
                }
            }
        })
    }
}

