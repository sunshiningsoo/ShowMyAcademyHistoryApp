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
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? .yellow : .gray)
        })
    }
}

//struct FavButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FavButton()
//    }
//}
