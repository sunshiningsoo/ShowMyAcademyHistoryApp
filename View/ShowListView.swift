//
//  RectangleCardViewInShow.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/29.
//

import SwiftUI

struct ShowListView: View {
    //    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var stories: FetchedResults<Story>
    
    @State var showModal:Bool = false
    @State var storyTitle = ""
    @State var storyContribute = [""]
    @State var storyImage = ""
    @State var storyContext = ""
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ForEach(stories, id:\.self){story in
                    Button(action: {
                        let new = StoryModel(id: story.id!, title: story.title!, contribute: story.contribute!, image: story.image!, context: story.context!)
                        storyArray.append(new)
                        
//                        self.storyImage = story.image ?? ""
//                        self.storyTitle = story.title ?? ""
//                        self.storyContribute = story.contribute ?? [""]
//                        self.storyContext = story.context ?? ""
                        
                        showModal.toggle()
                    }, label: {
                        RectangleCard(story: story)
                    })                    
//                    .fullScreenCover(isPresented: $showModal){
//                        StoryDetailView(showModal:$showModal, story:story)
//                    }
                    // 인자를 이렇게 던져 주려고 하는데 story값의 최신화가 계속 안된다. -> 처음 값만 계속 저장된다.
                    // 이렇게 반복해주는 것보다는 바깥에 한번 감싸는 것이 훨씬 날듯
                    
                }
                .fullScreenCover(isPresented: $showModal){
//                    StoryDetailView(showModal: self.$showModal, storyTitle:$storyTitle, storyContribute:$storyContribute, storyImage:$storyImage, storyContext:$storyContext)
                    StoryDetailView(showModal:$showModal, story:storyArray.last!)
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
