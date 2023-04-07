//
//  SecondViewController_1st_Seminar.swift
//  first_seminar_practice
//
//  Created by 곽성준 on 2023/04/04.
//

import UIKit

class SecondViewController_1st_Seminar: UIViewController {
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "제 이름은요!"
        label.font = .boldSystemFont(ofSize: 20)
        label.shadowColor = .green
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.borderWidth = 5

        
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    func dataBind(name: String){
        nameLabel.text = name
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
        
    }
}

private extension SecondViewController_1st_Seminar {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    @objc
    func backButtonTapped(){
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        } else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
}
