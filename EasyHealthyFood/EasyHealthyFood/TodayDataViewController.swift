//
//  FirstViewController.swift
//  EasyHealthyFood
//
//  Created by 王书琪 on 2017/10/18.
//  Copyright © 2017年 wsq. All rights reserved.
//

import UIKit
import Charts

class TodayDataViewController: UIViewController
{
    
    
    @IBOutlet weak var radarChart: RadarChartView!
    private var nutritions = PersonalData.Nutritions
    
    var todayData : Dictionary<String, Double>? {
        didSet {
            print("todayData reset")
            updateUI()
        }
    }
    
    private func updateUI() {
        var radarChartEntry  = [RadarChartDataEntry]()
        if todayData != nil {
            let nutritionCount = 0..<nutritions.count
            radarChartEntry = nutritionCount.map {
                RadarChartDataEntry(value: todayData![nutritions[$0]]!)
            }
        }
        let line1 = RadarChartDataSet(values: radarChartEntry, label: "todayData")
        line1.drawFilledEnabled = true
        let data = RadarChartData(dataSet: line1)
        // ATTENTION: XAxisRendererRadarChart.swift was revised!! to set the label
        
        radarChart.data = data //finally - it adds the chart data to the chart and causes an update
        radarChart.chartDescription?.text = "Today Data" // Here we set the description for the graph
        
//        radarChart.innerWebColor = NSUIColor.red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        todayData = PersonalData.TodayData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

