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
    var CORNER_RADIUS = CGFloat(20)
    var story:Story
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: CORNER_RADIUS)
                .padding()
                .frame(width: CARD_WIDTH, height: CARD_HEIGHT)
                .shadow(radius: CORNER_RADIUS, y:CORNER_RADIUS/2)
                .opacity(0.8)
            Image(story.image  ?? "")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: CORNER_RADIUS))
                .overlay(RoundedRectangle(cornerRadius: CORNER_RADIUS).stroke(Color.black, lineWidth:5).opacity(0.1))
                .padding()
                .frame(width: CARD_WIDTH, height: CARD_HEIGHT)
            VStack{
                VStack {
                    HStack{
                        Text(story.title ?? "")
                            .font(.title)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    HStack {
                        Text(story.contribute?.first ?? "")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Spacer()
                        
                    }
                }
                .padding()
                
                Spacer()
            }
            .padding()
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
