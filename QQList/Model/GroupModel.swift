//
//  FriendsModel.swift
//  QQList
//
//  Created by Adrift on 16/8/8.
//  Copyright © 2016年 adrift. All rights reserved.
//

import UIKit

class GroupModel: NSObject {
    var name: String?
    var online: NSNumber?
    var friends: Array<FriendModel>?
    var isOpen: Bool = false     //好友列表是否展开
    
    init(dict: Dictionary <String, AnyObject>) {
        print("\(dict)")
        super.init()
        setValuesForKeysWithDictionary(dict)
        
        var tmpFriends = Array<FriendModel>()
        for tmpDict in dict["friends"] as! [NSDictionary] {
            tmpFriends.append(FriendModel(dict: tmpDict as! Dictionary<String, AnyObject>))
        }
        friends = tmpFriends
    }
}
