//
//	Car.swift
//
//	Create by Tejas Ardeshna on 16/3/2018
//	Copyright © 2018. All rights reserved.
//

import Foundation 
import ObjectMapper
class Car : BaseModel {

    // MARK: - Variables
	var companyOrigin : String?
	var details : String?
	var id : Int?
	var name : String?
	var price : String?
	var specs : Spec?
	var img : [String]?
    var category : CarCategory? {
        get {
            if specs != nil {
                return CarCategory.init(numberOfPerson: specs!.seatingCapacity!)
            }
            return nil
        }
    }
    
    enum CarCategory {
        case suv //7-8 person // Multi Purpose Vehicle
        case hatchback
        case sedan
        case couple
        init(numberOfPerson n: Int) {
            if n <= 2 {
                self = .couple
            }
            else if n < 5 {
                self = .hatchback
            }
            else if n < 6 {
                self = .sedan
            }
            else {
                self = .suv
            }
        }
        
        func getDescription() -> String {
            switch self {
            case .suv:
                return "Sports utility vehicle is generally used for off road purpose."
            case .hatchback:
                return "Generally used in cities with extreme traffic, It's quite comfortable in traffic due to it's small size."
            case .sedan:
            return "Generally used long trip becuase of extra space for luggage and quite comfortable for 5 peoples."
            case .couple:
                return "Couple car have only two seats, often called as two seater car."
            }
        }
        
    }
    
    override func mapping(map: Map) {
		companyOrigin <- map["Company_Origin"]
		details <- map["Details"]
		id <- map["Id"]
		name <- map["Name"]
		price <- map["Price"]
		specs <- map["Specs"]
		img <- map["img"]
		
	}

}
extension Car
{
    
    static func == (lhs : Car , rhs : Car) -> Bool {
        if lhs.id == rhs.id &&
            lhs.name == rhs.name
        {
            return true
        }
        else
        {
            return false
        }
    }
}
