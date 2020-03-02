//
//  WorkerController.swift
//  Workmate
//
//  Created by Gaurang Patel on 01/03/20.
//  Copyright © 2020 Workmate. All rights reserved.
//

import UIKit

class WorkerController: UIViewController {

    var indicator: UIActivityIndicatorView!

    @IBOutlet var lblPositionName: UILabel!
    @IBOutlet var lblClientName: UILabel!
    @IBOutlet var lblWageAmount: UILabel!
    @IBOutlet var lblStreet: UILabel!
    @IBOutlet var lblLocationManager: UILabel!
    @IBOutlet var lblContactNo: UILabel!
    @IBOutlet var lblClockIn: UILabel!
    @IBOutlet var lblClockOut: UILabel!

    @IBOutlet var lblPerDayTitle: UILabel!
    @IBOutlet var lblLocationManagerTitle: UILabel!
    @IBOutlet var lblContactNoTitle: UILabel!
    @IBOutlet var lblClockInTitle: UILabel!
    @IBOutlet var lblClockOutTitle: UILabel!

    @IBOutlet var lblClockBtnBg: UILabel!
    @IBOutlet var clockBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.addIndicator()
        
        self.initView()
    }

    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

        self.getWorkerData()
    }
    
    // MARK: - initView Method

    func initView() {
        
        lblPerDayTitle.isHidden = true
        lblContactNoTitle.isHidden = true
        lblLocationManagerTitle.isHidden = true
        lblClockInTitle.isHidden = true
        lblClockOutTitle.isHidden = true
        lblClockBtnBg.isHidden = true
        clockBtn.isHidden = true

        lblPositionName.textColor = Constants.getLightGreyColor()
        lblClientName.textColor = Constants.getLightGreyColor()
        lblWageAmount.textColor = Constants.getLightGreyColor()
        lblStreet.textColor = Constants.getLightGreyColor()
        lblLocationManager.textColor = Constants.getLightGreyColor()
        lblContactNo.textColor = Constants.getLightGreyColor()
        lblPerDayTitle.textColor = Constants.getLightGreyColor()
        lblLocationManagerTitle.textColor = Constants.getLightGreyColor()
        lblContactNoTitle.textColor = Constants.getLightGreyColor()
        lblClockInTitle.textColor = Constants.getLightGreyColor()
        lblClockOutTitle.textColor = Constants.getLightGreyColor()
        
        lblClockBtnBg.backgroundColor = UIColor(red: 0.496, green: 0.496, blue: 0.496, alpha: 1)
        lblClockBtnBg.layer.cornerRadius = 70.0
        lblClockBtnBg.layer.masksToBounds = true

        clockBtn.setTitleColor(UIColor(red: 0.467, green: 0.467, blue: 0.467, alpha: 1), for: .normal)
        clockBtn.backgroundColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
        clockBtn.layer.cornerRadius = 53.0
        clockBtn.layer.masksToBounds = true
    }
    
    // MARK: - getWorkerData Method

    func getWorkerData() {
        
        let webServices = WebServices()
        
        webServices.getWorkerData(completion: { (response, error) in

            self.removeIndicator()
            
            if (error != nil) {
                
                //Error
            }
            else {
                
                //API Success
                
                if (response != nil) {
                    
                    let workerDataEntity = WorkerDataParser.parseWorkerData(data: response)
                    
                    if (workerDataEntity != nil) {
                        
                        self.drawData(workerDataEntity: workerDataEntity!)
                    }
                }
            }
        })
    }
    
    // MARK: - drawData Method

    func drawData(workerDataEntity: WorkerData) {

        lblPerDayTitle.isHidden = false
        lblContactNoTitle.isHidden = false
        lblLocationManagerTitle.isHidden = false
        lblClockInTitle.isHidden = false
        lblClockOutTitle.isHidden = false
        lblClockBtnBg.isHidden = false
        clockBtn.isHidden = false

        lblPositionName.text = workerDataEntity.positionEntity.name!
        lblClientName.text = workerDataEntity.clientEntity.name!
        lblWageAmount.text = workerDataEntity.wage_amount!
        lblContactNo.text = workerDataEntity.managerEntity.phone!
        lblLocationManager.text = workerDataEntity.managerEntity.name!
        lblStreet.text = workerDataEntity.locationEntity.addressEntity.street!
        
        lblClockIn.text = "-"
        lblClockOut.text = "-"
    }
    
    // MARK: - addIndicator
    func addIndicator() {
    
        /* Adding UIActivityIndicatorView to view */
        indicator = Constants.createUIActivityIndicatorView()
        indicator.center = self.view.center

        self.view.addSubview(indicator)
        self.view.bringSubviewToFront(indicator)
        
        indicator.startAnimating()
    }
    
    // MARK: - removeIndicator
    func removeIndicator() {

        indicator.stopAnimating()
        
        indicator.removeFromSuperview()
    }
    
    // MARK: - Button Action Methods
    
    @IBAction func clockBtnAction(_ sender: UIButton?) {

        if (lblClockIn.text == "-") {
            
            //Check In
            
            lblClockIn.text = Constants.getTodayString()
            
            clockBtn.setTitle("Clock Out", for: .normal)
        }
        else {
            
            //Check Out

            lblClockOut.text = Constants.getTodayString()
            
            lblClockBtnBg.isHidden = true
            clockBtn.isHidden = true
        }
    }
    
    func addProgressBar() {
        
        let screenRect: CGRect = UIScreen.main.bounds

        let frameRect = CGRect(x: 0, y: 0, width: screenRect.width, height: screenRect.height)
        
        let customView = CustomView.init(frame: frameRect, view: self.view)
        
    }
}
