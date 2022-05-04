//
//  RectangleCardViewInShow.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/29.
//

import SwiftUI

struct ShowListView: View {
    @FetchRequest(sortDescriptors: []) var stories: FetchedResults<Story>
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
                        
                        // let new = StoryModel(id: story.id!, title: story.title!, contribute: story.contribute!, image: story.image!, context: story.context!, isShowing: storyIsShowing)
                        // storyArray.append(new)
                        
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
//                .fullScreenCover(isPresented: $showModal){
//                    //                let new:Int = storyArray.firstIndex(where: {$0.id == id}) ?? 0
//                    //                    StoryDetailView(showModal:$showModal, story:storyArray.last!)
//                    StoryDetailView(showModal:$showModal, story:storyArray[new])
//                }
            }
            .fullScreenCover(isPresented: $showModal){
                //                let new:Int = storyArray.firstIndex(where: {$0.id == id}) ?? 0
                //                    StoryDetailView(showModal:$showModal, story:storyArray.last!)
                StoryDetailView(showModal:$showModal, story:storyArray[new])
            }
            .onAppear {
                print("데이터 불러오는중")
                storyArray = dataFetchFromCoredata()
                print("데이터 불러왔음")
            }
        }
    }
    
    private func dataFetchFromCoredata() -> [StoryModel] {
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
