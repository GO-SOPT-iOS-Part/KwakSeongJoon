import UIKit

import SnapKit
import Then



class SecondSEctionHeader: UIView {

    let divider = UILabel().then{
        $0.backgroundColor = .lightGray
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
       
    }
    
    private func setLayout(){
        
        addSubview(divider)
        
        divider.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(359)
            $0.height.equalTo(1)
            
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
