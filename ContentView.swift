//
//  ContentView.swift
//  Shared
//
//  Visit www.BLCKBIRDS.com for more SwiftUI tutorials
//

//How to create an animated Progress Bar in SwiftUI

import SwiftUI

struct ContentView: View {
    
    @State var loadingProgress: CGFloat = 0.0
    
    let gradient = [Color.orange, Color.yellow, Color.orange]
    
    @State var startPoint = UnitPoint(x: -1, y: 0)
    @State var endPoint = UnitPoint(x: 0, y: 0)
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("LightGray"))
                .frame(width: 320, height: 15)
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(gradient: Gradient(colors: gradient), startPoint: startPoint, endPoint: endPoint))
                .frame(width: 320*loadingProgress, height: 15)
        }
        .onAppear {
            withAnimation (Animation.easeInOut(duration: 1).repeatForever(autoreverses: false)){
                startPoint = UnitPoint(x: 1, y: 0)
                endPoint = UnitPoint(x: 2, y: 0)
            }
            let _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
                if loadingProgress <= 1.0 {
                    withAnimation {
                        loadingProgress += 0.01
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
