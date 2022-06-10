//
//  DataController.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/05/01.
//

import Foundation
import CoreData

class DataController:ObservableObject{
    let container = NSPersistentContainer(name: "ShowMyAcademyHistoryApp")
    
    init(){
        container.loadPersistentStores{description, error in
            if let error = error{
                print("Core data failed to load : \(error.localizedDescription)")
            }
        }
    }
}
