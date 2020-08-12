//
//  ContactView.swift
//  01-Demo
//
//  Created by IDS Comercial on 25/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI
import FirebaseAuth

extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

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

struct AppsView:View {
    
    let appdata = Bundle.main.decode([AppsModel].self, from:"appsData.json")

    init(){
       // UITableView.appearance().backgroundColor = UIColor.init(hexString: "#2ecc71")
    //    UITableViewCell.appearance().backgroundColor = UIColor(hexString: "#3498db")
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorColor = .clear
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        
    }
    
    var body: some View {
        NavigationView {
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.9), Color.red.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
                Section(header: AppHeaderView()){
                    List(appdata.indices){ item in
                        ZStack(alignment: .leading){
                            if self.appdata[item].status_app {
                                CourseFullImageRow(course:self.appdata[item])
                            } else {
                                CourseRow(course:self.appdata[item])
                            }
                            NavigationLink(destination: AppsDetailView(course: self.appdata[item])){
                                EmptyView()
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(0)
                    .navigationBarItems(
                    leading:
                        HStack {
                            Button(action: {}) {
                                Image(systemName: "minus.square.fill")
                                    .font(.largeTitle)
                            }
                            .foregroundColor(.white)
                        },
                    trailing:
                        HStack {
                            Button(action: {
                                do {
                                    try Auth.auth().signOut()
                                } catch{
                                    print("error al eliminar")
                                }
                            }) {
                                Image(systemName: "plus.square.fill")
                                .font(.largeTitle)
                            }
                            .foregroundColor(.white)
                            Button(action: {}) {
                                Image(systemName: "plus.square.fill")
                                .font(.largeTitle)
                            }
                            .foregroundColor(.white)
                        })
    //                        .navigationBarTitle(Text("Apps en producción").foregroundColor(.clear), displayMode: .inline)
                                
                    
                    .navigationBarTitle("Bienvenido", displayMode: .inline)
                    .background(NavigationConfigurator { nc in
                        //nc.navigationBar.barTintColor = UIColor.clear.withAlphaComponent(0.1)
                        nc.navigationBar.setBackgroundImage(UIImage(), for: .default)
                        
                        nc.navigationBar.shadowImage = UIImage()
                        nc.navigationBar.isTranslucent = true
                        nc.navigationController?.view.backgroundColor = .clear
                        nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                    })
                })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AppsView_Previews: PreviewProvider {
    static var previews: some View {
        AppsView()
    }
}


struct CourseRow: View {
    
    var course:AppsModel
    
    var body: some View {
        HStack {
            Image("ic_user")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 48, height: 48)
            .cornerRadius(24)
            .clipped()
            
            Text(course.name_app)
            .multilineTextAlignment(.leading)
        }
    }
}

struct  CourseFullImageRow: View {
    
    var course:AppsModel
    
    var body: some View {
        HStack {
            Image("ic_oficina")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width:80, height: 80)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15).foregroundColor(.gray).opacity(0.25))
            .padding()

            VStack{
                Text(course.name_app.uppercased())
                .font(.system(size: 14, weight: .bold, design: .serif))
                .foregroundColor(Color.black)
                .multilineTextAlignment(.leading)
                .frame(width: 200, height: 23, alignment: .leading)
                
                Text(course.company.capitalized)
                .font(.system(size: 12, weight: .light, design: .serif))
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                .frame(width: 200, height: 23, alignment: .leading)
                
                Text(course.turn.capitalized)
                .font(.system(size: 12, weight: .light, design: .serif))
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                .frame(width: 200, height: 23, alignment: .leading)

                Text("Plataforma: " + course.platform.capitalized)
                .font(.system(size: 12, weight: .light, design: .serif))
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                .frame(width: 200, height: 23, alignment: .leading)
            }
            .padding(0)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300, alignment: .leading)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300, alignment: .leading)
        .background(Color.white)
        .cornerRadius(8)
        .padding(0)
    }
}

struct AppHeaderView: View {
    
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.white

    var body: some View {
        VStack{
            HStack{
               Image("ic_user")
               .resizable()
               .aspectRatio(contentMode: .fill)
               .frame(width: 96, height: 96, alignment: .center)
               .clipShape(Circle())
               .shadow(radius: 48)
                   .overlay(Circle().stroke(Color.green.opacity(0.5), lineWidth: 2))
                VStack{
                    Text("Osvaldo")
                    .foregroundColor(Color.white)
                        .font(.system(size:16, weight: .black, design: .serif))
                    .frame(width: 250, height: 23, alignment: .bottomLeading)
                    Text("Cespedes Hernandez")
                    .foregroundColor(Color.white)
                        .font(.system(size:14, weight: .bold, design: .serif))
                    .frame(width: 250, height: 23, alignment: .bottomLeading)
                   
                    HStack{
                        Image(systemName: "star.fill")
                        .colorYellowStyle()
                        Image(systemName: "star.fill")
                        .colorYellowStyle()
                        Image(systemName: "star.fill")
                        .colorYellowStyle()
                        Image(systemName: "star.fill")
                        .colorYellowStyle()
                        Image(systemName: "star.fill")
                        .colorYellowStyle()
                    }
                    .frame(width: 250, height: 23, alignment: .leading)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 80, alignment:.center )
            }
            .gesture(TapGesture().onEnded{
                self.showingActionSheet.toggle()
            })
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100, alignment: .center)
            .padding()
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
                    .default(Text("Red")) { self.backgroundColor = .red },
                    .default(Text("Green")) { self.backgroundColor = .green },
                    .default(Text("Blue")) { self.backgroundColor = .blue },
                    .cancel()
                ])
            }
            
            VStack{
                Text("Apps en distribucion")
                .foregroundColor(Color.white)
                    .font(.system(size:16, weight: .black, design: .serif))
                    .frame(width: 250, height: 23, alignment: .center)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 35, alignment: .center)
        }
    }
}
