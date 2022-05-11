//
//  RectangleCardViewInShow.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/29.
//

import SwiftUI

struct ShowListView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\.image)]) var stories: FetchedResults<Story>
    @EnvironmentObject var storiesClass:StoriesClass
    @ObservedObject var num:Num = Num()
    @State var showModal:Bool = false
    @State var id:UUID = UUID()
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                ForEach(storiesClass.storyArray, id:\.self){story in
                    if story.isShowing{
                        Button(action: {
                            num.num = storiesClass.storyArray.firstIndex(where: {$0.id == story.id})!
                            showModal.toggle()
                        }, label: {
                            RectangleCard(story: story)
                        })
                    }
                }
            }
            .fullScreenCover(isPresented: $showModal){
                StoryDetailView(showModal:$showModal, story:storiesClass.storyArray[num.num])
            }
            .onAppear {
                print("데이터 불러오는중")
                storiesClass.storyArray = dataFetchFromCoredata()
                print("데이터 불러왔음")
            }
        }
    }
    
    private func dataFetchFromCoredata() -> [StoryModel] {
        var tempStory: [StoryModel] = []
        for story in stories {
            let new = StoryModel(id: story.id!, title: story.title!, contribute: story.contribute!, image: story.image!, context: story.context!, isShowing: story.isShowing)
            tempStory.append(new)
        }
        return tempStory
    }
}

struct RectangleCardViewInShow_Previews: PreviewProvider {
    static var previews: some View {
        ShowListView()
            .environmentObject(StoriesClass())
    }
}
