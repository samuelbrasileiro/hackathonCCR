//
//  TabViewItem.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import UIKit

class TabViewItem: Identifiable {    
    var name: String
    var viewController: UIViewController
    
    init(_ viewController: UIViewController, name: String){
        self.name = name
        self.viewController = viewController
    }
}
