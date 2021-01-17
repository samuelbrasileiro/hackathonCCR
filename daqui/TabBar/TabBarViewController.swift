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
            TabViewItem(UIHostingController(rootView: TrailMissionSelectionView()),name: "Seleção"),
            TabViewItem(UIHostingController(rootView: ProfileView(business: Business(database: Business.Database(name: "Gelinho Gourmet do Lilo", email: "danilo.lira01@gmail.com", phone: "+5581992656003", imgURL: "https://cdn.discordapp.com/attachments/788903633268768839/800473255445266452/duduzin.png", location: "Recife, PE", description: "Dudu - Dindin - Geladinho - Sacolé\nO nome não importa, o que importa é o sabor! e nisso a gente se garante :)\nDudu do Bom!\nO seu sorvete no saquinho, o dudu gourmet mais delicioso da região.", instagramURL: "https://www.instagram.com/danilo_lira01", facebookURL: "https://www.facebook.com/Lanilo.Dira01", category: .food, promotionalText: "Sacolés dos melhores sabores", coverURL: "https://cdn.discordapp.com/attachments/788903633268768839/800473234558418951/duduzincapa.png", id: "")), isActive: .constant(false))),name: "Meu Perfil")
        ]
        
        let costumerTab: [TabViewItem] = [
            TabViewItem(UIHostingController(rootView: ExploreView(bank: ExploreBank())), name: "Explorar"),
            TabViewItem(UIHostingController(rootView: MyTrailsView(bank: MyTrailsBank())), name: "Trilhas"),
            TabViewItem(UIHostingController(rootView: MyWalletView(bank: MyWalletBank())), name: "Cupons")
        ]
        
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
