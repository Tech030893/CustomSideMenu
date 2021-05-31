import UIKit

class ContainerViewController: UIViewController
{
    enum MenuState
    {
        case opened
        case closed
    }
    
    private var menuState: MenuState = .closed
    
    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    
    var navVC: UINavigationController?
    
    lazy var notificationVC = NotificationViewController()
    lazy var settingsVC = SettingsViewController()
    lazy var profileVC = ProfileViewController()
    lazy var aboutusVC = AboutUsViewController()
    lazy var contactusVC = ContactUsViewController()
    lazy var helpVC = HelpViewController()
    lazy var shareVC = ShareViewController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        addChildVCs()
    }
    
    private func addChildVCs()
    {
        // Menu
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        // Home
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }
}

extension ContainerViewController: HomeViewControllerDelegate
{
    func didTapMenuButton()
    {
        toggleMenu(completion: nil)
    }
    
    func toggleMenu(completion: (() -> Void)?)
    {
        // Animate the menu
        switch menuState
        {
        case .opened:
            // close it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = 0
            } completion: { [weak self] done in
                if done
                {
                    self?.menuState = .closed
                    DispatchQueue.main.async
                    {
                        completion?()
                    }
                }
            }
        case .closed:
            // open it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 100
            } completion: { [weak self] done in
                if done
                {
                    self?.menuState = .opened
                }
            }
        }
    }
}

extension ContainerViewController: MenuViewControllerDelegate
{
    func didSelect(menuItem: MenuViewController.MenuOptions)
    {
        toggleMenu(completion: nil)
        switch menuItem
        {
        case .home:
            self.resetToHome()
        case .notification:
            self.addNotification()
        case .settings:
            self.addSettings()
        case .profile:
            self.addProfile()
        case .aboutus:
            self.addAboutUs()
        case .contactus:
            self.addContactUs()
        case .help:
            self.addHelp()
        case .share:
            self.addShare()
        }
    }
    
    func resetToHome()
    {
        notificationVC.view.removeFromSuperview()
        notificationVC.didMove(toParent: nil)
        
        settingsVC.view.removeFromSuperview()
        settingsVC.didMove(toParent: nil)
        
        profileVC.view.removeFromSuperview()
        profileVC.didMove(toParent: nil)
        
        aboutusVC.view.removeFromSuperview()
        aboutusVC.didMove(toParent: nil)
        
        contactusVC.view.removeFromSuperview()
        contactusVC.didMove(toParent: nil)
        
        helpVC.view.removeFromSuperview()
        helpVC.didMove(toParent: nil)
        
        shareVC.view.removeFromSuperview()
        shareVC.didMove(toParent: nil)
        
        homeVC.title = "Home"
    }
    
    func addNotification()
    {
        let vc = notificationVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func addSettings()
    {
        let vc = settingsVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func addProfile()
    {
        let vc = profileVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func addAboutUs()
    {
        let vc = aboutusVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func addContactUs()
    {
        let vc = contactusVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func addHelp()
    {
        let vc = helpVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func addShare()
    {
        let vc = shareVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
}
