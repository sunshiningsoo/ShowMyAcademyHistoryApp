//
//  MyStoryView.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/29.
//

import SwiftUI

struct MyStoryView: View {
//    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var stories: FetchedResults<Story>
    @State var showModal:Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                ForEach(stories){story in
                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Text(story.title ?? "There's nothing")
                            ForEach(story.contribute!, id:\.self){contri in
                                Text(contri)
                            }
                        }
                    })
                    Divider()
                }
            }
            
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    ZStack {
                        Circle().frame(width: 30, height: 30)
                            .foregroundColor(.blue)
                            .opacity(0.8)
                        
                        Button(action: {
                            showModal.toggle()
                        }, label: {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 25, height: 25)
                        })
                        .foregroundColor(.white)
                        .sheet(isPresented: $showModal){
                            WriteStoryView(showModal: $showModal)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct MyStoryView_Previews: PreviewProvider {
    static var previews: some View {
        MyStoryView()
    }
}
