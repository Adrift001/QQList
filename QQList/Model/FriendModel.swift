//
//  Person.swift
//  QQList
//
//  Created by Adrift on 16/8/8.
//  Copyright © 2016年 adrift. All rights reserved.
//

import Foundation
import HandyJSON

class FriendModel: HandyJSON {
    var icon: String = ""
    var intro: String = "" //个性签名
    var name: String = ""
    var vip: Int = 0
    required init() {  }
}
