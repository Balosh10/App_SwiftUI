//
//  AppsDetailView.swift
//  01-Demo
//
//  Created by IDS Comercial on 25/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI

struct AppsDetailView: View {
    
    var course:AppsModel
    
    var body: some View {
        ZStack {
            Text("Hoola")
        }
    }
}

#if DEBUG
struct AppsDetailView_Previes:PreviewProvider {
    static var previews:some View {
        AppsDetailView(course: AppsModel(id: 1,name_app: "Osvaldo", company: "Cespedes Hernandez", turn: "23", platform: "Monterrey", status_app: false,messaje_app:"App"))
    }
}

#endif


