//
//  ViewController.swift
//  CoreDataCustomObjects
//
//  Created by Mayur on 11/08/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet var txtUserName : UITextField!
    @IBOutlet var txtPassword : UITextField!
    
    
    @IBAction func saveBtnPressed(){
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate // forecefully casting the UIApplication.sharedApplication().delegate  as AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let ent = NSEntityDescription.entityForName("Users", inManagedObjectContext: context)
        
        var newUser = Users(entity:ent!, insertIntoManagedObjectContext: context)
        
        newUser.username = txtUserName.text
        newUser.password = txtPassword.text
        context.save(nil)       //errors not handled right now -> nil passed
        
        //print on console to check values:
        println(newUser)
        println("object just got saved ")
    }
    
    @IBAction func loadBtnPressed(){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate // forecefully casting the UIApplication.sharedApplication().delegate  as AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false      //changes format of the results being displayed
        request.predicate = NSPredicate(format: "username = %@", txtUserName.text)
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)!
        
        if results.count > 0{
            
            for user in results{
                var thisUser = user as! Users
                txtPassword.text = thisUser.password
                
                
                
                // implementation of the custom functions defined in the class defined inside Users.swift
                println(thisUser.displayName())
                thisUser.editPassword(txtPassword.text, newPassword: "this is a new password")
                thisUser.addRandomPrefix()
                println(thisUser.displayName())
            }
            
            
            print("one match found")
        }
        else{
            print("no record found")
        }

        
    }

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

