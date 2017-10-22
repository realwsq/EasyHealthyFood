//
//  DataBrian.swift
//  EasyHealthyFood
//
//  Created by 王书琪 on 2017/10/18.
//  Copyright © 2017年 wsq. All rights reserved.
//

import Foundation

class PersonalData
{
//    static var PersonalDataBase = PersonalData()
    
    static var HistoryData : [Dictionary<String, Double>] = []
    static var TodayData : Dictionary<String, Double>?
    static var Nutritions = ["protein", "fat", "mineralSubstance", "vitamin"]
    static var AllKindsOfFood = ["egg", "beef", "potato"]
    static var NutritionTable =  [
        "egg": ["protein": 0.3, "fat": 2.0, "mineralSubstance": 0.1, "vitamin": 0.2],
        "beef": ["protein": 2.3, "fat": 5.0, "mineralSubstance": 0.04, "vitamin": 0.1],
        "potato": ["protein": 0.2, "fat": 1.0, "mineralSubstance": 0.2, "vitamin": 0.3],
    ]
    
    static func AddTodayData(protein: Double, fat: Double, mineralSubstance ms: Double, vitamin: Double) {
        let todayData = ["protein": protein, "fat": fat, "mineralSubstance": ms, "vitamin": vitamin]
        PersonalData.TodayData = todayData
        PersonalData.HistoryData.insert(todayData, at: 0)
    }
    static func AddTodayData(food: [String]) {
        var result = ["protein": 0.0, "fat": 0.0, "mineralSubstance": 0.0, "vitamin": 0.0]
        for i in 0..<food.count {
            let nextfood = food[i]
            if NutritionTable[nextfood] != nil {
                result = [
                    "protein": result["protein"]!+NutritionTable[nextfood]!["protein"]!,
                    "fat": result["fat"]!+NutritionTable[nextfood]!["fat"]!,
                    "mineralSubstance": result["mineralSubstance"]!+NutritionTable[nextfood]!["mineralSubstance"]!,
                    "vitamin": result["vitamin"]!+NutritionTable[nextfood]!["vitamin"]!
                ]
            }
            
        }
        let todayData = result
        PersonalData.TodayData = todayData
        PersonalData.HistoryData.insert(todayData, at: 0)
    }
    
}

//struct NutritionFacts
//{
//    var protein = 0.0
//    var fat = 0.0
//    var mineralSubstance = 0.0
//    var vitamin = 0.0
//}


