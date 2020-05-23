//
//  HomeView.swift
//  01-Demo
//
//  Created by IDS Comercial on 21/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI

struct HomeView: View {

    @State var username: String = ""

    var body: some View {
        ZStack {
            /***** IMAGEN FONDO ***/
            GeometryReader { geo in
                Image("ic_fondo_1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height + 87)
                    .overlay(
                            Rectangle()
                            .fill(
                                RadialGradient(
                                    gradient: Gradient.init(colors: [Color.red.opacity(0.01),Color.black]),
                                center: .center,
                                startRadius: 1,
                                endRadius: 400))
                            .opacity(0.6)
                            .cornerRadius(0))
                
            }
            
            /***** IMAGEN LOGO ***/
            GeometryReader { geo in
                ZStack(alignment:.top) {
                    Image("Logo")
                    .resizable()
                        .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.2, alignment: .topTrailing)
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .accentColor(.white)
                }
                .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.8, alignment: .top)
                .padding()
            }
                
            /***** IMAGEN FORMULARIO ***/
            ZStack(alignment:.center){
                VStack(alignment: .center, spacing: 4){
                    VStack(alignment: .center){
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient.init(
                                        colors: [Color.white.opacity(0.5),
                                                 Color.white.opacity(0.9)]),
                                    startPoint: .leading,
                                    endPoint: .trailing))
                            .opacity(1)
                            .frame(width: 300, height: 35, alignment: .center)
                            .padding()
                            
                            if username.isEmpty {
                              Text("Contraseña...")
                              .subTitleStyle()
                            }
                            
                            TextField("", text: self.$username)
                            .textFieldStyle(CustomTFStyle())

                        }
                    }
                    .frame(width: 300, height: 30, alignment: .center)
                    .padding(8)
                    
                    VStack(spacing:0) {
                        Text("Cambiar número de celular")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold, design: .serif))
                        Rectangle()
                        .frame(width: 224, height: 1, alignment: .center)
                        .foregroundColor(.white)
                    }
                    .padding(6)
                    
                    VStack(spacing:0) {
                        Text("¿Olvidaste tu contraseña?")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold, design: .serif))
                        Rectangle()
                        .frame(width: 200, height: 1, alignment: .center)
                        .foregroundColor(.white)
                    }
                    .padding(6)
                    
                    VStack(spacing:0) {
                        Text("¿Necesitas ayuda?")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold, design: .serif))
                        Rectangle()
                        .frame(width: 140, height: 1, alignment: .center)
                        .foregroundColor(.white)
                    }
                    .padding(6)
                    
                    Spacer()
                    VStack(alignment: .center, spacing:0) {
                        Button(action: {
                            print("Fany")
                        })
                        {
                            ZStack{
                                Rectangle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient.init(
                                            colors: [Color.orange.opacity(0.7),
                                                     Color.orange.opacity(0.9)]),
                                        startPoint: .leading,
                                        endPoint: .trailing))
                                .cornerRadius(24)
                                .frame(width: 250, height: 50, alignment: .center)
                                    
                                Text("Continuar")
                                .fontWeight(.bold)
                                .font(.system(size: 18, weight: .bold, design: .serif))
                                .foregroundColor(.white)
                            }
                        }
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Version 1.0")
                    .fontWeight(.bold)
                    .font(.system(size: 18, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                }
                .frame(width: 300, height: 300, alignment: .bottom)
                
            }
            .padding()
            .frame(width: 300, height: 400, alignment: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
