//
//  DataLoader.swift
//  01-Demo
//
//  Created by IDS Comercial on 20/05/20.
//  Copyright © 2020 IDS Comercial. All rights reserved.
//

import Foundation

public class DataLoader {
    @Published var userData = [AppsModel]()
    
    init() {
        load()
        sort()
    }
    
    func load(){
        if let  fileLocation = Bundle.main.url(forResource: "mydata", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([AppsModel].self, from: data)
                self.userData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
    func sort(){
        self.userData = self.userData.sorted(by: { $0.name_app < $1.name_app })
    }
}
