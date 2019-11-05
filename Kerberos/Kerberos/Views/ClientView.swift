//
//  ClientView.swift
//  Kerberos
//
//  Created by pook on 11/3/19.
//  Copyright © 2019 pookjw. All rights reserved.
//

import SwiftUI

struct ClientView: View {
    @EnvironmentObject var enviromentClass: EnviromentClass
    @Binding var needRefresh: Bool
    var addButton: some View{
        HStack{
            Button(action: {self.needRefresh.toggle()}){
                Image(systemName: "arrow.clockwise")
            }
            Button(action: {self.enviromentClass.add_client()}){
                Image(systemName: "plus")
            }
        }
    }
    
    var body: some View {
        List{
            ForEach(0..<self.enviromentClass.client_list.count, id: \.self){ value in
                HStack{
                    Button(action: {self.enviromentClass.selected_client = value}){
                        if self.enviromentClass.selected_client == value{
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(Color.blue)
                        }else{
                            Image(systemName: "circle")
                        }
                    }
                    Text(self.enviromentClass.client_list[value].client_id.toString)
                    Spacer()
                    if self.enviromentClass.client_list[value].success{
                        Image(systemName: "lock.open.fill")
                    }else{
                        Image(systemName: "lock.fill")
                    }
                }
            }
        }
        .navigationBarTitle(Text("Client"))
        .navigationBarItems(trailing: addButton)
    }
}

