//
//  MyTrailsViewModel.swift
//  daqui
//
//  Created by Danilo Araújo on 16/01/21.
//

import SwiftUI

class MyTrailsBank: ObservableObject {
    
    @Published var prizes: [Trail]
    
    init() {
        self.prizes = []
    }
}
