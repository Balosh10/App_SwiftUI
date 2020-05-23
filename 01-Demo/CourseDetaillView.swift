//
//  CourseDetaill.swift
//  01-Demo
//
//  Created by IDS Comercial on 20/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import SwiftUI

struct CourseDetaillView: View {
    
    var course:UserDataModel
    
    var body: some View {
        VStack {
            Image("ic_user")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipped()
            
            Text(course.nombre)
                .font(.system(.title, design:.rounded))
                .fontWeight(.black)
                .frame(width: 300)
                .multilineTextAlignment(.leading)
            Spacer()
                
        }
    }
}

struct Contentview_Previews:PreviewProvider {
    static var previews:some View {
        CourseDetaillView(course: UserDataModel(id: 1, nombre: "Antoñio", apellido: "Hernandez", edad: 28, estado: "Hidalgo", tipo: false))
    }
}
