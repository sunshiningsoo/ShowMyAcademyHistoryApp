//
//  StoryDetailView.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/29.
//

import SwiftUI

struct StoryDetailView: View {
    @Binding var showModal:Bool
    @Binding var storyTitle:String
    @Binding var storyContribute:[String]
    @Binding var storyImage:String
    
    var CARD_WIDTH = UIScreen.main.bounds.width
    var CARD_HEIGHT = UIScreen.main.bounds.height/3 + 50
    
    var body: some View {
        ZStack {
            VStack{
                ScrollView {
                    Image(storyImage)
                        .resizable()
                        .frame(width: CARD_WIDTH, height: CARD_HEIGHT)
                    VStack {
                        HStack {
                            Text(storyTitle)
                                .font(.largeTitle)
                            Spacer()
                        }
                        
                        HStack {
                            ForEach(storyContribute, id:\.self){con in
                                Text(con)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                    }.padding()
                    
                    Divider()
                    
                    Text("asajsdhfalkjsdhflakjsdfhlakjsd\nsdfasdfasdfasfas")
                    
                    Spacer()
                }
                
            }
            
            VStack{
                HStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .foregroundColor(.black)
                            .frame(width: 25, height: 25)
                            .padding()
                            .opacity(0.5)
                        
                        Button(action: {
                            showModal.toggle()
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .padding()
                        })
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .padding()
                    }
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
        .statusBar(hidden: true)
    }
}

//struct StoryDetailView_Previews: PreviewProvider {
//    var story:Story
//    static var previews: some View {
//        StoryDetailView(showModal: .constant(true))
//    }
//}
