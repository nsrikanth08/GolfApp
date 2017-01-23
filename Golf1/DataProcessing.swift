//
//  File.swift
//  Golf1
//
//  Created by SRIKANTH, NIKHIL on 1/23/17.
//  Copyright © 2017 SRIKANTH, NIKHIL. All rights reserved.
//

import Foundation

let defaults = UserDefaults.standard

func storeMasterArray (_ name: Array<Round>)
{
    defaults.setValue(name, forKey: "matchInfo")
    defaults.synchronize()
}
