import UIKit

extension UIColor {
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
            let red = CGFloat((hex >> 16) & 0xFF) / 255.0
            let green = CGFloat((hex >> 8) & 0xFF) / 255.0
            let blue = CGFloat(hex & 0xFF) / 255.0
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
        
    static var baraBackground: UIColor {
            return UIColor(hex: 0x0A0A0A)
        }
       
        static var baraCard: UIColor {
            return UIColor(hex: 0x1A1A1A)
        }
    
        static var baraTextPrimary: UIColor {
            return UIColor(hex: 0xFFFFFF)
        }
  
        static var baraTextSecondary: UIColor {
            return UIColor(hex: 0x9B9B9B)
        }

        static var baraGreen: UIColor {
            return UIColor(hex: 0x4A6FA5)
        }
        
        static var baraOrange: UIColor {
            return UIColor(hex: 0xC96B2C)
        }
    
        static var baraRed: UIColor {
            return UIColor(hex: 0x9E3C2A)
        }
        
        static var baraSeparator: UIColor {
            return UIColor(hex: 0x333333)
        }
    }
