//
//  tableviewFooter.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/05/04.
//
import UIKit

import SnapKit
import Then

class tableviewFooter: UIView{
    
    lazy var logoutButton = UIButton().then{
        
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(.gray2, for: .normal)
        $0.backgroundColor = .black
        $0.layer.borderColor = UIColor.gray4.cgColor
        $0.layer.borderWidth = 1
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        //        $0.contentHorizontalAlignment = .center
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
        
    }
    
    private func setStyle(){
        
        backgroundColor = .black
        
    }
    
    private func setLayout(){
        
        addSubview(logoutButton)
        logoutButton.snp.makeConstraints{
            $0.width.equalTo(350)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
