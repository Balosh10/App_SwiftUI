//
//  HomeView.swift
//  01-Demo
//
//  Created by IDS Comercial on 21/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI
import LocalAuthentication

enum textType {
    case txtPassword
    case txtEmail
}

struct LoginView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var viewModel = LoginViewModel()
    @State var messageLogin:String = ""
    @State var showsAlert = false

    
    var body: some View {
        ZStack {
            ImagenFondoView(nameImege:  self.viewModel.nameImege)
            ImagenLogoView(nameLogo: self.viewModel.nameLogo)
            VStack(alignment: .center, spacing: 4){
                    
                    ///********* TEXT EMAIL  ***********//
                        VStack(alignment: .center){
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient.init(
                                                colors: [Color.white.opacity(0.7),
                                                         Color.white.opacity(0.9)]),
                                            startPoint: .leading,
                                            endPoint: .trailing))
                                    .opacity(1)
                                    .frame(width: 300, height: 35, alignment: .center)
                                    .padding()
                                
                                Text(self.viewModel.email == nil ? "Correo..." : "").subTitleStyle()
                                Text(self.viewModel.email != nil ? (self.viewModel.email!.isEmpty ? "Correo..." : "") : "").subTitleStyle()
                                
                                TextField("", text: Binding<String>(
                                    get: {self.viewModel.email ?? ""},
                                    set: {self.viewModel.email = $0}))
                                .textFieldStyle(CustomTFStyle())
                                
                            }
                        }
                        .frame(width: 300, height: 30, alignment: .center)
                        .padding(8)
                
                        ///********* TEXT PASSSWORD  ***********//
                        VStack(alignment: .center){
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient.init(
                                                colors: [Color.white.opacity(0.7),
                                                         Color.white.opacity(0.9)]),
                                            startPoint: .leading,
                                            endPoint: .trailing))
                                    .opacity(1)
                                    .frame(width: 300, height: 35, alignment: .center)
                                    .padding()
                                
                                Text(self.viewModel.password == nil ? "Contraseña..." : "").subTitleStyle()
                                Text(self.viewModel.password != nil ? (self.viewModel.password!.isEmpty ? "Contraseña..." : "") : "").subTitleStyle()
                                
                                TextField("", text: Binding<String>(
                                    get: {self.viewModel.password ?? ""},
                                    set: {self.viewModel.password = $0}))
                                .textFieldStyle(CustomTFStyle())
                            
                                
                            }
                        }
                        .frame(width: 300, height: 30, alignment: .center)
                        .padding(8)
                
                       ///********* OPCIONES  ***********//

                       OpcionesView(viewRouter: viewRouter)
                       Spacer()
                
                       VStack(alignment: .center, spacing:0) {
                         Button(action: {
                          let result = self.viewModel.validateLogin(_email: self.viewModel.email, _password: self.viewModel.password)
                            if result.succes {
                                self.viewRouter.currentPage = Views.HomeTabView.rawValue
                            } else {
                                self.showsAlert.toggle()
                                self.messageLogin = result.Error
                            }
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
                         .alert(isPresented: self.$showsAlert) {
                            Alert(title: Text("Ups!"), message: Text(self.messageLogin), dismissButton: .default(Text("Aceptar")))
                         }
                       }
                
                       Spacer()
                       Spacer()
                       Spacer()
                       Text(self.viewModel.versionApp)
                       .fontWeight(.bold)
                       .font(.system(size: 18, weight: .bold, design: .serif))
                       .foregroundColor(.white)
            }
            .frame(width: 300, height: 300, alignment: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewRouter: ViewRouter())
    }
}

struct ImagenFondoView: View {
    
    var nameImege:String
    
    var body: some View {
        GeometryReader { geo in
            Image(self.nameImege)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width, height: geo.size.height + 87)
                .overlay(
                    Rectangle()
                    .fill(
                        RadialGradient(
                        gradient: Gradient.init(colors: [Color.black.opacity(1),Color.red.opacity(0.1)]),
                        center: .center,
                        startRadius: 1,
                        endRadius:1000))
                    .opacity(0.6)
                    .cornerRadius(0))
            
        }
    }
}

struct ImagenLogoView: View {
    
    var nameLogo:String
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment:.top) {
                Image(self.nameLogo)
                    .resizable()
                    .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.2, alignment: .topTrailing)
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .accentColor(.white)
            }
            .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.8, alignment: .top)
            .padding()
        }
    }
}

struct OpcionesView: View {
    
    var viewRouter: ViewRouter
    
    var body: some View {
        VStack{
            VStack(spacing:0) {
                Text("Registrar")
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold, design: .serif))
                
                Rectangle()
                .frame(width: 224, height: 1, alignment: .center)
                .foregroundColor(.white)
            }
            .gesture(TapGesture().onEnded{
                print("Registrar usuario")
                self.viewRouter.currentPage = Views.RegisterView.rawValue
                RegisterView(viewRouter: self.viewRouter)

            })
            .padding(6)
            
            VStack(spacing:0) {
                Text("¿Olvidaste tu contraseña?")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold, design: .serif))
                Rectangle()
                    .frame(width: 200, height: 1, alignment: .center)
                    .foregroundColor(.white)
            }
            .gesture(TapGesture().onEnded{
                print("Olvidaste tu contraseña")
            })
            .padding(6)
            
            VStack(spacing:0) {
                Text("¿Necesitas ayuda?")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold, design: .serif))
                Rectangle()
                    .frame(width: 140, height: 1, alignment: .center)
                    .foregroundColor(.white)
            }
            .gesture(TapGesture().onEnded{
                print("Necesitas ayuda")
            })
            .padding(6)
        }
    }
}
