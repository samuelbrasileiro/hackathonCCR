//
//  SearchBarView.swift
//  daqui
//
//  Created by Samuel Brasileiro on 16/01/21.
//

import SwiftUI

/// The search bar view

struct SearchBarView: View {
    
    @ObservedObject var bank: ExploreBank
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(Color(.systemGray5))
                TextField("Qual experiência você quer ter?", text: $bank.searchText, onEditingChanged: {
                    isEditing in
                    if !self.bank.isSearching{
                        
                    }
                    self.bank.isSearching = true
                    
                    
                }).foregroundColor(.primary)
                
                Button(action: {
                    self.bank.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(bank.searchText == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .frame(height: 60)
            .background(Color(.systemBackground))
            .cornerRadius(10.0)
            
            
        }
        .padding(.horizontal)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        SearchBarView(bank: ExploreBank())
    }
}
