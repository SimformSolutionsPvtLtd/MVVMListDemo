//
//  UserManager.swift
//  MVVMListDemo
//
//  Created by Tejas Ardeshna on 19/03/18.
//  Copyright © 2018 Simform Solutions PVT. LTD. All rights reserved.
//

import Foundation

private struct TJUserConstants {
    // NSUserDefaults persistence keys
    static let userIdKey              = "userIdKey"
    static let EmailKey               = "EmailKey"
    static let FirstnameKey           = "FirstnameKey"
    static let LastnameKey            = "LastnameKey"
    static let GenderKey              = "GenderKey"
    static let DOBKey                 = "DOBKey"
}

enum Gender: String {
    case male   = "male"
    case female = "female"
    case other
}

class UserManager {

    // static properties get lazy evaluation and dispatch_once_t for free
    struct Static {
        static let instance = UserManager()
    }
    
    // this is the Swift way to do singletons
    class var userManager: UserManager
    {
        return Static.instance
    }
    
    // user authentication always begins with a UUID
    let userDefaults = UserDefaults.standard
    
    
    // username etc. are backed by NSUserDefaults, no need for further local storage
    
    // user email Address
    var emailAddress: String? {
        
        get {
            return userDefaults.object(forKey: TJUserConstants.EmailKey) as? String ?? nil
        }
        
        set (newValue) {
            userDefaults.set(newValue, forKey: TJUserConstants.EmailKey)
            userDefaults.synchronize()
        }
        
    }
    // user first name
    var firstname: String? {
        
        get {
            return userDefaults.object(forKey: TJUserConstants.FirstnameKey) as? String ?? nil
        }
        
        set (newValue) {
            userDefaults.set(newValue, forKey: TJUserConstants.FirstnameKey)
            userDefaults.synchronize()
        }
        
    }
    
    // user last name
    var lastname: String? {
        
        get {
            return userDefaults.object(forKey: TJUserConstants.LastnameKey) as? String ?? nil
        }
        
        set (newValue) {
            userDefaults.set(newValue, forKey: TJUserConstants.LastnameKey)
            userDefaults.synchronize()
        }
        
    }
    
    // user gender as a string
    private var genderStr: String? {
        
        get {
            return userDefaults.object(forKey: TJUserConstants.GenderKey) as? String ?? ""
        }
        
        set (newValue) {
            userDefaults.set(newValue, forKey: TJUserConstants.GenderKey)
            userDefaults.synchronize()
        }
        
    }
    
    // user date of birth as string
    var dateOfBirth: String? {
        
        get {
            return userDefaults.object(forKey: TJUserConstants.DOBKey) as? String ?? nil
        }
        
        set (newValue) {
            userDefaults.set(newValue, forKey: TJUserConstants.DOBKey)
            userDefaults.synchronize()
        }
        
    }
    
    // user id
    var userId: Int? {
        get {
            return userDefaults.object(forKey: TJUserConstants.userIdKey) as? Int ?? nil
        }
        
        set (newValue) {
            userDefaults.set(newValue, forKey: TJUserConstants.userIdKey)
            userDefaults.synchronize()
        }
    }
   
    // MARK: - util variables
    
    // Gender as enum
    var gender : Gender {
        get {
            return Gender(rawValue: self.genderStr!)!
        }
    }
    
    // Full Name
    var fullName : String {
        get {
            return self.firstname! + " "  + self.lastname!
        }
    }
    
    // Age calculated from date of birth
    var Age: Int {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            if let date = dateFormatter.date(from: self.dateOfBirth ?? "") {
                if let num : Int = Date().yearsFrom(date) as? Int {
                    return num
                }
            }
            return 0
        }
    }
}

extension UserManager
{
    
    func setData(dic : [String : AnyObject]) {
        self.firstname = dic["fName"] as? String
        self.lastname = dic["lName"] as? String
        self.emailAddress  = dic["email"] as? String
        self.genderStr = dic["dob"] as? String
        self.userId  = dic["id"] as? Int
    }
    
    func clearUUID() {
        self.firstname    = nil
        self.lastname     = nil
        self.emailAddress = nil
        self.userId       = nil
        self.genderStr    = nil
        self.dateOfBirth  = nil
        
        
        userDefaults.removeObject(forKey: TJUserConstants.FirstnameKey)
        userDefaults.removeObject(forKey: TJUserConstants.LastnameKey)
        userDefaults.removeObject(forKey: TJUserConstants.EmailKey)
        userDefaults.removeObject(forKey: TJUserConstants.userIdKey)
        userDefaults.removeObject(forKey: TJUserConstants.DOBKey)
        userDefaults.removeObject(forKey: TJUserConstants.GenderKey)
        userDefaults.synchronize()
        
        // clear api session token
        apiMgr.clearSession()
    }
}
