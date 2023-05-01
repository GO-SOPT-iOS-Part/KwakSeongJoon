//
//  MainViewController.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/05/02.
//

import UIKit

import SnapKit
import Then


final class MainViewController: UIViewController {
    
    private lazy var nextBUtton = UIButton().then{
        $0.setTitle("마이페이지", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.backgroundColor = .black
        $0.addTarget(self, action: #selector(pushToMyPageViewController), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
    
    func setStyle(){
        view.backgroundColor = .white

    }
    
    func setLayout(){
        view.addSubview(nextBUtton)
        
        nextBUtton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    @objc
    func pushToMyPageViewController() {
        let secondViewController = MyPageViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    
}
