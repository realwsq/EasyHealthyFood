//
//  CameraViewController.swift
//  EasyHealthyFood
//
//  Created by 王书琪 on 2017/10/19.
//  Copyright © 2017年 wsq. All rights reserved.
//

import UIKit
import AVKit

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    private var historyChosen : [String] = []
    private var chosen : String? {
        didSet {
            if chosen != nil {
                labelArea.text = "You chose it to be \(String(describing: chosen!))!"
            } else {
                labelArea.text = ""
            }
        }
    }

    @IBOutlet weak var labelArea: UILabel!
//    @IBOutlet weak var firstClassification: UIButton!
    @IBOutlet var classifications: [UIButton]!
    @IBAction func selectOne(_ sender: UIButton) {
        if let text = sender.currentTitle {
            if text.count > 0 {
                chosen = text
            }
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    private var image : UIImage? {
        didSet {
            if image == nil {
                imageView.image = nil
                clearButtons()
            } else {
                imageView.image = image
                setButtons()
            }
            
        }
    }
    
    private func clearButtons() {
        for i in 0..<classifications.count {
            classifications[i].setTitle("", for: .normal)
        }
    }
    private func setButtons() {
        for i in 0..<classifications.count {
            classifications[i].setTitle(PersonalData.AllKindsOfFood[i], for: .normal)
        }
    }
    
    
    private func insertChosenToHistoryChosen() {
        if chosen != nil {
            historyChosen.insert(chosen!, at: 0)
            chosen = nil
        }
    }
    
    private func clearAll() {
        image = nil
        insertChosenToHistoryChosen()
    }
    
    @IBAction func takePhoto(_ sender: UIButton) {
        clearAll()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func confirmAll(_ sender: UIButton) {
        clearAll()
        print(historyChosen)
        notifyNewDataRecord()
        historyChosen = []
    }
    
    private var imagePicker: UIImagePickerController!
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {

        imagePicker.dismiss(animated: true, completion: nil)
        image = info[UIImagePickerControllerOriginalImage] as? UIImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        chosen = nil
        historyChosen = []
        image = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    private func notifyNewDataRecord() {
        
        
        PersonalData.AddTodayData(food: historyChosen)
        
        if let todayDataViewController = tabBarController?.viewControllers![0] as? TodayDataViewController {
            todayDataViewController.todayData = PersonalData.TodayData
        }
        if let historyDataViewController = tabBarController?.viewControllers![2] as? HistoryDataViewController {
            historyDataViewController.historyData = PersonalData.HistoryData
        }
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationvc = segue.destination
        if let todayFoodListVC = destinationvc as? TodayFoodListViewController {
            todayFoodListVC.todayChosen = historyChosen
        }
    }

}
