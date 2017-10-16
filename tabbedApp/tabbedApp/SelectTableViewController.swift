//
//  SelectTableViewController.swift
//  tabbedApp
//
//  Created by 王书琪 on 2017/10/13.
//  Copyright © 2017年 wsq. All rights reserved.
//

import UIKit
import Vision



class SelectTableViewController: UITableViewController {
    var photoClassifierResults : [[VNClassificationObservation]]?
    
    private let headerId = "headerId"
    private let footerId = "footerId"
    private let cellId = "cellId"
    
    
    @IBAction func backtapped(_sender: Any) {
        print("back tapped")
        
        self.dismiss(animated: true, completion: nil)
        //实例化一个登陆界面
//        let loginView = MainViewController()
//        loginView.photoClassifierResults = photoresults
        //从下弹出一个界面作为登陆界面，completion作为闭包，可以写一些弹出loginView时的一些操作
        
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let loginView = storyboard.instantiateViewController(withIdentifier: "MainViewController")

//        self.present(loginView, animated: true, completion: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("back tapped")
        self.dismiss(animated: true, completion: nil)
    }
    
    //
    // MARK :- HEADER
    //
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 10
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! CustomTableViewHeader
        return header
    }
    
    //
    // MARK :- FOOTER
    //
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerId) as! CustomTableViewFooter
        
        let nbtn = UIButton(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width), height: Int(50)))
        nbtn.backgroundColor = .blue
        nbtn.setTitle("back", for: .normal)
        nbtn.translatesAutoresizingMaskIntoConstraints = false
//        nbtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        nbtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        nbtn.addTarget(self, action: #selector(SelectTableViewController.backtapped), for: .touchUpInside)
        
        footer.addSubview(nbtn)
        print(nbtn)
        
        return footer
    }
    
    //
    // MARK :- CELL
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\n\n\n\n")
        print(photoClassifierResults)
        if photoClassifierResults == nil {
            return 0
        }
        return photoClassifierResults!.count
//        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomTableCell
        if photoClassifierResults == nil {
            return cell
        }
        guard let results = photoClassifierResults![indexPath.item] as? [VNClassificationObservation] else { return cell}
        
        decorateCell(cell: cell, results: results)
        
        return cell
    }
    
    func decorateCell(cell : CustomTableCell!, results : [VNClassificationObservation]){
//        guard let firstObservation = results.first else { return }
//        var firstObsId = firstObservation.identifier
       
        for i in 0..<3 {
//            var observation = results[i]
//            var identifier = observation.identifier
            guard let firstObservation = results.first else { return }
            var identifier = firstObservation.identifier
            
            let nbtn = UIButton(frame: CGRect(x: 0, y: 50*i, width: Int(self.view.frame.width), height: 50))
            nbtn.backgroundColor = .yellow
            nbtn.setTitle(identifier, for: .normal)
            
            cell.addSubview(nbtn)
            print(nbtn)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TableView Demo"
        view.backgroundColor = .white
        setupTableView()
//        setupIdentifierBackbutton()
    }
    
    func setupTableView() {
        
        tableView.backgroundColor = .lightGray
        tableView.register(CustomTableViewHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
        tableView.register(CustomTableViewFooter.self, forHeaderFooterViewReuseIdentifier: footerId)
        tableView.register(CustomTableCell.self, forCellReuseIdentifier: cellId)
    }

}


//
// MARK :- HEADER
//
class CustomTableViewHeader: UITableViewHeaderFooterView {
    
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .blue
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
// MARK :- FOOTER
//
class CustomTableViewFooter: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
// MARK :- CELL
//
class CustomTableCell: UITableViewCell {

    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .orange
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

