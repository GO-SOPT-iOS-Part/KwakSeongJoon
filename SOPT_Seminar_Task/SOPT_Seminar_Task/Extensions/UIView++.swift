//
//  UIView++.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/04/20.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    
}
