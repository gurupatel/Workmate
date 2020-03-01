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

    @IBOutlet var customProgress: CustomProgress!
    
    public init(frame: CGRect , view : UIView) {
        super.init(frame: frame )
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        
        contentView.frame = frame
        contentView.autoresizingMask = [.flexibleHeight , .flexibleWidth]
        contentView.alpha = 0.96
        contentView.layer.backgroundColor = UIColor(red: 0.249, green: 0.249, blue: 0.249, alpha: 1).cgColor
        view.addSubview(contentView)
        
        self.startProgress()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func startProgress() {

        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)

        customProgress = CustomProgress(frame: contentView.frame)
        customProgress.backgroundColor = UIColor.lightGray
        customProgress.leftImage.backgroundColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 1)
        customProgress.presentLabel.isHidden = true
        customProgress.maxValue = 100
    }
    
    @objc private func timerUpdate() {
        
        currentValue += 1
        if currentValue <= 100 {
            customProgress.setPresent(currentValue)
        }else {

            timer?.invalidate()
            timer = nil
            
            currentValue = 0
        }
    }

}
