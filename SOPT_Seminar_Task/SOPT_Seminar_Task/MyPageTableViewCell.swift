//
//  MyPageTableViewCell.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/05/02.
//

import UIKit

class MyPageTableViewCell: UITableViewCell {
    
    lazy var nextButton = UIButton().then{
        $0.setImage(UIImage(named: "gonext_image"), for: .normal)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        contentView.addSubview(nextButton)
        
        
        nextButton.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(50)
            $0.width.equalTo(50)
        }

    }

}
