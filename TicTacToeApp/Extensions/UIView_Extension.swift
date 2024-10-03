import UIKit

extension UIView {
    //Base ContainerView with shadow
    static func makeContainerView(backgroundColor: UIColor = .white) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        
        view.layer.shadowColor = UIColor(red: 0.604, green: 0.624, blue: 0.765, alpha: 0.35).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        view.layer.shadowRadius = 30
        view.layer.masksToBounds = false

        return view
    }
}
