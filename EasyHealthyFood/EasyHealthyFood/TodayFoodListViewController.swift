//
//  TodayFoodListViewController.swift
//  EasyHealthyFood
//
//  Created by 王书琪 on 2017/10/21.
//  Copyright © 2017年 wsq. All rights reserved.
//

import UIKit

class TodayFoodListViewController: UIViewController {
    
    
    @IBOutlet weak var labelArea: UILabel! {
        didSet {
            updateUI()
        }
    }
    var todayChosen : [String] = [] {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        if labelArea != nil {
            var todayFoodString = ""
            if todayChosen.count == 0 {
                todayFoodString = "-oops, you didn't eat anything!-"
            } else {
                todayFoodString = todayChosen.joined(separator: " ")
            }
            
            let ttext = """
              HEYY!!
              Today You have eaten \(todayFoodString)
              Go to "Today" or "History" to check!
            """
            labelArea.text = ttext
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
