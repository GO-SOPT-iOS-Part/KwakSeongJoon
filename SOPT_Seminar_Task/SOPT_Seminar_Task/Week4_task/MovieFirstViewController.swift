//
//  MovieFirstViewController.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/05/10.
//

import UIKit

class MovieFirstViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    private let tableView = UITableView()
    
    override func setStyle() {
        
        tableView.do{
            $0.register(MovieFirstTableViewCell.self, forCellReuseIdentifier: MovieFirstTableViewCell.identifier)
            $0.dataSource = self
            $0.delegate = self
        }
    }
    
    override func setLayout() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
