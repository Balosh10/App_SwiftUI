//
//  ContentView.swift
//  01-Demo
//
//  Created by IDS Comercial on 19/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct ContentView: View {
    
    let userdata = Bundle.main.decode([UserDataModel].self, from:"mydata.json")
    
    var body: some View {
        NavigationView {
            List(userdata.indices){ item in
                NavigationLink(destination: CourseDetaillView(course: self.userdata[item])){
                    if self.userdata[item].tipo {
                       CourseFullImageRow(course:self.userdata[item])
                    } else {
                        CourseRow(course:self.userdata[item])
                    }
                }
            }
            // 4.
            .navigationBarItems(
            leading:
            HStack {
                Button(action: {}) {
                    Image(systemName: "minus.square.fill")
                        .font(.largeTitle)
                }
                .foregroundColor(.pink)
            },
            trailing:
            HStack {
                Button(action: {}) {
                    Image(systemName: "plus.square.fill")
                    .font(.largeTitle)
                }
                .foregroundColor(.red)
                Button(action: {}) {
                    Image(systemName: "plus.square.fill")
                    .font(.largeTitle)
                }
                .foregroundColor(.blue)
            })
            // 5.
           .navigationBarTitle(Text("Home"))
            
            
//            .navigationBarTitle("Try it!", displayMode: .inline)
//            .background(NavigationConfigurator { nc in
//                nc.navigationBar.barTintColor = .blue
//                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
//            })
        }
        //.navigationViewStyle(StackNavigationViewStyle())

    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


struct CourseRow: View {
    var course:UserDataModel
    
    var body: some View {
        HStack {
            Image("ic_user")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 48, height: 48)
                .cornerRadius(24)
                .clipped()
            
            Text(course.nombre)
                .multilineTextAlignment(.leading)
        }
    }
}

struct  CourseFullImageRow: View {
    var course:UserDataModel
    
    var body: some View {
        ZStack {
            Image("ic_oficina")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: 200)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.gray)
                    .opacity(0.25))
            
            Text(course.apellido)
                .font(.system(.headline, design:.rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
