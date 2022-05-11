//
//  SegmentPrac.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/28.
//

import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var stories: FetchedResults<Story>
    @State private var tabName = "보여주기"
    var tabList:[String] = ["보여주기", "내글보기"]
    
    
    @State var showModal:Bool = false
    @State var id:UUID = UUID()
    @State var new:Int = 0
    @State var storyIsShowing = false
    
    var body: some View {
        VStack {
            Picker("which tab?", selection: $tabName) {
                ForEach(tabList, id:\.self){
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            if tabName == "보여주기"{
                ShowListView()
            }
            else{
                MyStoryView()
            }
        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
