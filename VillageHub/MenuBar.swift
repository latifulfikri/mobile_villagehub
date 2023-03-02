//
//  MenuBar.swift
//  VillageHub
//
//  Created by Fikri Yuwi on 19/02/23.
//

import SwiftUI

enum Tab: String,CaseIterable {
    case shield
    case house
    case shippingbox
}

struct MenuBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                HStack {
                    HStack {
                        ForEach(Tab.allCases,id: \.rawValue) {
                            tab in
                            Spacer()
                            Button(
                                action: {
                                    withAnimation(
                                        .easeIn(duration: 0.1)
                                    ) {
                                        selectedTab = tab
                                    }
                                }
                            ){
                                VStack {
                                    Image(systemName: tab.rawValue)
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width:selectedTab == tab ? 28 : 25 ,height: selectedTab == tab ? 28 : 25)
                                        .foregroundColor(selectedTab == tab ? Color("primary") : Color("secondary"))
                                    selectedTab == tab ?
                                    Circle()
                                        .fill(Color.red)
                                        .frame(width: 8,height: 8) : Circle()
                                        .fill(Color.red)
                                        .frame(width: 0,height: 0)
                                }
                            }
                            
                            Spacer()
                        }
                    }.padding(.vertical,20)
                }
                .padding(.horizontal,32)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(
                            LinearGradient(colors: [Color("shadow1"),Color("shadow2")],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing),
                            lineWidth: 5
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(
                                    Color("bg")
                                        .shadow(.drop(color:Color("shadow1"),radius: 16,x:10,y:10))
                                        .shadow(.drop(color:Color("shadow2"),radius: 16,x:-10,y:-10))
                                )
                        )
                )
                .padding(.horizontal,20)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
        }
    }
}

struct MenuBar_Previews: PreviewProvider {
    static var previews: some View {
        MenuBar(selectedTab: .constant(Tab.house))
    }
}
