//
//  RectangleCardViewInShow.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/29.
//

import SwiftUI

struct ShowListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var stories: FetchedResults<Story>
    @State var showModal:Bool = false
    @State var storyTitle = ""
    @State var storyContribute = [""]
    @State var storyImage = ""
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ForEach(stories, id:\.self){story in
                    Button(action: {
                        self.storyTitle = story.title ?? ""
                        self.storyImage = story.image ?? ""
                        self.storyContribute = story.contribute ?? [""]
                        showModal.toggle()
                    }, label: {
                        RectangleCard(story: story)
                    })
                }
                .fullScreenCover(isPresented: $showModal){
                    StoryDetailView(showModal: self.$showModal, storyTitle:$storyTitle, storyContribute:$storyContribute, storyImage:$storyImage)
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
