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
            TabViewItem(UIHostingController(rootView: TrailMissionSelectionView())s,name: "Seleção")
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
