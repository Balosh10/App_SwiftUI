//
//  HomeView.swift
//  01-Demo
//
//  Created by IDS Comercial on 25/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI

struct HomeTabView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        TabView{
          AppsView()
          .tabItem{
                Image(systemName: "house")
                Text("Home")
            }
            
            Text("Setting View")
            .tabItem{
                  Image(systemName: "gear")
                  Text("Settings")
              }
        }
    }
}

#if DEBUG
struct HomeTabView_Previews:PreviewProvider {
    static var previews: some View {
        HomeTabView(viewRouter: ViewRouter())
    }
}
#endif
