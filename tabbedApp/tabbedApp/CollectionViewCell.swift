//
//  CollectionViewCell.swift
//  CollectionViewBlog
//
//  Created by Erica Millado on 7/3/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit
//import SwiftCharts
import Charts

class CollectionViewCell: UICollectionViewCell {
    
//    @IBOutlet var myLabel: UILabel!
//    @IBOutlet var chartView: UIView!
    @IBOutlet weak var chtChart: LineChartView!
    
    var numbers : [Double] = [] //This is where we are going to store all the numbers. This can be a set of numbers that come from a Realm database, Core data, External API's or where ever else

    func loadData(origindata: [Double]) {
        numbers = []
        for i in 0..<origindata.count {
            numbers.append(origindata[i])
        }
    }
    func displayContent(origindata: [Double], label: String) {
        
//        let chartConfig = ChartConfigXY(
//            xAxisConfig: ChartAxisConfig(from: 2, to: 14, by: 2),
//            yAxisConfig: ChartAxisConfig(from: 0, to: 14, by: 2)
//        )
//
//        let frame = CGRect(x: 0, y: 0, width: chartView.frame.size.width, height: 400)
//
//        let chart = LineChart(
//            frame: frame,
//            chartConfig: chartConfig,
//            xTitle: "X axis",
//            yTitle: "Y axis",
//            lines: [
//                (chartPoints: [(2.0, 10.6), (4.2, 5.1), (7.3, 3.0), (8.1, 5.5), (14.0, 8.0)], color: UIColor.red),
//                (chartPoints: [(2.0, 2.6), (4.2, 4.1), (7.3, 1.0), (8.1, 11.5), (14.0, 3.0)], color: UIColor.blue)
//            ]
//        )
//
//        self.chartView.addSubview(chart.view)
        
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.
        
        loadData(origindata: origindata)
        //here is the for loop
        for i in 0..<numbers.count {
            
            let value = ChartDataEntry(x: Double(i), y: numbers[i]) // here we set the X and Y status in a data chart entry
            lineChartEntry.append(value) // here we add it to the data set
        }
        
        let line1 = LineChartDataSet(values: lineChartEntry, label: label) //Here we convert lineChartEntry to a LineChartDataSet
        line1.colors = [NSUIColor.blue] //Sets the colour to blue
        
        let data = LineChartData() //This is the object that will be added to the chart
        data.addDataSet(line1) //Adds the line to the dataSet
        
        
        chtChart.data = data //finally - it adds the chart data to the chart and causes an update
        chtChart.chartDescription?.text = "My awesome chart" // Here we set the description for the graph
    }
    
}
