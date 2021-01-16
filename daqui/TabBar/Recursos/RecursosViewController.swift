//
//  ProfileViewController.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//
import UIKit
import SwiftUI

class RecursosViewController: UIViewController {
    
    let recursosView = UIHostingController(rootView: RecursosView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(recursosView.view)
        
        self.addChild(recursosView)
        self.setupConstraints()
    }
    
    func setupConstraints() {
//        recursosView.view.translatesAutoresizingMaskIntoConstraints = false
//        
//        let constraints = [
//            recursosView.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            recursosView.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
//            recursosView.view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
//            recursosView.view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
//            recursosView.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
//        ]
//        
//        NSLayoutConstraint.activate(constraints)
    }
    


}

