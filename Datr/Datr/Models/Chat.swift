//
//  Chat.swift
//  Datr
//
//  Created by Blake kvarfordt on 3/11/20.
//  Copyright © 2020 Blake kvarfordt. All rights reserved.
//

import Foundation

struct Chat {
    var users: [String]
    var dictionary: [String: Any] {
        return ["users": users]
    }
}

extension Chat {
    
    init?(dictionary: [String:Any]) {
        guard let chatUsers = dictionary["users"] as? [String] else {return nil}
        self.init(users: chatUsers)
    }
}
