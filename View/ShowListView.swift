//
//  RectangleCardViewInShow.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/29.
//

import SwiftUI

struct ShowListView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.image)]) var stories: FetchedResults<Story>
    @State var showModal:Bool = false
    @State var id:UUID = UUID()
    @State var new:Int = 0
    @State var storyIsShowing = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                ForEach(stories, id:\.self){story in
                    Button(action: {
                        print(new)
                        new = storyArray.firstIndex(where: {$0.id == story.id})!
                        print(new)
                        
                        if storyArray.isEmpty{
                            
                        }
                        showModal.toggle()
                    }, label: {
                        RectangleCard(story: story)
                    })
                }
            }
            .fullScreenCover(isPresented: $showModal){
//                StoryDetailView(showModal:$showModal, story:storyArray.last!)
//                DispatchQueue.main.async {
                    StoryDetailView(showModal:$showModal, story:storyArray[new])
//            }
            }
            .task{
                await storyArray = dataFetchFromCoredata()
            }
            
//            .onAppear {
//                print("데이터 불러오는중")
//                storyArray = dataFetchFromCoredata()
//                print("데이터 불러왔음")
//            }
            
        }
    }
    
    private func dataFetchFromCoredata() async -> [StoryModel] {
        var tempStory: [StoryModel] = []
        for story in stories {
            let new = StoryModel(id: story.id!, title: story.title!, contribute: story.contribute!, image: story.image!, context: story.context!, isShowing: storyIsShowing)
            tempStory.append(new)
        }
        return tempStory
    }
}

struct RectangleCardViewInShow_Previews: PreviewProvider {
    static var previews: some View {
        ShowListView()
    }
}
