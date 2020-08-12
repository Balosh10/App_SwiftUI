//
//  RegisterView.swift
//  01-Demo
//
//  Created by IDS Comercial on 08/07/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var viewModel = RegisterViewModel()
    @State var showsAlert = false

    var body: some View {
        ZStack {
            ImagenFondoView(nameImege:  self.viewModel.nameImege)
            ImagenLogoView(nameLogo: self.viewModel.nameLogo)
            VStack(alignment: .center, spacing: 4){
                    
                       ///********* TITULO REGISTRAR  ***********//
                        VStack(spacing:0) {
                            Text("Registrar usuario")
                                .foregroundColor(.white)
                                .font(.system(size: 24, weight: .bold, design: .serif))
                        }
                        .padding(6)
                        Spacer()

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
                                    set: {
                                        self.viewModel.email = $0
                                        self.viewModel.email?.lowercased()
                                        
                                }))
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
                                    set: { self.viewModel.password = $0 }))
                                .textFieldStyle(CustomTFStyle())
                                
                            
                                
                            }
                        }
                        .frame(width: 300, height: 30, alignment: .center)
                        .padding(8)
                
                       Spacer()
                
                       VStack(alignment: .center, spacing:0) {
                         Button(action: {
                            self.viewModel.validateRegisterUser(_email: self.viewModel.email, _password: self.viewModel.password)
//                            let ssss = Auth.auth().currentUser?.email ?? ""
//                            if ssss.isEmpty {
//                               print("no se inicio sesion")
//                               self.showsAlert.toggle()
//                            } else {
                               self.viewRouter.currentPage = Views.HomeTabView.rawValue
//                            }
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
                                 Text("Registrar")
                                .fontWeight(.bold)
                                .font(.system(size: 18, weight: .bold, design: .serif))
                                .foregroundColor(.white)
                            }
                         }
                         .alert(isPresented: self.$showsAlert) {
                             Alert(title: Text("Ups!"), message: Text("Ocurrio un error al registrar usuario. ¡intentalo nuevamente!"), dismissButton: .default(Text("Aceptar")))
                         }
                       }
                       
                        
                
                       Spacer()
                
                       VStack(spacing:0) {
                            Text("Iniciar seción")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .bold, design: .serif))
                            Rectangle()
                                .frame(width: 120, height: 1, alignment: .center)
                                .foregroundColor(.white)
                       }
                       .gesture(TapGesture().onEnded{
                            self.viewRouter.currentPage = Views.LoginView.rawValue
                            LoginView(viewRouter: self.viewRouter)
                       })
                       .padding(12)
                
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

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewRouter: ViewRouter())
    }
}
