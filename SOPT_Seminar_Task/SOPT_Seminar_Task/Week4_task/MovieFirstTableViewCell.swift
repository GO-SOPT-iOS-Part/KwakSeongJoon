//
//  MovieFirstTableViewCell.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/05/10.
//

import UIKit
import Kingfisher

class MovieFirstTableViewCell: UITableViewCell {
    
    private var imageURL: URL?
    
    private let posterImage = UIImageView()
    
    private let movieTitleLabel = UILabel()
    
    private let overViewLabel = UILabel()
    
    private let releaseDateLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle(){
        
        
        movieTitleLabel.do{
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = .boldSystemFont(ofSize: 18)
        }
        
        overViewLabel.do{
            $0.textColor = .black
            $0.textAlignment = .left
            $0.numberOfLines = 9
            $0.font = .systemFont(ofSize: 15)
            
        }
        
        releaseDateLabel.do{
            $0.textColor = .black
            $0.textAlignment = .right
            
        }
        
        
    }
    
    func setLayout(){
        
        contentView.addSubviews(movieTitleLabel,overViewLabel,releaseDateLabel, posterImage)
        
        movieTitleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(20)
        }
        
        overViewLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(10)
            $0.top.equalTo(movieTitleLabel.snp.bottom).offset(1)
            $0.width.equalTo(180)
            $0.height.equalTo(260)
        }
        
        releaseDateLabel.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        posterImage.snp.makeConstraints{
            $0.top.equalTo(movieTitleLabel.snp.bottom).offset(20)
            $0.trailing.equalToSuperview().inset(14)
            $0.width.equalTo(150)
            $0.height.equalTo(150)
            
        }
        
//        posterImage.snp.makeConstraints{
//                    }
        
    }
    
    func configureCell(_ results: Result){
        imageURL = URL(string: "https://image.tmdb.org/t/p/original/" + (results.posterPath ) ) ?? URL(string: "")
        movieTitleLabel.text = results.originalTitle
        overViewLabel.text = results.overview
        releaseDateLabel.text = "release date: \(results.releaseDate)"
        posterImage.kf.setImage(with: imageURL)
    }
}
