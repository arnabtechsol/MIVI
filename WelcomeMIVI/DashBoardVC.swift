//
//  DashBoardVC.swift
//  WelcomeMIVI
//
//  Created by Arnab on 11/08/18.
//  Copyright © 2018 Arnab. All rights reserved.
//

import UIKit

class DashBoardVC: UIViewController, UITableViewDataSource , HeaaderVCDelegate {
    
    
    func bringHeaderVC(headerVC: UIViewController) {
        
        headerVC.view.frame.size.width = headerArea.frame.size.width
        headerArea.addSubview(headerVC.view)
    }

    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var displayTableView: UITableView!
    @IBOutlet weak var headerArea: UIView!
    
    var dataDictionary = [String : Any]()
    var headerVC = HeaderVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(hexString: ColorAndStyle.appBackgroundColor)

        
        let loadBundleRadioTableViewCell = Bundle(for: DashBoardTableCell.self)
        displayTableView.register(UINib(nibName: "DashBoardTableCell", bundle: loadBundleRadioTableViewCell), forCellReuseIdentifier: "DashBoardTableCell")
        
        displayTableView.dataSource = self
        dataDictionary = DashBoardController.getDataAccordingToSelection(selectedIndex: segmentController.selectedSegmentIndex)
        
        headerVC.delegate = self
        headerVC.showHeader()
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DashBoardTableCell", for: indexPath) as! DashBoardTableCell
        
        let key = Array(dataDictionary.keys)[indexPath.row]
        let value : Any = dataDictionary[key]!
       
        cell.infoName.text = key
        if value as? Bool !=  nil
        {
            if (value as? Bool) == true
            {
                cell.info?.text = "True"
            }
            else
            {
                cell.info?.text = "False"
            }
            
        }
        else if value as? String !=  nil
        {
            cell.info?.text = value as? String
        }
        else if value as? Float !=  nil
        {
            cell.info?.text = String(value as! Float)
        }
        else
        {
            cell.info?.text = "No Data"
        }
        
        return cell
    }

    @IBAction func segmentControlAction(_ sender: Any) {
        
        dataDictionary = DashBoardController.getDataAccordingToSelection(selectedIndex: segmentController.selectedSegmentIndex)
        displayTableView.reloadData()
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
