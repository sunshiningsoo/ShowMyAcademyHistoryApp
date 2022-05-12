//
//  Story.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/05/02.
//

import Foundation

struct StoryModel:Hashable, Identifiable{
    var id:UUID // 고유 ID
    var title:String // 제목
    var contribute:[String] // 기여한 곳
    var image:String // 이미지 이름
    var context:String // 내용
    var isShowing:Bool // 보여주기란

}
