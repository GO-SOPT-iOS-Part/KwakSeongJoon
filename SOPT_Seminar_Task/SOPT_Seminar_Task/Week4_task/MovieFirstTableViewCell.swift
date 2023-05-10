//
//  MovieFirstTableViewCell.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/05/10.
//

import UIKit

class MovieFirstTableViewCell: UITableViewCell {

    static let identifier = "TableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle(){
        
    }
    
    func setLayout(){
        
    }
    
    

}
