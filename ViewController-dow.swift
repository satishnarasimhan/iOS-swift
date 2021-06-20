//
//  ViewController.swift
//  DayOfTheWeekDetermination
//
//  Created by Satish Narasimhan on 8/28/17.
//  Copyright © 2017 SatishNarasimhan. All rights reserved.
//
///Gregorian calendar is calculated as:

///h = (q + [13(m+1)/5] + K + K/4 + J/4 + 5*J ) mod 7

///where
///h is the day of the week (0 = Saturday, 1 = Sunday, 2 = Monday, ..., 6 = Friday)
///q is the day of the month
///m is the month (3 = March, 4 = April, 5 = May, ..., 14 = February. January, the first month would count as the 13th month of the previous year)
///K is year mod 100
///J is the zero based century. This is determined by floor division i.e. year // 100 and determines the century -19 in 1995, 20 in 2017

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayField: UITextField!
    
    @IBOutlet weak var monthField: UITextField!
    
    @IBOutlet weak var yearField: UITextField!
    
    @IBOutlet weak var displayDate: UITextView!
    
    @IBOutlet weak var calculate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dayField.delegate = self
        monthField.delegate = self
        yearField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dayCalculate(_ sender: Any) {
        
       // Use the inputs for the Gregorian date calculator
        let q = Int(dayField.text!)
        var m = Int(monthField.text!)
        var year = Int(yearField.text!)
        
        // If January, then the month should be set to the 13th month and February to 14th, of the previous year. Other months remain as is.

        if (m == 1) {
            m = 13
            year = (year! - 1)
        } else if(m == 2){
            m = 14
            year = (year! - 1)
        } else {
            m = (m!*1)
        }
        
        let J = year! / 100
        let K = year!%100
        
        // Calculating what constitutes the formula
        
        let g1 = (q! + (13*(m!+1)/5))
        let g2 = (K + (K/4) + (J/4) + (5*J))
        
        let g = (g1 + g2)
        
        // Obtain the day of the week as a number
        let h = g%7
        
        // Days of the week, with Saturday set to 0, Sunday set to 1,...etc.
        let days = ["Saturday","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday"]
        let display: String = days[h]
        
        // Display
        displayDate.text = "The date \(dayField.text!)-\(monthField.text!)-\(yearField.text!) falls on a \(display)"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dayField.resignFirstResponder()
        monthField.resignFirstResponder()
        yearField.resignFirstResponder()
    }
    
}

extension ViewController:  UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.resignFirstResponder()
        return true
    }
}
