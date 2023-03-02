//
//  HomePage.swift
//  VillageHub
//
//  Created by Fikri Yuwi on 20/02/23.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Header(headline: .constant(UserName),caption: .constant(greeting()))
                MyCard()
                RoomMate()
                Guests()
                VStack {
                    
                }.padding(.bottom,80)
            }.padding(28)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

func greeting() -> String {
  let hour = Calendar.current.component(.hour, from: Date())
  
  let NEW_DAY = 0
  let NOON = 12
  let SUNSET = 18
  let MIDNIGHT = 24
  
  var greetingText = "Hello!" // Default greeting text
  switch hour {
  case NEW_DAY..<NOON:
      greetingText = "Good Morning!"
  case NOON..<SUNSET:
      greetingText = "Good Afternoon!"
  case SUNSET..<MIDNIGHT:
      greetingText = "Good Evening!"
  default:
      _ = "Hello!"
  }
  
  return greetingText
}

func MyCard()->some View {
    HStack {
        VStack(alignment: .leading, spacing: 6) {
            VStack {
                
            }.padding(.bottom,20)
            HStack {
                VStack(alignment: .leading) {
                    Text(UserName).font(.title.weight(.bold))
                    Text("Blok C16")
                        .foregroundColor(Color("secondary"))
                }.frame(maxWidth: .infinity,alignment: .leading)
                Button {
                    
                }label: {
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
                                    Color(.red)
                                        .shadow(.drop(color:Color("shadow1"),radius: 16,x:10,y:10))
                                        .shadow(.drop(color:Color("shadow2"),radius: 16,x:-10,y:-10))
                                )
                        )
                        .overlay(
                            Image(systemName: "qrcode.viewfinder").accentColor(Color("bg"))
                                .font(.title3)
                        )
                        .frame(width: 75)
                        
                }
            }
            .padding(.horizontal,28)
            .frame(maxWidth: .infinity,alignment: .leading)
            VStack {
                
            }.padding(.bottom,20)
            HStack {
                MyCardStatus(isAvailable: true)
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

func MyCardStatus(isAvailable:Bool)->some View {
    VStack {
        HStack {
            VStack(alignment: .leading) {
                Text(
                    isAvailable == true ?
                    "Available" :
                        "Out"
                ).bold(true)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            Image(systemName:
                    isAvailable == true ?
                  "checkmark" :
                    "xmark"
            )
                .foregroundColor(
                    isAvailable == true ?
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

func RoomMate()->some View {
    VStack(alignment: .leading) {
        Text("Room Mate").font(.title2.bold()).padding(.bottom,20)
        RoomMateItem(name: "Vincent", isAvailable: true)
        RoomMateItem(name: "Echi", isAvailable: false)
    }.frame(maxWidth: .infinity)
}

func RoomMateItem(name:String,isAvailable:Bool)->some View {
    HStack {
        RoomMateIcon(name: name)
        RoomMateDetail(name: name, isAvailable: isAvailable)
        Spacer()
        Button {
            
        }label: {
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
                .frame(width:50,height: 50)
                .overlay(Image(systemName: "bubble.left"))
                
        }
    }
    .padding(.bottom,20)
    .frame(maxWidth: .infinity,alignment: .leading)
}

func RoomMateIcon(name:String)->some View {
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
        .frame(width:50,height: 50)
        .overlay(Image(name)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40, height: 40)
        )
}

func RoomMateDetail(name:String,isAvailable:Bool)->some View {
    VStack(alignment: .leading) {
        Text(name).bold(true)
        HStack {
            Circle()
                .fill(isAvailable == true ? Color.green : Color.red)
                .frame(width: 8,height: 8)
            Text(isAvailable == true ? "Available" : "Out").foregroundColor(Color("secondary"))
        }
    }.padding(.leading,20)
}

func Guests()->some View {
    VStack(alignment: .leading) {
        Text("Guests").font(.title2.bold()).padding(.bottom,20)
        GuestItem(num: "1", name: "Ian", desc: "Doing work")
        GuestItem(num: "2", name: "Yosef", desc: "Visiting")
    }.frame(maxWidth: .infinity)
}

func GuestNum(num:String)->some View {
    Circle()
        .strokeBorder(
            LinearGradient(colors: [Color("shadow1"),Color("shadow2")],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing),
            lineWidth: 5
        )
        .background(Circle()
            .fill(Color("bg")

                )
        )
        .frame(width:50,height: 50)
        .overlay(
            Text(num).font(.title2.bold())
        )
}

func GuestDetail(name:String,desc:String)->some View {
    VStack(alignment: .leading,spacing: 6) {
        Text(name).bold(true)
        Text(desc).foregroundColor(Color("secondary"))
    }.padding(.leading,20)
}

func GuestItem(num:String,name:String,desc:String)->some View {
    HStack {
        GuestNum(num: num)
        GuestDetail(name: name, desc: desc)
        Spacer()
        Button {
            
        }label: {
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
                .frame(width:50,height: 50)
                .overlay(Image(systemName: "ellipsis"))
                
        }
    }
    .padding(.bottom,20)
    .frame(maxWidth: .infinity,alignment: .leading)
}
