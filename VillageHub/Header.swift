//
//  Header.swift
//  VillageHub
//
//  Created by Fikri Yuwi on 20/02/23.
//

import SwiftUI

struct Header: View {
    @Binding var headline:String
    @Binding var caption:String
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing:6.0){
                NavigationLink(destination: SettingPage(), label: {
                    Circle()
                        .strokeBorder(
                            LinearGradient(colors: [Color("shadow1"),Color("shadow2")],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing),
                            lineWidth: 1
                        )
                        .background(Circle()
                            .fill(Color("bg")
                                .shadow(.inner(color:Color("shadow1"),radius: 5,x:-5,y:-5))
                                .shadow(.inner(color:Color("shadow2"),radius: 3,x:3,y:3))
                                .shadow(.drop(color:Color("shadow2"),radius: 3,x:-5,y:-5))
                                .shadow(.drop(color:Color("shadow1"),radius: 3,x:5,y:5))
                                )
                        )
                        .frame(width:75,height: 75)
                        .overlay(Image("user")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                        )
                    VStack(alignment: .leading) {
                        Text(caption)
                        Text(headline).font(.title2.weight(.bold))
                    }
                    .padding(.leading,20)
                })
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            Button {
                
            }label: {
                Image(systemName:"bell")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 28, height: 28)
                    .accentColor(Color("primary"))
            }
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(headline: .constant("Micca"),caption: .constant("Hello!"))
    }
}
