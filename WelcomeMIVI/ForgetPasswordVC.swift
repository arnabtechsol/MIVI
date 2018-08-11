//
//  ForgetPasswordVC.swift
//  WelcomeMIVI
//
//  Created by Arnab on 12/08/18.
//  Copyright © 2018 Arnab. All rights reserved.
//

import UIKit

protocol ForgetPasswordVCDelegate {
    func bringForgetPassword(forgetPasswordVC : UIViewController)
    func hideForgetPassword(forgetPasswordVC : UIViewController)
}

class ForgetPasswordVC: UIViewController {

    var delegate : ForgetPasswordVCDelegate?
    
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func callForgetPassword() {
        delegate?.bringForgetPassword(forgetPasswordVC: self)
    }

    @IBAction func enterAction(_ sender: Any) {
        
        if txtEmail.text == ""
        {
            DataController.showAlert(classInstance: self, message: "Enter your email id")
        }
        else
        {
            if  DataController.isValidEmail(testStr: txtEmail.text!)
            {
                DataController.showAlert(classInstance: self, message: "Password sent to your email id")
            }
            else
            {
                DataController.showAlert(classInstance: self, message: "email format is not currect")
            }
        }
    }
    
    @IBAction func cancelAction(_ sender: Any)
    {
        delegate?.hideForgetPassword(forgetPasswordVC: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
