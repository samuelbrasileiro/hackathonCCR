//
//  ContentView.swift
//  daqui
//
//  Created by Samuel Brasileiro on 15/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyWalletView(prizes: MyWalletBank())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
