//
//  ContentView.swift
//  VillageHub
//
//  Created by Fikri Yuwi on 18/02/23.
//

import SwiftUI

var UserName = "Micca"
var Car = "Yaris"
var CarNum = "N 1049 MG"
var isCar = true

struct ContentView: View {
    
    @State private var selectedTab: Tab = .house
    
    var body: some View {
        NavigationView {
            ZStack {
//                LinearGradient(colors: [Color("bg"),Color("shadow1")],
//                               startPoint: .topLeading,
//                               endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
                Color("bg").edgesIgnoringSafeArea(.all)
                switch selectedTab {
                case .house:
                    HomePage()
                case .shield:
                    SecurityPage()
                case .shippingbox:
                    ShareStuffPage()                }
                MenuBar(selectedTab: $selectedTab)
            }
        }.navigationTitle("Home")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
