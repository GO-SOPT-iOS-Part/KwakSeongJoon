import UIKit


class MainPageCollectionViewCell: UICollectionViewCell {

    static let identifier = "MainPAgeCollectionViewCell"
    
    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setStyle()

        setLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setStyle() {
        
        titleLabel.do{
            $0.textAlignment = .center
            $0.textColor = .white
        }
        
    }

    private func setLayout() {
        
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    func configureCell(_ item: tapBarItems){
        
        titleLabel.text = item.items
        
    }

   

}
