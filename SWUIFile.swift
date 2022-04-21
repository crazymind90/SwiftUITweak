//  Created by CrazyMind90 on 21/04/2022.
//

import SwiftUI
import UIKit


class SwiftUIToObjc : NSObject {
    
    @objc func SUIView() -> UIViewController {
        
        return UIHostingController(rootView: SWUIFile())
    }
}

struct SWUIFile: View {
    
    @State var searchedString = ""
    @State var ShowAlert = false
    
    var body: some View {
        
        
        ZStack {
            
            LinearGradient(gradient: Gradient.init(colors: [.purple,.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    TextField("Search",text: $searchedString)
                    
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding()
                    
                }
                
                Spacer()
                
                VStack {
                    
                    List(0..<30) { i in
                        
                        HStack {
                            Image(systemName: "house")
                                .foregroundColor(Color.blue)
                                .font(.system(size: 20))
                                .padding(.trailing,30)
                            Text("Cell \(i)")
                                .foregroundColor(Color.white)
                            
                        }
                        .listRowBackground(Color.init(hex: "1B1B3F"))
                        // .listStyle(.grouped)
                        .padding()
                        .padding(.leading,0)
                    }
                    .onAppear {
                        UITableView.appearance().backgroundColor =  UIColor.init(rgb: 0x1B1B2F)
                    }
                    .cornerRadius(20)
                    
                    .padding(.horizontal)
                    
                    
                }
                
                
                Button {
                    
                    ShowAlert.toggle()
                    
                } label: {
                    Text("Pass data")
                    
                        .frame(width: 220, height: 43, alignment: .center)
                        .background(Color.pink)
                        .cornerRadius(20)
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                        .padding(.top,20)
                    
                        .alert(isPresented: $ShowAlert) {
                            Alert(title: Text("Hola"), message: Text("SwiftUI in objective-C tweak"), dismissButton: .default(Text("OK")))
                            
                        }
                }
                
                
                Spacer()
            }
        }
    }
}


struct SWUIFile_Previews: PreviewProvider {
    static var previews: some View {
        SWUIFile()
    }
}



extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
