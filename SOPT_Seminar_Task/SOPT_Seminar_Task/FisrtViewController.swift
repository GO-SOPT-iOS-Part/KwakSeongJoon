//
//  FisrtViewController.swift
//  Second_Seminar_Task
//
//  Created by 곽성준 on 2023/04/12.
//

import UIKit

import Then
import SnapKit

class FisrtViewController: UIViewController, UITextFieldDelegate {
    
    
    private let titleLabel = UILabel().then{
        $0.text = "TVING ID 로그인"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize:23)
    }
    
    private let idField = UITextField().then{
        
        if let clearButton = $0.value(forKeyPath: "_clearButton") as? UIButton { //clear 버튼 이미지 변경
            clearButton.setImage(UIImage(named: "clearbutton"), for: .normal)
        }
        $0.clearButtonMode = .whileEditing
        $0.layer.borderWidth = 1
        $0.textAlignment = .left
        $0.backgroundColor = .darkGray
        $0.placeholder = "아이디"
        $0.autocapitalizationType = .none
        $0.setPlaceholderColor(.gray)
        $0.addLeftPadding()
        
    }
        
    private let pwField = ModifiedTextField().then{  
        
        if let clearButton = $0.value(forKeyPath: "_clearButton") as? UIButton { //clear 버튼 이미지 변경
            clearButton.setImage(UIImage(named: "clearbutton"), for: .normal)
        }
        $0.clearButtonMode = .whileEditing
        $0.layer.borderWidth = 1
        $0.textAlignment = .left
        $0.backgroundColor = .darkGray
        $0.textColor = UIColor(red: 0.612, green: 0.612, blue: 0.612, alpha: 1)
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        $0.placeholder = "비밀번호"
        $0.isSecureTextEntry = true
        $0.autocapitalizationType = .none   //시작 소문자로
        $0.setPlaceholderColor(.gray)
        $0.addLeftPadding()
        
    }
    lazy var eyeButton = UIButton().then
    {
        $0.setImage(UIImage(named: "hiePwEye"), for: .normal)
        $0.addTarget(self, action: #selector(eyeButtonTapped), for:.touchUpInside)
        
    }
    
    private lazy var loginButton = UIButton().then{
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.backgroundColor = .black
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 1
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.contentHorizontalAlignment = .center
        $0.isEnabled = false
        
        $0.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        
    }
    
    private lazy var findIdButton = UIButton().then{
        $0.setTitle("아이디찾기", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.backgroundColor = .black
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.contentHorizontalAlignment = .center
    }
    
    private lazy var findPwButton = UIButton().then{
        $0.setTitle("비밀번호찾기", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.backgroundColor = .black
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.contentHorizontalAlignment = .center
    }
    
    private let dividingLine = UIView().then
    {
        $0.backgroundColor = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1)
    }
    
    private let askNoId = UILabel().then
    {
        $0.text = "아직 계정이 없으신가요?"
        $0.textColor = UIColor(red: 0.384, green: 0.384, blue: 0.384, alpha: 1)
        $0.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        $0.textAlignment = .center
    }
    
    private lazy var makeIdButton = UIButton().then
    {
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.setTitleColor(.lightGray, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        $0.setUnderline()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        style()
        setLayout()
        
    }
    
    func setDelegate(){
        
        idField.delegate = self
        pwField.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // textField 눌렀을 때, border 색상 변경
        textField.layer.borderColor = UIColor.white.cgColor
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 다시 안눌렀을 때, 기본 border 색상으로 변경
        textField.layer.borderColor = UIColor.gray.cgColor
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        // 두 개의 UITextField 중 하나라도 텍스트가 없으면 UIButton을 비활성화
        if idField.text?.isEmpty ?? true || pwField.text?.isEmpty ?? true {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .black
        } else { // 두 개의 UITextField 모두 텍스트가 있는 경우 UIButton을 활성화
            loginButton.isEnabled = true
            loginButton.backgroundColor = .red
            loginButton.setTitleColor(.white, for: .normal)
        }
    }
    
    
    @objc
    func eyeButtonTapped() {
        pwField.isSecureTextEntry.toggle()
        if pwField.isSecureTextEntry {
            eyeButton.setImage(UIImage(named: "hiePwEye"), for: .normal)
        }
        else {
            eyeButton.setImage(UIImage(named: "showPwEye"), for: .normal)
        }
    }
    
}



private extension FisrtViewController{
    
    func style(){
        view.backgroundColor = .black
    }
    
    func setLayout(){
        
        
        view.addSubviews(titleLabel, idField,pwField, loginButton ,eyeButton, findIdButton
        ,dividingLine, findPwButton, askNoId, makeIdButton)
        
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(90)
        }
        
        idField.snp.makeConstraints{
            $0.top.equalToSuperview().inset(158)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
        }
        
        pwField.snp.makeConstraints{
            $0.top.equalToSuperview().inset(217)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(290)
            $0.width.equalTo(335)
            $0.height.equalTo(52)
            $0.centerX.equalToSuperview()
        }
        
        eyeButton.snp.makeConstraints{
            $0.trailing.equalTo(pwField.snp.trailing).offset(-20)
            $0.top.equalTo(pwField.snp.top).offset(15)
        }
        
        findIdButton.snp.makeConstraints
        {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalToSuperview().offset(85)
            
        }
        
        findPwButton.snp.makeConstraints
        {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.leading.equalTo(findIdButton.snp.trailing).offset(69)
            
        }
        
        dividingLine.snp.makeConstraints
        {
            $0.leading.equalTo(findIdButton.snp.trailing).offset(34)
            $0.top.equalTo(loginButton.snp.bottom).offset(35)
            $0.width.equalTo(2)
            $0.height.equalTo(18)
        }
        
        askNoId.snp.makeConstraints
        {
            $0.top.equalTo(findIdButton.snp.bottom).offset(28)
            $0.leading.equalToSuperview().offset(20)
        }
        
        makeIdButton.snp.makeConstraints
        {
            $0.top.equalTo(findPwButton.snp.bottom).offset(24)
            $0.trailing.equalToSuperview().offset(-60)
        }
        
    }
    
    func pushToWelcomViewController(){
        
        let secondViewController = Welcome_ViewController()
        guard let id = idField.text else {return}
        secondViewController.idData(id: id)
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    func pushButtonTapped(){
        pushToWelcomViewController()
    }
}
