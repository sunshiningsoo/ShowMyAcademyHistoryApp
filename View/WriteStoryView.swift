//
//  WriteStoryView.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/05/01.
//

import SwiftUI

struct WriteStoryView: View {
    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: []) var stories: FetchedResults<Story>
    @Binding var showModal:Bool
    
    var randomImg:[String] = ["this", "newImg"]
    @State var title:String = ""
    @State var chosenCon:[String] = []
    var contributeList:[String] = ["개발", "기획", "디자인"]
    @State var contribute:String = "개발"
    @State var context:String = ""
    
    var body: some View {
        VStack {
            Form{
                Section{
                    TextField(text: $title, label: {
                        Text("제목")
                    })
                }
                
                Section {
                    Picker("pick your contribution", selection: $contribute){
                        ForEach(contributeList, id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    TextField(text:$context, label: {
                        Text("내용을 적으세요")
                    })
                }
                
            }
            
            
            Button(action: {
                let someStory = Story(context: moc)
                someStory.id = UUID()
                someStory.title = title
                someStory.image = randomImg.randomElement()
                chosenCon.append(contribute)
                someStory.contribute = chosenCon
                someStory.context = context
                
                 try? moc.save()
                // 위의 경우에는 DataController 객체를 환경설정되어 있는 곳에서 객체를 만든 후에 진행했고
                // 같은 객체로 진행해야 저장이 된다.
                
                // try? DataController().container.viewContext.save()
                // 위의 경우에는 직접 DataController 클래스를 이용해서 저장을 해주도록 한다.
                
                showModal.toggle()
            }, label: {
                Text("Save My Story!")
            })
        }
    }
}

struct WriteStoryView_Previews: PreviewProvider {
    static var previews: some View {
        WriteStoryView(showModal: .constant(true))
    }
}
