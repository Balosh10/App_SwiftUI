//
//  RouterView.swift
//  01-Demo
//
//  Created by IDS Comercial on 25/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI

enum Views:String {
    case LoginView = "LoginView"
    case RegisterView = "RegisterView"
    case HomeTabView = "HomeTabView"
}

struct MainContent: View {
    
    @ObservedObject var viewRouter:ViewRouter
    
    var body: some View {
        VStack { containedView() }
    }
    
    func containedView() -> AnyView {
        switch viewRouter.currentPage {
        case Views.LoginView.rawValue:
           return AnyView(LoginView(viewRouter:viewRouter))
        case Views.RegisterView.rawValue:
            return AnyView(RegisterView(viewRouter: viewRouter))
        case Views.HomeTabView.rawValue:
            return AnyView(HomeTabView(viewRouter:viewRouter))
        default:
             return AnyView(LoginView(viewRouter:viewRouter))
        }
    }
}

#if DEBUG
struct MotherView_Previews:PreviewProvider {
    static var previews: some View {
        MainContent(viewRouter: ViewRouter())
    }
}
#endif

