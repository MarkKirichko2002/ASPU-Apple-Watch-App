//
//  SplashView.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 31.08.2024.
//

import SwiftUI

struct SplashView: View {
    
    @State var isAnimation = false
    @State var isPresented = false
    @State var isEnded = false
    @State var opacity = 0.0
    
    var body: some View {
        VStack {
            if isPresented {
                AppSectionsListView()
            } else {
                VStack(spacing: 15) {
                    Image("aspu")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .scaleEffect(isAnimation ? 1.1 : 1, anchor: .bottom)
                        .animation(.interpolatingSpring(stiffness: 170, damping: 8).delay(0.5), value: isAnimation)
                    Text("ФГБОУ ВО «АГПУ»")
                        .fontWeight(.bold)
                        .opacity(opacity)
                }
            }
        }
        .onAppear {
            showApp()
        }
    }
    
    func showApp() {
        isAnimation.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isAnimation = false
            self.isEnded.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeIn(duration: 2.0)) {
                self.opacity = 1.0
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.isPresented.toggle()
        }
    }
}

#Preview {
    SplashView()
}
