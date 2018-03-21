//
//	Spec.swift
//
//	Create by Tejas Ardeshna on 16/3/2018
//	Copyright © 2018. All rights reserved.
//

import Foundation
import ObjectMapper
enum BreakType : String {
    case drum     = "Drum"
    case disc     = "Disc"
    case other
}

enum FuelType : String {
    case petrol   = "Petrol"
    case diesel   = "Diesel"
    case electric = "Electric"
    case other

    func getFualDetail() -> String {
        switch self {
        case .petrol, .diesel, .electric:
            return self.rawValue
        default:
            return "N/A"
        }
    }

}

class Spec : BaseModel {

	var alternateFuel : FuelType?
	var displacement : String?
	var frontBrakeType : BreakType?
    var rearBrakeType : BreakType?
	var height : String?
	var length : String?
	var maxPower : String?
	var maxTorque : String?
    var seatingCapacity : Int?
	var wheels : String?
	var width : String?

    override func mapping(map: Map) {
		alternateFuel <- (map["Alternate Fuel"], EnumTransform<FuelType>())
		displacement <- map["Displacement"]
		frontBrakeType <- (map["Front Brake Type"], EnumTransform<BreakType>())
		height <- map["Height"]
		length <- map["Length"]
		maxPower <- map["Max Power"]
		maxTorque <- map["Max Torque"]
		rearBrakeType <- (map["Rear Brake Type"],EnumTransform<BreakType>())
		seatingCapacity <- map["Seating Capacity"]
		wheels <- map["Wheels"]
		width <- map["Width"]
	}

    func getSeatingCapacity() -> String {
        return "\(self.seatingCapacity!) persons"
    }

    func toDictionary() -> [String: AnyObject] {
        var dictionary = [String: AnyObject]()
        if alternateFuel != nil {
            dictionary["AlternateFuel"] = alternateFuel?.rawValue as AnyObject
        }
        if displacement != nil {
            dictionary["Displacement"] = displacement as AnyObject
        }
        if frontBrakeType != nil {
            dictionary["FrontBrakeType"] = frontBrakeType?.rawValue as AnyObject
        }
        if height != nil {
            dictionary["Height"] = height as AnyObject
        }
        if length != nil {
            dictionary["Length"] = length as AnyObject
        }
        if maxPower != nil {
            dictionary["MaxPower"] = maxPower as AnyObject
        }
        if maxTorque != nil {
            dictionary["MaxTorque"] = maxTorque as AnyObject
        }
        if rearBrakeType != nil {
            dictionary["RearBrakeType"] = rearBrakeType?.rawValue as AnyObject
        }
        if seatingCapacity != nil {
            dictionary["SeatingCapacity"] = seatingCapacity as AnyObject
        }
        if wheels != nil {
            dictionary["Wheels"] = wheels as AnyObject
        }
        if width != nil {
            dictionary["Width"] = width as AnyObject
        }
        return dictionary
    }
    
}
