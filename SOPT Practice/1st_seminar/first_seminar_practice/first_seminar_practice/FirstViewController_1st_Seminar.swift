//
//  FristViewController.swift
//  first_seminar_practice
//
//  Created by 곽성준 on 2023/04/04.
//

import UIKit

class FirstViewController_1st_Seminar: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요?"
        label.font = .systemFont(ofSize:16)
        label.textColor = .blue
        label.textAlignment = .center
        label.shadowColor = .green
        return label
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .green
        button.layer.borderWidth = 5
        
        button.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.borderWidth = 5

        
        button.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요" //텍스트 필드에 아무것도 없을 때 기본적으로 보여지는 텍스트, 텍스트 필드에 입력하면 사라짐
        textField.clearButtonMode = .always //텍스트 지우는 버튼, .whildediting 을 하면 입력할 때만 보임
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.text = "ex) 곽성준"  //텍스트 필드에 적혀 있는 것
        //이렇게 되면 텍스트 필드에 ex)곽성준 적혀있고 클릭하면 곽성준을 지우고 써야됨
        
        return textField
    }()
    
    private let navigationBar : UINavigationBar = {
        let navBar = UINavigationBar()
        
        return navBar
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(navigationBar) //없어도 잘 실행되는데 왜 있어야되는지 모르겠음
        let navItem = UINavigationItem(title: "iOS 짱짱맨") // title, 오른쪽왼쪽 버튼은 UINavigationItem에 있으므로 생성해줌
        navigationBar.setItems([navItem], animated: true) //생성한 것을 navigation bar에 넣어줌
        
        style()
        setLayout()

    }
}

private extension FirstViewController_1st_Seminar {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, nameTextField,
         presentButton, pushButton,navigationBar].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([navigationBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
                                     navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
    }
    
    func presentToSecondViewController(){
        guard let name = nameTextField.text else {return}
        let secondViewController = SecondViewController_1st_Seminar()
        secondViewController.dataBind(name: name)
        secondViewController.modalPresentationStyle = .fullScreen
        self.present(secondViewController, animated: true)
    }
    
    func pushToSecondViewController(){
        guard let name = nameTextField.text else {return}
        let secondViewController = SecondViewController_1st_Seminar()
        secondViewController.dataBind(name: name)
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @objc
    func presentButtonTapped(){
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped(){
        pushToSecondViewController()
    }
    
    
}
