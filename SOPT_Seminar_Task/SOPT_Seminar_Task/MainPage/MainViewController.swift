//
//  MainViewController.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/05/02.
//

import UIKit

import SnapKit
import Then


final class MainViewController: BaseViewController {
        
    lazy var vc1: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        
        return vc
    }()
    
    lazy var vc2: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        
        return vc
    }()
    
    lazy var vc3: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        
        return vc
    }()
    lazy var vc4: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .black
        
        return vc
    }()
    lazy var vc5: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .darkGray
        
        return vc
    }()
    lazy var vc6: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .purple
        
        return vc
    }()
    
    lazy var dataViewControllers: [UIViewController] = {
        return [vc1, vc2, vc3,vc4,vc5,vc6]
    }()
    
    lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        return vc
    }()
    
    
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: flowLayout)
    private let mainView = UIView()
    
    
    
    
    private let flowLayout = UICollectionViewFlowLayout()
    
    private var dummyCase = tapBarItems.dummy()
    
    private lazy var tvingTitle = UIButton().then{
        $0.setImage(.tvingImage, for: .normal)
    }
    
    private lazy var goToMyPageButton = UIButton().then{
        $0.setImage(.goToMyPageImage, for: .normal)
        $0.addTarget(self, action: #selector(pushToMyPageViewController), for: .touchUpInside)
    }
    
    
    override func setStyle(){
        
        view.backgroundColor = .green
        
        collectionView.do{
            
            $0.backgroundColor = .black
            $0.delegate = self
            $0.dataSource = self
            $0.showsVerticalScrollIndicator = false
            $0.register(MainPageCollectionViewCell.self, forCellWithReuseIdentifier: MainPageCollectionViewCell.identifier)
            //            $0.layer.opacity = 0.1
            //            $0.alpha = 0.2
            
            
        }
        
        flowLayout.do{
            $0.scrollDirection = .horizontal
            $0.itemSize = CGSize(width: 90, height: UIScreen.main.bounds.height)
            $0.minimumInteritemSpacing = 3
            $0.minimumLineSpacing = 5
        }
        
        pageViewController.do{
            $0.view.frame = mainView.frame
        }
        
        if let firstVC = dataViewControllers.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        
    }
    
    override func setLayout(){
        
        view.addSubviews(tvingTitle, goToMyPageButton,collectionView,mainView)
        
        mainView.addSubview(pageViewController.view)
        
        addChild(pageViewController)
        
        
        
        tvingTitle.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(11)
            $0.top.equalToSuperview().inset(59)
        }
        
        goToMyPageButton.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(333)
            $0.top.equalToSuperview().inset(55)
        }
        
        collectionView.snp.makeConstraints{
            
            $0.top.equalTo(tvingTitle.snp.bottom).offset(30)
            $0.height.equalTo(30)
            $0.width.equalTo(400)
        }
        
        mainView.snp.makeConstraints{
            $0.top.equalTo(collectionView.snp.bottom)
            $0.height.equalTo(375)
            $0.width.equalTo(498)
        }
        
        pageViewController.didMove(toParent: self)
        
    }
    
    @objc
    func pushToMyPageViewController() {
        let secondViewController = MyPageViewController()
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dummyCase.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainPageCollectionViewCell.identifier, for: indexPath) as? MainPageCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configureCell(dummyCase[indexPath.item])
        cell.backgroundColor = .black
        
        return cell
    }
}

extension MainViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return dataViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == dataViewControllers.count {
            return nil
        }
        return dataViewControllers[nextIndex]
    }
}
