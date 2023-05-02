//
//  SecondSectionHeader.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/05/03.
//

import Foundation
import UIKit

class SecondSectionHeader: UIView{
    
    let divideView =  UIView().then{
        $0.backgroundColor = .lightGray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(divideView)
        //        divideView.snp.makeConstraints{
        //            $0.leading.equalToSuperview().inset(8)
        //            $0.top.equalToSuperview().inset(375)
        ////            $0.height.equalTo(1)
        //            $0.width.equalTo(359)
    }
    
    required init(coder: NSCoder) {
        fatalError("iii")
    }
}
