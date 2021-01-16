//
//  MyTrailsViewController.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import UIKit
import SwiftUI

class MyTrailsViewController: UIViewController {
    
    let myTrails = UIHostingController(rootView: MyTrailsView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(myTrails.view)
        
        self.addChild(myTrails)
        self.setupConstraints()
    }
    
    func setupConstraints() {
        myTrails.view.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            myTrails.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            myTrails.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            myTrails.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            myTrails.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            myTrails.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
