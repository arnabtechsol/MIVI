//
//  LoginVC.swift
//  WelcomeMIVI
//
//  Created by Arnab on 11/08/18.
//  Copyright © 2018 Arnab. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, HeaaderVCDelegate, ForgetPasswordVCDelegate {
    
    func bringForgetPassword(forgetPasswordVC: UIViewController) {
        
        forgetPasswordView = forgetPasswordVC.view
        forgetPasswordView.frame.size.width = self.view.frame.size.width
        forgetPasswordView.frame.origin.y = 100
        self.view.addSubview(forgetPasswordView)
        
    }
    
    func hideForgetPassword(forgetPasswordVC: UIViewController) {
        
        forgetPasswordView.removeFromSuperview()
    }

    func bringHeaderVC(headerVC: UIViewController) {
        
        headerVC.view.frame.size.width = self.view.frame.size.width
        self.view.addSubview(headerVC.view)
    }
    

    @IBOutlet weak var lblUserName: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    
    var headerVC = HeaderVC()
    var forgetPassword = ForgetPasswordVC()
    var forgetPasswordView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerVC.delegate = self
        headerVC.showHeader(backHidden: true)
        
        self.view.backgroundColor = UIColor(hexString: ColorAndStyle.appBackgroundColor)
        
        StaticJsonController.getWFEJSONDataFromDocumentDirectory()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginBtnAction(_ sender: Any) {
        
        if self.lblUserName.text == USERNAME && self.lblPassword.text == PASSWORD
        {
            let dashBoardVC = DashBoardVC(nibName: "DashBoardVC", bundle: nil)
            self.navigationController?.pushViewController(dashBoardVC, animated: true)
        }
        else
        {
           DataController.showAlert(classInstance: self, message: "Email and Password not matching")
        }
        
        
    }
    
    @IBAction func forgetPasswordAction(_ sender: Any)
    {
        forgetPassword.delegate = self
        forgetPassword.callForgetPassword()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
