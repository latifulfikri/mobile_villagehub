//
//  ShareStuffPage.swift
//  VillageHub
//
//  Created by Fikri Yuwi on 20/02/23.
//

import SwiftUI

struct ShareStuffPage: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Header(headline: .constant("Share"), caption: .constant("How is it?"))
                VStack {
                    
                }.padding(.bottom,80)
            }.padding(28)
        }
    }
}

struct ShareStuffPage_Previews: PreviewProvider {
    static var previews: some View {
        ShareStuffPage()
    }
}
