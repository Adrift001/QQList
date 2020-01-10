//
//  FriendsModel.swift
//  QQList
//
//  Created by Adrift on 16/8/8.
//  Copyright © 2016年 adrift. All rights reserved.
//

import Foundation
import HandyJSON

class GroupModel: HandyJSON {
    var name: String = ""
    var online = 0
    var friends: [FriendModel] = []
    var isOpen: Bool = false     //好友列表是否展开
    required init() {  }
}
