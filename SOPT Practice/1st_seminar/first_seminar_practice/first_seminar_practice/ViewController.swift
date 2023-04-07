import UIKit

final class ViewController: UIViewController{
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.shadowColor = .green
        label.textColor = .black
        label.font = .systemFont(ofSize: 25)
        label.text = "솝트에 오신 여러분 \n환영합니다!"
        label.textAlignment = .center
        
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        
    }
}

private extension ViewController {
    func setStyle(){
        view.backgroundColor = .white
        
    }
    func setLayout(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)])
    }
}
