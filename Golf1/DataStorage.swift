//
//  DataStorage.swift
//  Golf1
//
//  Created by SRIKANTH, NIKHIL on 1/11/17.
//  Copyright © 2017 SRIKANTH, NIKHIL. All rights reserved.
//

import Foundation

let defaults = UserDefaults.standard


let invObject = 0

func storeObject(name: String, value: AnyObject)
{
    defaults.setValue(value, forKey: name)
    defaults.synchronize()
}


func retrieveObject(name: String) -> AnyObject
{
    if let temp = defaults.value(forKey: name)
    {
        return temp as AnyObject
    }
    return invObject as AnyObject
}
