//
//  SecurityPage.swift
//  VillageHub
//
//  Created by Fikri Yuwi on 20/02/23.
//

import SwiftUI

struct device {
    var name:String
    var isOn:Bool
    var icon:String
}

struct SecurityPage: View {
    
    @State var mainDevice = device(name: "Main Lamp", isOn: true, icon: "lamp.ceiling")
    @State var devices:[device] = [
        device(name: "Desk Lamp", isOn: true, icon: "lamp.desk"),
        device(name: "Humidifier", isOn: true, icon: "humidifier"),
        device(name: "Room Lamp", isOn: true, icon: "lamp.ceiling")
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Header(headline: .constant("Secure"), caption: .constant("Great!"))
                MyCarCard()
                DeviceSection(mainDevice:$mainDevice, devices: $devices)
                VStack {
                    
                }.padding(.bottom,80)
            }.padding(28)
        }
    }
}

struct SecurityPage_Previews: PreviewProvider {
    static var previews: some View {
        SecurityPage()
    }
}

struct DeviceSection: View {
    @Binding var mainDevice:device
    @Binding var devices:[device]
    
    @State var adaptiveColumn = [
        GridItem(.adaptive(minimum: 150),spacing: 28)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Devices").font(.title2.bold())
            DeviceCard(deviceItem: $mainDevice)
            LazyVGrid(columns: adaptiveColumn, spacing: 10) {
                ForEach(devices.indices) { idx in
                    subDeviceCard(deviceItem: self.$devices[idx])
                }
            }
        }
        .padding(.top,20)
    }
}

