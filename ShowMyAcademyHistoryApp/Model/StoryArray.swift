//
//  StoryArray.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/05/02.
//

import Foundation
import SwiftUI

class StoriesClass:ObservableObject{
    @Published var storyArray: [StoryModel] = []
    @Published var num: Int = 0
}
