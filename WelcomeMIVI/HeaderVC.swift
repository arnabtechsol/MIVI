//
//  HeaderVC.swift
//  WelcomeMIVI
//
//  Created by Arnab on 11/08/18.
//  Copyright © 2018 Arnab. All rights reserved.
//

import UIKit
protocol HeaaderVCDelegate {
    func bringHeaderVC(headerVC : UIViewController)
}

class HeaderVC: UIViewController {
    
    var delegate : HeaaderVCDelegate?

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var headerBG: UIView!
    
    var isBackHidden = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isBackHidden
        {
            backBtn.isHidden = true
        }

        self.headerBG.backgroundColor = UIColor(hexString: ColorAndStyle.headerBackgroundColor)
        // Do any additional setup after loading the view.
    }
    
    func showHeader()
    {
        self.delegate?.bringHeaderVC(headerVC: self)
    }
    
    func showHeader(backHidden : Bool)
    {
        isBackHidden = backHidden
        self.delegate?.bringHeaderVC(headerVC: self)
    }

    @IBAction func backBtnAction(_ sender: Any)
    {
        (delegate as! UIViewController).navigationController?.popViewController(animated: true)
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
