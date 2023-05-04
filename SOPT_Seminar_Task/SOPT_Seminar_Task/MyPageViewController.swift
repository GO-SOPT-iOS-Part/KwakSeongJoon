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
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    private let backButton = UIButton()
    private let alarmButton = UIButton()
    private let settingButton = UIButton()
    
    private let FirstSectionData: [String] = ["이용권", "1:1 문의내역", "예약알림", "회원정보 수정", "프로모션 정보 수신 동의"]
    
    private let SecondSectionData: [String] = ["공지사항", "이벤트", "고객센터", "티빙 알아보기"]
    
    // MARK - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barStyle = .black
        
        setStyle()
        setLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationBar()
    }
    
    func setNavigationBar() {
        
        self.navigationController?.isNavigationBarHidden = false
        
        backButton.setImage(UIImage(named: "backbutton_image"), for: .normal)
        backButton.snp.makeConstraints {
            $0.width.equalTo(8)
            $0.height.equalTo(15)
        }
        backButton.addTarget(self,
                             action: #selector(backButtonTapped),
                             for: .touchUpInside)
        let back = UIBarButtonItem(customView: backButton)
        
        alarmButton.setImage(UIImage(named: "alert_image"), for: .normal)
        alarmButton.snp.makeConstraints {
            $0.width.equalTo(30)
            $0.height.equalTo(42)
        }
        
        settingButton.setImage(UIImage(named: "setting_image"), for: .normal)
        settingButton.snp.makeConstraints {
            $0.width.equalTo(33)
            $0.height.equalTo(31)
        }
        
        let righthStackview = UIStackView.init(arrangedSubviews: [alarmButton, settingButton])
        righthStackview.distribution = .equalSpacing
        righthStackview.axis = .horizontal
        righthStackview.alignment = .center
        righthStackview.spacing = 17
        let rightStackBarButtonItem = UIBarButtonItem(customView: righthStackview)
        
        navigationItem.leftBarButtonItem = back
        navigationItem.rightBarButtonItem = rightStackBarButtonItem
    }
    
    private func setStyle(){
        
        tableView.backgroundColor = .black
        
    }
    
    private func setLayout(){
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MyPageTableViewCell.self, forCellReuseIdentifier: identifier)
        
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.trailing.leading.equalToSuperview()
        }
        
        headerViewLayout()
        
        footerViewLayout()
        
        deleteFooter()
        
        
    }
    
    @objc
    func backButtonTapped() {
        
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //tableview 스타일을 grouped으로 하면 섹션?footer가 생기는데 이 footer를 지우는 함수
    
    private func deleteFooter(){
        
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.sectionFooterHeight = 0
        
    }
    
    private func headerViewLayout(){
        
        tableView.tableHeaderView = TopHeader(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 279))
        
        //        tableHeaderView.layoutIfNeeded()
    }
    
    private func footerViewLayout() {
        tableView.tableFooterView = SOPT_Seminar_Task.tableviewFooter(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

//MARK - extensions

extension MyPageViewController: UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        54
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = SecondSEctionHeader()
        if section == 1 {
            return header
        } else
        {
            return nil
            
        }
    }
    //셀 클릭했을 때 회색 사라지게 해주는 function
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 33 : 24
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MyPageTableViewCell
        
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .gray2
        cell.textLabel?.font = .systemFont(ofSize: 15)
        
        
        if indexPath.section == 0{
            cell.textLabel?.text = FirstSectionData[indexPath.row]
        }
        else if indexPath.section == 1{
            cell.textLabel?.text = SecondSectionData[indexPath.row]
        }
        
        return cell
    }
    
}
