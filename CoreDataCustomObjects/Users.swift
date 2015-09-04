//
//  Users.swift
//  CoreDataCustomObjects
//
//  Created by Mayur on 03/09/15.
//  Copyright (c) 2015 Mayur. All rights reserved.
//

import UIKit
import CoreData         // Added manually to debug the error in the class being of type NSManagedObject written underneath

@objc(Users)                    //probable explanation: CoreData is coded in objective C and it probably does not recognise our class defined (Users). This causes an error in our ViewController.swoft file. it is fixed with this line


class Users: NSManagedObject {
   
    @NSManaged var username : String
    @NSManaged var password : String
    
    
    //since we have used a custom class to implement CoreDAta, we can add functions that can act like filters to this class and implement them. like:
    func displayName() -> String{
        return "The username is \(username) and the password is \(password)"
        
    }
    func editPassword(existingUserName : String, newPassword: String){
        if(username == existingUserName){
            password = newPassword
            println("password changed")
        }
        
        else{
            println("Some error occured")
        }
    }
    
    func addRandomPrefix(){
        username = "Modified " + username
    }
    
}
