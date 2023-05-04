//
//  TopHeader.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/05/03.
//

import UIKit.UIImage

import SnapKit
import Then

class TopHeader: UIView{
    
    
    private let profileName = UILabel().then{
        
        $0.font = .systemFont(ofSize: 17)
        $0.text = "Doosan"
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    lazy var profileChangeButton = UIButton().then{
        
        $0.setTitle("프로필 전환", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 10)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray4.cgColor
        $0.layer.cornerRadius = 2
    }
    
    private let profileImage = UIImageView().then{
        
        $0.image = UIImage(named: "doosan_image")
        
    }
    
    private let myCashGrayStackView = UIStackView().then{   //스택뷰로
        $0.backgroundColor = .gray5
    }
    
    private let myTicketLabel: UILabel = {
        let label = UILabel()
        let ticketImage = UIImage(named: "ticket_image")
        let leadingImage = NSTextAttachment(image: ticketImage!)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: leadingImage))
        attributedString.append(NSAttributedString(string: " 나의 이용권"))
        label.attributedText = attributedString
        label.textColor = .gray3
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let ticketInfoLabel = UILabel().then{
        $0.text = "사용중인 이용권이 없습니다."
        $0.textColor = .gray3
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 13)
    }
    
    private let backgroundView = UIView().then{
        $0.backgroundColor = .gray5
    }
    
    private let noticeGrayLabel: UILabel = {
        
        let label = UILabel()
        let tvnjtbcImage = UIImage(named: "tvnjtbc_image")
        let image1 = NSTextAttachment(image: tvnjtbcImage!)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(string: "이용권을 구매하고 "))
        attributedString.append(NSAttributedString(attachment: image1))
        attributedString.append(NSAttributedString(string: " 등 인기 프로그램과 \n다양한 영화 콘텐츠를 자유롭게 시청하세요! "))
        label.attributedText = attributedString
        
        //줄간격을 조절하면 이미지가 사라짐
//        let attrString = NSMutableAttributedString(string: label.text!)
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 7
//        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
//        label.attributedText = attrString
        label.textColor = .gray2
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var NextButton = UIButton().then{
        $0.setImage(UIImage(named: "gonext_image"), for: .normal)
    }
    
    private let tivingCashLabel: UILabel = {
        let label = UILabel()
        let cashImage = UIImage(named: "cash_image")
        let leadingImage = NSTextAttachment(image: cashImage!)
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(attachment: leadingImage))
        attributedString.append(NSAttributedString(string: " 티빙캐시"))
        label.attributedText = attributedString
        label.textColor = .gray3
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private let myCashLabel = UILabel().then{
        
        $0.text = " 0 "
        $0.textColor = .white
        $0.textAlignment = .center
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(profileImage, myCashGrayStackView, backgroundView, profileName, profileChangeButton)
        
        backgroundView.addSubviews(noticeGrayLabel,NextButton)
        
        myCashGrayStackView.addArrangedSubview(myTicketLabel)
        myCashGrayStackView.addArrangedSubview(ticketInfoLabel)
        myCashGrayStackView.addArrangedSubview(tivingCashLabel)
        myCashGrayStackView.addArrangedSubview(myCashLabel)
        
        myTicketLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(-29)
            $0.leading.equalToSuperview().inset(11)
        }
        
        ticketInfoLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(-27)
            $0.trailing.equalToSuperview().inset(13)
        }
        
        tivingCashLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(43)
            $0.leading.equalToSuperview().inset(11)
        }
        
        myCashLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(43)
            $0.leading.equalToSuperview().inset(300)
        }
        
        profileImage.snp.makeConstraints{
            
            $0.leading.equalToSuperview().inset(24)
            
            $0.top.equalToSuperview().inset(35)
            
        }
        
        myCashGrayStackView.snp.makeConstraints{
            
            $0.width.equalTo(355)
            $0.height.equalTo(92)
            $0.top.equalTo(profileImage.snp.bottom).offset(29)
            $0.centerX.equalToSuperview()
        }
        
        backgroundView.snp.makeConstraints{
            $0.width.equalTo(355)
            $0.height.equalTo(60)
            $0.top.equalTo(myCashGrayStackView.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
        
        noticeGrayLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
           
        }
        
        NextButton.snp.makeConstraints{
            
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(328)
            
        }
        
        profileName.snp.makeConstraints{
            
            $0.leading.equalTo(profileImage.snp.trailing).offset(22)
            $0.bottom.equalTo(myCashGrayStackView.snp.top).offset(-59)
            
        }
        
        profileChangeButton.snp.makeConstraints{
            
            $0.leading.equalTo(profileName.snp.trailing).offset(100)
            $0.bottom.equalTo(myCashGrayStackView.snp.top).offset(-54)
            $0.width.equalTo(70)
            $0.height.equalTo(15)
            
        }
        
        backgroundColor = .black
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
