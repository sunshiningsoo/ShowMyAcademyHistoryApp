//
//  RectangleCard.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/29.
//

import SwiftUI

struct RectangleCard: View {
    var CARD_WIDTH = UIScreen.main.bounds.width
    var CARD_HEIGHT = UIScreen.main.bounds.height/3
    var story:Story
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .padding()
                .frame(width: CARD_WIDTH, height: CARD_HEIGHT)
                .shadow(radius: 20, y:10)
                .opacity(0.8)
            Image(story.image ?? "")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth:5).opacity(0.1))
                .padding()
                .frame(width: CARD_WIDTH, height: CARD_HEIGHT)
            VStack{
                HStack{
                    Text(story.title ?? "")
                        .font(.title)
                    Spacer()
                }
            }.padding()
        }
    }
}

//struct RectangleCard_Previews: PreviewProvider {
//
//    static var previews: some View {
//        RectangleCard()
//            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3))
//    }
//}
