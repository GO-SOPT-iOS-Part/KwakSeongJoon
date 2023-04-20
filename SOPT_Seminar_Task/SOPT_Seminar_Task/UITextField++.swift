//
//  UITextField++.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/04/20.
//

import UIKit

extension UITextField {
    
    //왼쪽에 패딩
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    //placeholder 색깔 정해주는 것
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [
                .foregroundColor: placeholderColor,
                .font: font
            ].compactMapValues { $0 }
        )
    }
}
