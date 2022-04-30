//
//  RectangleCardViewInShow.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/29.
//

import SwiftUI

struct ShowListView: View {
    @State private var imgWidth = UIScreen.main.bounds.width
    @State private var imgHieght = UIScreen.main.bounds.height
    @State var showModal:Bool = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ForEach(0..<5){_ in
                    Button(action: {
                        showModal.toggle()
                    }, label: {
                        RectangleCard()
                            .fullScreenCover(isPresented: $showModal){
                                StoryDetailView(showModal: $showModal)
                            }
                    })
                }
            }
        }
        
    }
}

struct RectangleCardViewInShow_Previews: PreviewProvider {
    static var previews: some View {
        ShowListView()
    }
}
