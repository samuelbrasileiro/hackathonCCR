//
//  MyWalletViewController.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import UIKit
import SwiftUI

class MyWalletViewController: UIViewController {
    
    let myWallet = UIHostingController(rootView: MyWalletView(prizes: MyWalletBank()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(myWallet.view)
        
        self.addChild(myWallet)
        self.setupConstraints()
    }
    
    func setupConstraints() {
        myWallet.view.translatesAutoresizingMaskIntoConstraints = false

        let constraints = [
            myWallet.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            myWallet.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            myWallet.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            myWallet.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            myWallet.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ]

        NSLayoutConstraint.activate(constraints)
    }
    


}


