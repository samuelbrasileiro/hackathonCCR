//
//  TabBarView.swift
//  daqui
//
//  Created by Danilo Araújo on 15/01/21.
//

import SwiftUI

struct TabBarView: View {
    
    @ObservedObject var selectedView: SelectedView
    var delegate: SelectedViewDelegate?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.orange)
            
            HStack {
                ForEach(0..<selectedView.items.count) { index in
                    Button(selectedView.items[index].name) {
                        self.selectedView.index = index
                        delegate?.changeSelectedIndex()
                    }
                }
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        let selectedView = SelectedView()
        let vc = TabBarViewController()
        
        let tabBarHost = UIHostingController(
            rootView: TabBarView(selectedView: vc.selectedView, delegate: vc))
        
    }
}
