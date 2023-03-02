//
//  SettingPage.swift
//  VillageHub
//
//  Created by Fikri Yuwi on 20/02/23.
//

import SwiftUI

struct SettingPage: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("bg").edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        PageTitle(title: "Setting")
                    }.padding(20)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

struct SettingPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingPage()
    }
}

func PageTitle(title:String)->some View {
    HStack {
        Text("Setting").font(.title.bold())
    }
    .frame(maxWidth: .infinity,alignment: .leading)
}
