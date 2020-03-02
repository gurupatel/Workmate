//
//  CustomView.swift
//  Workmate
//
//  Created by Gaurang Patel on 02/03/20.
//  Copyright © 2020 Workmate. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView {

    @IBOutlet var contentView: UIView!

    var timer: Timer?
    
    var currentValue: Int = 0

    @IBOutlet var customProgress: UIView!
    
    @IBOutlet var lblChecking: UILabel!

    @IBOutlet var lblCancel: UILabel!

    var progress : CustomProgress!
    
    var delegate: WorkerController?

    public init(frame: CGRect , view : UIView) {
        super.init(frame: frame )
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        
        contentView.frame = frame
        contentView.autoresizingMask = [.flexibleHeight , .flexibleWidth]
        contentView.alpha = 1
        contentView.layer.backgroundColor = UIColor(red: 0.249, green: 0.249, blue: 0.249, alpha: 1).cgColor
        view.addSubview(contentView)
        
        customProgress.layer.cornerRadius = 4.0
        customProgress.layer.masksToBounds = true

        lblCancel.attributedText = NSAttributedString(string: "CANCEL", attributes:
        [.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        self.startProgress()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func startProgress() {

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)

        let viewFrame = CGRect(x: 0, y: 0, width: customProgress.frame.size.width, height: 20)
        
        progress = CustomProgress(frame: viewFrame)
        progress.backgroundColor = .white
        progress.leftImage.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
        progress.presentLabel.isHidden = true
        progress.maxValue = 10
        
        customProgress.addSubview(progress)
    }
    
    @objc private func timerUpdate() {
        
        currentValue += 1
        if currentValue <= 10 {
            progress.setPresent(currentValue)
        }else {

            if (delegate != nil) {
             
                if (delegate!.lblClockIn.text == "-") {
                    
                    //Check In
                           
                    delegate!.drawClockInData()
                }
                else {
                    
                    //Check Out

                    delegate!.drawClockOutData()
                }
            }

            self.cancelBtnAction(nil)
            
            self.invalidateTimer()
        }
    }

    func invalidateTimer() {
        
        timer?.invalidate()
        timer = nil
        
        currentValue = 0
    }
    
    // MARK: - Button Action Methods
    
    @IBAction func cancelBtnAction(_ sender: UIButton?) {
        
        self.invalidateTimer()

        self.contentView.removeFromSuperview()
    }
}
