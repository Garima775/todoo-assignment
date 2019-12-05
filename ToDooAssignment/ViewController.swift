//
//  File name- ViewController.swift
//  Author name- Garima Prasher
// App Name- ToDoo Assignment

// Student ID- 301093329
// file Description: this is the main Todo List screen
//  Copyright © 2019 Garima Prasher. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var listTable: UITableView!
    
    var db:Firestore?
    var arr = ["sdada","dasdasd"]
    var dictionary = [[String:AnyObject]]()
    var indexDict = [String:AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        indexDict = dictionary[indexPath.row]
        
        if let x = cell.viewWithTag(1) as? UILabel{
            x.text = indexDict["name"] as? String
        }
        
        if let y = cell.viewWithTag(2) as? UILabel{
            y.text = indexDict["notes"] as? String
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexDict = dictionary[indexPath.row]
        self.performSegue(withIdentifier: "data", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "data"{
            let vc = segue.destination as? AddDataViewController
            vc!.dict = indexDict
        }
    }
    
    
    
    func retrieveData(){
        
        db = Firestore.firestore()
        db?.collection("data").getDocuments(completion: { (snap, err) in
        
            for i in snap!.documents{
                self.dictionary.append(i.data() as [String : AnyObject])
                
            }
            print("dict is",self.dictionary)
            
            self.listTable.reloadData()
        })
        
    }
    
    
    
    
    
    
    
    


}

