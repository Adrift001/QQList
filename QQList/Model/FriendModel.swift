//
//  Person.swift
//  QQList
//
//  Created by Adrift on 16/8/8.
//  Copyright © 2016年 adrift. All rights reserved.
//

import UIKit

class FriendModel: NSObject {
    var icon: String?
    var intro: String? //个性签名
    var name: String?
    var vip: NSNumber?
    
    init(dict: Dictionary <String, AnyObject>) {
        super.init()
        self.setValuesForKeysWithDictionary(dict)
    }
}
