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
    
    var dictionary = [[String:AnyObject]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let index = dictionary[indexPath.row]
        print("index",index)
        
        if let x = cell.viewWithTag(1) as? UILabel{
            x.text = "dnnj"
        }
        
        
        if let y = cell.viewWithTag(2) as? UILabel{
            y.text = "dnnj"
        }
        
        return cell
    }
    
    
    func retrieveData(){
        
        db = Firestore.firestore()
        db?.collection("data").getDocuments(completion: { (snap, err) in
        
            for i in snap!.documents{
                self.dictionary.append(i.data() as [String : AnyObject])
                
            }
            print("dict is",self.dictionary)
            
            
        })
        self.listTable.reloadData()
    }
    
    
    
    
    
    
    
    


}

