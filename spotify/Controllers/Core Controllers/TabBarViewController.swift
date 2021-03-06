import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let home = HomeViewController()
        let search = SearchViewController()
        let library = LibraryViewController()
        let premium = PremiumViewController()
//        let blurEffect = UIBlurEffect(style: .systemThickMaterial) //(frame: CGRect(x: 0, y: 795 , width: view.frame.width, height: 50))
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        blurView.frame = CGRect(x: 0, y: 795 , width: view.frame.width, height: 50)
//        view.addSubview(blurView)
        
        
        home.title = "Home"
        search.title = "Search"
        library.title = "Library"
        premium.title = "Premium"
        
        home.navigationItem.largeTitleDisplayMode = .always
        search.navigationItem.largeTitleDisplayMode = .always
        library.navigationItem.largeTitleDisplayMode = .always
        premium.navigationItem.largeTitleDisplayMode = .always
        
        let home_nav = UINavigationController(rootViewController: home)
        let search_nav = UINavigationController(rootViewController: search)
        let library_nav = UINavigationController(rootViewController: library)
        let premium_nav = UINavigationController(rootViewController: premium)
        
        home_nav.navigationBar.tintColor = .label
        search_nav.navigationBar.tintColor = .label
        library_nav.navigationBar.tintColor = .label
        premium_nav.navigationBar.tintColor = .label
        
        home_nav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        search_nav.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        library_nav.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 1)
        premium_nav.tabBarItem = UITabBarItem(title: "Premium", image: UIImage(systemName: "wifi"), tag: 1)
        
        UITabBar.appearance().tintColor = .white
        
        home_nav.navigationBar.prefersLargeTitles = true
        search_nav.navigationBar.prefersLargeTitles = true
        library_nav.navigationBar.prefersLargeTitles = true
        premium_nav.navigationBar.prefersLargeTitles = true

        setViewControllers([home_nav, search_nav, library_nav,premium_nav], animated: true)
    }
}
