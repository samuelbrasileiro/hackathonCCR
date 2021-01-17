//
//  LoginView.swift
//  daqui
//
//  Created by Samuel Brasileiro on 17/01/21.
//

import SwiftUI

struct LoginView: View{
    
    
    var body: some View{
        VStack(spacing: 100){
            Button(action:{
                NotificationCenter.default.post(name: Notification.Name("loginAsCostumer"), object: nil)
            }){
                Text("Cliente")
                    .bold()
                    .foregroundColor(Color(.systemBackground))
                    .padding(.horizontal,80)
                    .padding(.vertical, 40)
                    .background(Color(.systemTeal))
                    .cornerRadius(10)
            }
            
            Button(action:{
                NotificationCenter.default.post(name: Notification.Name("loginAsBusiness"), object: nil)
            }){
                Text("Empresa")
                    .bold()
                    .foregroundColor(Color(.systemBackground))
                    .padding(.horizontal,80)
                    .padding(.vertical, 40)
                    .background(Color(.systemTeal))
                    .cornerRadius(10)
            }
        }
    }
}


struct Login_PreviewProvider: PreviewProvider{
    
    static var previews: some View{
        LoginView()
    }
}
