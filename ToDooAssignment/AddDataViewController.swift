//
//  File name- AddDataViewController.swift
//  Author name- Garima Prasher
// App Name- ToDoo Assignment

// Student ID- 301093329
// file Description: this is the main Todo List screen
//  Copyright © 2019 Garima Prasher. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore


class AddDataViewController: UIViewController {

    
    @IBOutlet weak var name: UITextView!
    @IBOutlet weak var notes: UITextView!
    var dict = [String:AnyObject]()
    
    var db:Firestore?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("dict",dict)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ADD(_ sender: UIButton) {
        
       db = Firestore.firestore()
       let docId = db?.collection("users").document().documentID

       let parameters = ["name":name.text!,"notes":notes.text!,"docId":docId!,"completed":false] as [String : Any]

       db?.collection("data").document(docId!).setData(parameters as [String : Any]){
           err in
           if let error = err{
               print(error.localizedDescription)
               
           }else{
               print("document added successfully")
               let alert = UIAlertController(title: "Message", message: "Successfully added", preferredStyle: .alert)
               let okay = UIAlertAction(title: "OK", style: .default, handler: { (action) in
//                   self.navigationController?.popViewController(animated: true)
               })
               alert.addAction(okay)
               self.present(alert, animated: true, completion: nil)
           }

       }
        
    }
    
    @IBAction func DELETE(_ sender: UIButton) {
        db = Firestore.firestore()
        db?.collection("data").document((dict["docId"] as? String)!).delete(){
            err in
            if let error = err{
                print(error.localizedDescription)
                
            }else{
                print("document deleted successfully")
                
                let alert = UIAlertController(title: "Message", message: "Successfully Deleted", preferredStyle: .alert)
                let okay = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    self.navigationController?.popViewController(animated: true)
                })
                alert.addAction(okay)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
    @IBAction func UPDATE(_ sender: UIButton) {
        
        db = Firestore.firestore()
        

        let parameters = ["name":name.text!,"notes":notes.text!,"docId":dict["docId"]!,"completed":false] as [String : Any]

         db?.collection("data").document((dict["docId"] as? String)!).updateData(parameters as [String : Any]){
             err in
             if let error = err{
                 print(error.localizedDescription)
                 
             }else{
                 print("document added successfully")
                 
                 let alert = UIAlertController(title: "Message", message: "Successfully Updated", preferredStyle: .alert)
                 let okay = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                     self.navigationController?.popViewController(animated: true)
                 })
                 alert.addAction(okay)
                 self.present(alert, animated: true, completion: nil)
                 
                 
             }

         }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
