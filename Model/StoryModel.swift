//
//  Story.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/05/02.
//

import Foundation

struct StoryModel:Identifiable{
    var id:UUID
    var title:String
    var contribute:[String]
    var image:String
    var context:String
}