func MyCarCard()->some View {
    HStack {
        VStack(alignment: .leading, spacing: 6) {
            VStack {
                
            }.padding(.bottom,20)
            HStack {
                VStack(alignment: .leading) {
                    Text(Car).font(.title.weight(.bold))
                    Text(CarNum)
                        .foregroundColor(Color("secondary"))
                }.frame(maxWidth: .infinity,alignment: .leading)
                VStack {
                    Image(systemName: isCar == true ? "car.side" : "bicycle")
                        .foregroundColor(Color("shadow2"))
                        .padding(20)
                }.background(
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(
                            LinearGradient(colors: [Color("shadow1"),Color("shadow2")],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing),
                            lineWidth: 3
                        )
                        .background (
                            RoundedRectangle(cornerRadius: 25)
                                .fill(
                                    Color("secondary")
                                        .shadow(.drop(color:Color("shadow1"),radius: 16,x:10,y:10))
                                        .shadow(.drop(color:Color("shadow2"),radius: 16,x:-10,y:-10))
                                )
                        )
                )
            }
            .padding(.horizontal,28)
            .frame(maxWidth: .infinity,alignment: .leading)
            VStack {
                
            }.padding(.bottom,20)
            HStack {
                MyCarStatus(isPark: true)
                VStack(alignment: .leading) {
                    Text("last update")
                        .foregroundColor(Color("secondary"))
                    Text("5.20 am")
                        .foregroundColor(Color("secondary"))
                }
                .frame(alignment: .leading)
                .padding(.leading,20)
            }
            .padding(.horizontal,28)
            .frame(maxWidth: .infinity,alignment: .leading)
            VStack {
                
            }.padding(.bottom,20)
        }
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
        .padding(.vertical,20)
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

func MyCarStatus(isPark:Bool)->some View {
    VStack {
        HStack {
            VStack(alignment: .leading) {
                Text(
                    isPark == true ?
                    "Parked" :
                        "In use"
                ).bold(true)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            Image(systemName:
                    isPark == true ?
                  "parkinglight" :
                    "road.lanes"
            )
                .foregroundColor(
                    isPark == true ?
                    Color.green :
                        Color.red
                )
                .font(.title3)
        }
        .frame(alignment: .leading)
    }
    .padding(20)
    .frame(maxWidth: .infinity,alignment: .leading)
    .background(
        Capsule()
            .strokeBorder(
                LinearGradient(colors: [Color("shadow1"),Color("shadow2")],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing),
                lineWidth: 1
            )
            .background (
                Capsule()
                    .fill(
                        Color("bg")
                            .shadow(.inner(color:Color("shadow1"),radius: 5,x:-5,y:-5))
                            .shadow(.inner(color:Color("shadow2"),radius: 3,x:3,y:3))
                            .shadow(.drop(color:Color("shadow2"),radius: 3,x:-5,y:-5))
                            .shadow(.drop(color:Color("shadow1"),radius: 3,x:5,y:5))
                    )
            )
    )
}

struct DeviceCard: View {
    
    @Binding var deviceItem: device
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack(alignment: .top) {
                Image(systemName: deviceItem.icon)
                    .resizable()
                    .frame(width: 50,height: 50)
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color("shadow1"))
                    .padding(.horizontal,32)
                    .padding(.bottom,32)
                HStack {
                    VStack(alignment: .trailing) {
                        Text(deviceItem.name).font(.title.bold())
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    ButtonDevice(isOn:$deviceItem.isOn)
                }
                .padding(28)
            }
        }
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
        .padding(.bottom,20)
        .frame(maxWidth: .infinity,alignment: .leading)
    }

}

struct subDeviceCard: View {
    @Binding var deviceItem:device
    var body: some View {
        VStack(alignment: .center, spacing: 6) {
            ZStack(alignment: .topTrailing) {
                Image(systemName: deviceItem.icon)
                    .resizable()
                    .frame(width: 50,height: 50)
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(Color("shadow1"))
                    .padding(.trailing,32)
                    .padding(.top,32)
                VStack {
                    VStack(alignment: .trailing) {
                        Text(deviceItem.name).font(.title.bold())
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    ButtonDevice(isOn: $deviceItem.isOn)
                }
                .padding(28)
            }
        }
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
        .padding(.bottom,20)
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct ButtonDevice: View{
    @Binding var isOn:Bool
    
    var body: some View {
        Button(
            action: {
                isOn = isOn == true ? false : true
            }
        ){
            VStack {
                HStack {
                    Image(systemName:
                            "power"
                    )
                    .foregroundColor(
                        isOn == true ?
                        Color.green :
                            Color.red
                    )
                    .font(.title3)
                }
                .frame(alignment: .leading)
            }
            .padding(25)
            .frame(alignment: .leading)
            .background(
                ZStack {
                    Circle()
                        .strokeBorder(
                            LinearGradient(colors: [Color("shadow1"),Color("shadow2")],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing),
                            lineWidth: 0
                        )
                        .background (
                            Circle()
                                .fill(
                                    Color("bg")
                                        .shadow(.inner(color:Color("shadow1"),radius: 5,x:-5,y:-5))
                                        .shadow(.inner(color:Color("shadow2"),radius: 3,x:3,y:3))
                                        .shadow(.drop(color:Color("shadow2"),radius: 3,x:-5,y:-5))
                                        .shadow(.drop(color:Color("shadow1"),radius: 3,x:5,y:5))
                                )
                        )
                    Circle()
                        .strokeBorder(
                            LinearGradient(colors: [Color("shadow1"),Color("shadow2")],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing),
                            lineWidth: 0
                        )
                        .background (
                            Circle()
                                .fill(
                                    Color("bg")
                                        .shadow(.inner(color:Color("shadow2"),radius: 5,x:-5,y:-5))
                                        .shadow(.inner(color:Color("shadow1"),radius: 3,x:3,y:3))
                                        .shadow(.drop(color:Color("shadow1"),radius: 3,x:-5,y:-5))
                                        .shadow(.drop(color:Color("shadow2"),radius: 3,x:5,y:5))
                                )
                        )
                        .padding(8)
                    Circle()
                        .strokeBorder(
                            LinearGradient(colors: [Color("shadow1"),Color("shadow2")],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing),
                            lineWidth: 0
                        )
                        .background (
                            Circle()
                                .fill(
                                    Color("bg")
                                        .shadow(.inner(color:Color("shadow1"),radius: 5,x:-5,y:-5))
                                        .shadow(.inner(color:Color("shadow2"),radius: 3,x:3,y:3))
                                        .shadow(.drop(color:Color("shadow2"),radius: 3,x:-5,y:-5))
                                        .shadow(.drop(color:Color("shadow1"),radius: 3,x:5,y:5))
                                )
                        ).padding(16)
                }
            )
        }
    }
}
