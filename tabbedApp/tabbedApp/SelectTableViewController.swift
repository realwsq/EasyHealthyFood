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
    
    let backbutton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("back", for: .normal)
        btn.addTarget(self, action: #selector(backtapped), for: .touchUpInside)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    fileprivate func setupIdentifierBackbutton() {
        view.addSubview(backbutton)
        backbutton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 500).isActive = true
//        backbutton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        backbutton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backbutton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @IBAction func backtapped(_sender: Any) {
        print("back tapped")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("back tapped")
        self.dismiss(animated: true, completion: nil)
    }
    
    //
    // MARK :- HEADER
    //
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 150
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! CustomTableViewHeader
        return header
    }
    
    //
    // MARK :- FOOTER
    //
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 150
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerId) as! CustomTableViewFooter
        return footer
    }
    
    //
    // MARK :- CELL
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        guard let firstObservation = results.first else { return cell}
        let text = firstObservation.identifier + " " + String(firstObservation.confidence)
        print(text)
        //Programmatically create label
        let newLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 150))
//        newLabel.backgroundColor = .red
//        newLabel.font = UIFont(name: "Avenir", size: 17.0)
        newLabel.textColor = .blue
        newLabel.text = text
        cell.addSubview(newLabel)
        print(newLabel)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TableView Demo"
        view.backgroundColor = .white
        setupTableView()
        setupIdentifierBackbutton()
    }
    
    func setupTableView() {
        
        tableView.backgroundColor = .lightGray
        tableView.register(CustomTableViewHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
        tableView.register(CustomTableViewFooter.self, forHeaderFooterViewReuseIdentifier: footerId)
        tableView.register(CustomTableCell.self, forCellReuseIdentifier: cellId)
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


//
// MARK :- HEADER
//
class CustomTableViewHeader: UITableViewHeaderFooterView {
    
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
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
        
        contentView.backgroundColor = .green
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

