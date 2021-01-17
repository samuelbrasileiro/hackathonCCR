//
//  TabBarViewController.swift
//  daqui
//
//  Created by Samuel Brasileiro on 15/01/21.
//

import UIKit
import SwiftUI

protocol SelectedViewDelegate{
    func changeSelectedIndex()
}

class SelectedView: ObservableObject{
    @Published var index: Int = 0
    var items: [TabViewItem] = []
    static var user: User = .business
    init(){
        
        let businessTab: [TabViewItem] = [
            TabViewItem(UIHostingController(rootView: RecursosView()), name: "Recursos"),
            TabViewItem(UIHostingController(rootView: ProfileView(business: Business(database: Business.Database(name: "Gelinho Gourmet do Lilo", email: "danilo.lira01@gmail.com", phone: "+5581992656003", imgURL: "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/3d/e8/da/3de8daa8-454a-1247-bcf0-a33a50f487af/8429006434299.jpg/200x200bb.jpeg", location: "Recife, PE", description: "Dudu - Dindin - Geladinho - Sacolé O nome não importa, o que importa é o sabor! e nisso a gente se garante (: Dudu do Bom! O seu sorvete no saquinho! O dudu gourmet mais delicioso da região. Recife-PE", instagramURL: "https://www.instagram.com/danilo_lira01", facebookURL: "https://www.facebook.com/Lanilo.Dira01", category: .food, promotionalText: "Sacolés dos melhores sabores", coverURL: "https://is5-ssl.mzstatic.com/image/thumb/Music1/v4/19/bc/9b/19bc9b47-6a0f-e947-1f81-c174e7de0f6d/0617465613456.jpg/200x200bb.jpeg", id: "0101010101")), isActive: .constant(false))), name: "Meu Perfil")
        ]
        
        let costumerTab: [TabViewItem] = [
            TabViewItem(UIHostingController(rootView: ExploreView(bank: ExploreBank())), name: "Explorar"),
            TabViewItem(UIHostingController(rootView: MyTrailsView(bank: MyTrailsBank())), name: "Trilhas"),
//            TabViewItem(UIHostingController(rootView: MyWalletView(bank: MyWalletBank())), name: "Cupons")
            TabViewItem(UIHostingController(rootView: TrailView(bank: MyTrailsBank())), name: "Cupons")
        ]
        
        //TODO: Modificar condicional
        items = (SelectedView.user == .costumer ? costumerTab : businessTab)
        
    }
    
    func getViewControllers() -> [UIViewController] {
        items.map { $0.viewController }
    }
}

enum User{
    case costumer
    case business
}
class TabBarViewController: UITabBarController, SelectedViewDelegate {
    let handler = FirebaseHandler()
    var selectedView = SelectedView()
    var tabBarHost: UIHostingController<TabBarView>?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = selectedView.getViewControllers()
        self.loadTabBar()
        
        NotificationCenter.default.addObserver(self, selector: #selector(hideTabView), name: NSNotification.Name(rawValue: "hideTabView"), object: nil)
    }
    @objc func hideTabView(){
        tabBarHost?.view.isHidden = true
    }
    func changeSelectedIndex() {
        self.selectedIndex = selectedView.index
    }
    
    func loadTabBar() {
        tabBarHost = UIHostingController(rootView: TabBarView(selectedView: selectedView, delegate: self))
        tabBarHost!.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addChild(tabBarHost!)
        self.view.addSubview(tabBarHost!.view)
        self.tabBar.isHidden = true
        
        let constraints = [
            tabBarHost!.view.topAnchor.constraint(equalTo: self.tabBar.safeAreaLayoutGuide.topAnchor, constant: 0),
            tabBarHost!.view.centerXAnchor.constraint(equalTo: self.tabBar.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            tabBarHost!.view.leadingAnchor.constraint(equalTo: self.tabBar.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tabBarHost!.view.trailingAnchor.constraint(equalTo: self.tabBar.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tabBarHost!.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -40)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}
