//
//  SecondViewController.swift
//  EasyHealthyFood
//
//  Created by 王书琪 on 2017/10/18.
//  Copyright © 2017年 wsq. All rights reserved.
//

import UIKit
import Charts

class HistoryDataViewController: UIViewController
{
    
    @IBOutlet weak var lineChart: LineChartView! {
        didSet {
            updateUI()
        }
    }
    
    private var nutrition = "protein" {
        didSet {
            if PersonalData.Nutritions.contains(nutrition) {
                
            } else {
                nutrition = "protein"
            }
            print("nutrition reset")
            updateUI()
        }
    }
    var historyData : [Dictionary<String, Double>] = [] {
        didSet {
            print("historydata reset")
            updateUI()
        }
    }
    
    private func updateUI() {
        if lineChart == nil {return}
        let nutritionFacts = historyData.map {
            $0[nutrition]
        }
        
        let days = nutritionFacts.count
        let daysCount = 0..<days

        let lineChartEntry  = daysCount.map{
            ChartDataEntry(x: Double($0), y: nutritionFacts[days-1-$0]!)
        }

        let line1 = LineChartDataSet(values: lineChartEntry, label: nutrition)
        line1.colors = [NSUIColor.blue] //Sets the colour to blue

        let data = LineChartData(dataSets:[line1]) //This is the object that will be added to the chart
        
        lineChart.data = data //finally - it adds the chart data to the chart and causes an update
        lineChart.chartDescription?.text = "History Data" // Here we set the description for the graph
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        historyData = PersonalData.HistoryData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ChangeNutrition(_ sender: UIButton) {
        if let text = sender.titleLabel?.text {
            nutrition = text
        }
    }
    
}

