import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

extension UIColor {
    
    static var tvingRed: UIColor {
        return UIColor(r: 234, g: 51, b: 58)
    }

    static var gray5: UIColor {
            return UIColor(r: 25, g: 25, b: 25)
    }
    
    static var gray4: UIColor {
            return UIColor(r: 46, g: 46, b: 46)
    }
    
    static var gray3: UIColor{
        return UIColor(r: 98, g: 98, b: 98)
    }

    static var gray2: UIColor{
        return UIColor(r: 156, g: 156, b: 156)
    }
    
    static var gray1: UIColor {
            return UIColor(r: 214, g: 214, b: 214)
    }

        //위와 같은형식으로 원하는 색상 추가 가능
}
