//
//  tapBarItem_struct.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/05/09.
//

import Foundation

struct tapBarItems{
    
     var items: String
    
}

extension tapBarItems{
    
    static func dummy() -> [tapBarItems]{
        return [tapBarItems(items: "홈"),
                tapBarItems(items: "실시간"),
                tapBarItems(items: "TV프로그램"),
                tapBarItems(items: "영화"),
                tapBarItems(items: "파라마운트+"),
                tapBarItems(items: "키즈")]
    }
}
