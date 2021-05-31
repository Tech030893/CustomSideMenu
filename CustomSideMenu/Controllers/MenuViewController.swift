import UIKit

protocol MenuViewControllerDelegate: AnyObject
{
    func didSelect(menuItem: MenuViewController.MenuOptions)
}

class MenuViewController: UIViewController
{
    weak var delegate: MenuViewControllerDelegate?
    
    enum MenuOptions: String, CaseIterable
    {
        case home = "Home"
        case notification = "Notification"
        case settings = "Settings"
        case profile = "Profile"
        case aboutus = "About Us"
        case contactus = "Contact Us"
        case help = "Help"
        case share = "Share"
        
        var imageName: String
        {
            switch self
            {
            case .home:
                return "house"
            case .notification:
                return "bell"
            case .settings:
                return "gear"
            case .profile:
                return "person.crop.square"
            case .aboutus:
                return "info.circle"
            case .contactus:
                return "phone"
            case .help:
                return "exclamationmark.octagon"
            case .share:
                return "arrowshape.turn.up.left"
            }
        }
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = nil
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    let grayColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = grayColor
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height: view.bounds.size.height)
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.imageView?.image = UIImage(systemName: MenuOptions.allCases[indexPath.row].imageName)
        cell.imageView?.tintColor = .white
        cell.backgroundColor = grayColor
        cell.contentView.backgroundColor = grayColor
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOptions.allCases[indexPath.row]
        delegate?.didSelect(menuItem: item)
    }
}
