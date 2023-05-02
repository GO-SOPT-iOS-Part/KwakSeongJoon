//
//  MyPageViewController.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/05/02.
//

import UIKit

import SnapKit
import Then

private let identifier = "Cell"

class MyPageViewController: UIViewController {
    
    // MARK - Properties
    
    private let tableView = UITableView()
    
    private let backButton = UIButton().then{
        $0.setImage(UIImage(named: "backbutton_image"), for: .normal)
        
    }
    
    private let alertButton = UIButton().then{
        $0.setImage(UIImage(named: "alert_image"), for: .normal)
        
    }
    
    private let settingButton = UIButton().then{
        $0.setImage(UIImage(named: "setting_image"), for: .normal)
        
    }
    
    private let FirstSectionData: [String] = ["이용권", "1:1 문의내역", "예약알림", "회원정보 수정", "프로모션 정보 수신 동의"]
    
    private let SecondSectionData: [String] = ["공지사항", "이벤트", "고객센터", "티빙 알아보기"]
    
    
    // MARK - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barStyle = .black
        
        setStyle()
        setLayout()
        
    }
    
    // MARK - Helper

    private func setStyle(){
        
        tableView.backgroundColor = .black
        
    }
    
    private func setLayout(){
        
        view.addSubviews(tableView, backButton, alertButton, settingButton)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MyPageTableViewCell.self, forCellReuseIdentifier: identifier)
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.trailing.leading.equalToSuperview()
        }
        
        backButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(73)
            $0.leading.equalToSuperview().inset(24)
        }
       
        alertButton.snp.makeConstraints{
            $0.leading.equalTo(backButton.snp.trailing).offset(246)
            $0.top.equalToSuperview().inset(56)
        }
        
        settingButton.snp.makeConstraints{
            $0.leading.equalTo(alertButton.snp.trailing).offset(9)
            $0.top.equalToSuperview().inset(65)

        }
        
        headerViewLayout()
        
        
    }
    
    
    private func headerViewLayout(){
        
        tableView.tableHeaderView = TopHeader(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 279))
        
        
//        tableHeaderView.layoutIfNeeded()
    }

}

    //MARK - extensions

extension MyPageViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return nil
        }
        else if section == 1{
            let header = SecondSectionHeader()
            return header
        }
        return nil
    }

}

extension MyPageViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return FirstSectionData.count
        }
        else if section == 1{
            return SecondSectionData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MyPageTableViewCell
        
        if indexPath.section == 0{
            cell.textLabel?.text = FirstSectionData[indexPath.row]
        }
        else if indexPath.section == 1{
            cell.textLabel?.text = SecondSectionData[indexPath.row]
        }
        
        return cell
    }
    
}
