//
//  MovieFirstViewController.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/05/10.
//

import UIKit



final class MovieFirstViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    private let tableView = UITableView()
    
    private var MovieResultData: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
    }
    
    override func setStyle() {
        
        getMovieInfo()
        tableView.do{
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
    
    func register() {
        tableView.register(MovieFirstTableViewCell.self, forCellReuseIdentifier: MovieFirstTableViewCell.cellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return MovieResultData.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieFirstTableViewCell.cellIdentifier, for: indexPath) as? MovieFirstTableViewCell else {
            print("문제가있나요?")
            return UITableViewCell() }
        
        cell.configureCell(MovieResultData[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 300
        }
    
    func getMovieInfo(){
        MovieInfoService.shared.Movie(){ response in
            switch response {
            case .success(let data):
                guard let data = data as? MovieInfo else {return}
                self.MovieResultData = data.results
                self.tableView.reloadData()
                
            default:
                return
            }
        }
        
    }
    
    
}
