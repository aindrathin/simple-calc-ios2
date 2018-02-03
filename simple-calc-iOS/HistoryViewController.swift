//
//  HistoryViewController.swift
//  simple-calc-iOS
//
//  Created by Aindra Thin on 2/2/18.
//  Copyright © 2018 Aindra Thin. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    
    @IBAction func backButton(_ sender: UIButton) {
        
    }
    
    // public var history : [String] = [] // stores previous calculations
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if history.count > 0 {
            for index in 0...history.count-1 {
                let label = UILabel(frame: CGRect(x:50, y: index * 25 + 100, width:300, height: 40))
                label.text = history[index]
                view.addSubview(label)
            }
        }
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
