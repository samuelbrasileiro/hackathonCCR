//
//  ProfileViewController.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//
import UIKit
import SwiftUI

class ProfileViewController: UIViewController {
    
    let profileView = UIHostingController(rootView: ProfileView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(profileView.view)
        
        self.addChild(profileView)
        self.setupConstraints()
    }
    
    func setupConstraints() {
//        profileView.view.translatesAutoresizingMaskIntoConstraints = false
//        
//        let constraints = [
//            profileView.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            profileView.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
//            profileView.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
//            profileView.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
//            profileView.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
//        ]
//        
//        NSLayoutConstraint.activate(constraints)
    }
    


}

