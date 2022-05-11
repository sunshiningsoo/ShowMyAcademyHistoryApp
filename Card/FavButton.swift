//
//  FavButton.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/05/03.
//

import SwiftUI

struct FavButton: View {
    @Binding var isSet:Bool

    var body: some View {
        Button(action: {
            isSet.toggle()
            print(isSet)
        }, label: {
            Image(systemName: isSet ? "star" : "star.fill")
                .foregroundColor(isSet ? .gray : .yellow)
        })
    }
}

//struct FavButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FavButton()
//    }
//}
