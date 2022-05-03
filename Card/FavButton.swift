//
//  FavButton.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/05/03.
//

import SwiftUI

struct FavButton: View {
    @Binding var isSet:Bool
    var story:StoryModel

    var body: some View {

        Button(action: {
            isSet.toggle()
            print(isSet)
//            story.isShowing.toggle()
        }, label: {
            Image(systemName: story.isShowing == false ? "star" : "star.fill")
                .foregroundColor(story.isShowing == false ? .gray : .yellow)
        })
    }
}

//struct FavButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FavButton()
//    }
//}
