//
//  Welcome_ViewController.swift
//  Second_Seminar_Task
//
//  Created by 곽성준 on 2023/04/14.
//

import SnapKit
import Then

import UIKit

class Welcome_ViewController: UIViewController {
    
    private let tvingImage = UIImageView().then{
        
        $0.image = UIImage(named: "image 1.png")
    }
    
    private let idLabel = UILabel().then{
        
        $0.text = ""
        $0.textColor = UIColor(red: 0.839, green: 0.839, blue: 0.839, alpha: 1)
        $0.font = UIFont(name: "Pretendard-Bold", size: 23)
        $0.frame = CGRect(x: 0, y: 0, width: 226, height: 74)
    }
    
    private lazy var goToMainButton = UIButton().then{
        $0.backgroundColor = .red
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self, action: #selector(goToMainButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func idData(id: String){
        
        idLabel.numberOfLines = 2
        idLabel.text = "\(id)님 \n반가워요"
        idLabel.textAlignment = .center
    }
}

private extension Welcome_ViewController{
    
    func style(){
        view.backgroundColor = .black
    }
    
    func setLayout(){
        view.addSubviews(tvingImage, idLabel, goToMainButton)
        
        tvingImage.snp.makeConstraints{
            $0.top.equalToSuperview().inset(58)
            $0.width.equalToSuperview().offset(0)
        }
        
        idLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(337)
        }
        
        goToMainButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-66)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
    }
    
    @objc
    func goToMainButtonTapped(){
        self.navigationController?.popViewController(animated: true)
    }
}
















