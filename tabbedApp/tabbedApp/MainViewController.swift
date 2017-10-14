//
//  MainViewController.swift
//  tabbedApp
//
//  Created by 王书琪 on 2017/10/14.
//  Copyright © 2017年 wsq. All rights reserved.
//

import UIKit
import Charts

class MainViewController: UIViewController {
    
    @IBOutlet weak var chtChart: RadarChartView!
    
    var numbers : [Double] = [] //This is where we are going to store all the numbers. This can be a set of numbers that come from a Realm database, Core data, External API's or where ever else
    
    func loadData(origindata: [Double]) {
        numbers = []
        for i in 0..<origindata.count {
            numbers.append(origindata[i])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var radarChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.
        
        loadData(origindata: [1,2,3,4,5])
        //here is the for loop
        for i in 0..<numbers.count {
            
            let value = ChartDataEntry(x: Double(i), y: numbers[i]) // here we set the X and Y status in a data chart entry
            radarChartEntry.append(value) // here we add it to the data set
        }
        
        let line1 = RadarChartDataSet(values: radarChartEntry, label: "test") //Here we convert lineChartEntry to a LineChartDataSet
        
        line1.fillColor = NSUIColor.blue //Sets the colour to blue
        
        let data = RadarChartData() //This is the object that will be added to the chart
        data.addDataSet(line1) //Adds the line to the dataSet
        
        
        chtChart.data = data //finally - it adds the chart data to the chart and causes an update
        chtChart.chartDescription?.text = "My awesome chart" // Here we set the description for the graph
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
