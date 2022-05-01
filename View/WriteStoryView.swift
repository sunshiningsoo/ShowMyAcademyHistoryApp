//
//  WriteStoryView.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/05/01.
//

import SwiftUI

struct WriteStoryView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var stories: FetchedResults<Story>
    @Binding var showModal:Bool
    
    var randomImg:[String] = ["this", "newImg"]
    
    @State var title:String = ""
    @State var contribute:String = "개발"
    var contributeList:[String] = ["개발", "기획", "디자인"]
    @State var chosenCon:[String] = []
    
    var body: some View {
        VStack {
            Text("This is writing page")
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
            }
            
            
            Button(action: {
                let someStory = Story(context: moc)
                someStory.id = UUID()
                someStory.title = title
                someStory.image = randomImg.randomElement()
                chosenCon.append(contribute)
                someStory.contribute = chosenCon
                try? moc.save()
                
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
