//
//  Tablefy.swift
//  daqui
//
//  Created by Danilo Araújo on 17/01/21.
//

import SwiftUI

struct Tablefy: ViewModifier{
    func body(content: Content) -> some View {
        VStack {
            Divider()
            HStack(){
                content
                Spacer()
                Image(systemName: "chevron.right")
                    
            }
            .padding(.vertical, 6)
            .padding(.horizontal)
            .foregroundColor(Color(.systemGray))
            
        }

    }
}

struct Tablefy_Previews: PreviewProvider {
    static var previews: some View {
        Text("Meu nome").tablefy()
    }
}
