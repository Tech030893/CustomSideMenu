import UIKit

protocol HomeViewControllerDelegate: AnyObject
{
    func didTapMenuButton()
}

class HomeViewController: UIViewController
{
    weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = "Home"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet.indent"), style: .done, target: self, action: #selector(didTapMenuButton))
    }
    
    @objc func didTapMenuButton()
    {
        delegate?.didTapMenuButton()
    }
}
