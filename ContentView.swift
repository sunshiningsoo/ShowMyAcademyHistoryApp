////
////  ContentView.swift
////  ShowMyAcademyHistoryApp
////
////  Created by 박성수 on 2022/04/25.
////
//
//import SwiftUI
//import CoreData
//
//struct ContentView: View {
////    @Environment(\.managedObjectContext) private var viewContext
//
////    @FetchRequest(
////        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
////        animation: .default)
////    private var items: FetchedResults<Item>
//
//    var body: some View {
////        NavigationView {
////            List {
////                ForEach(items) { item in
////                    NavigationLink {
////                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
////                    } label: {
////                        HStack{
////                            Text(item.timestamp!, formatter:itemFormatter)
////                            Text("\(item.title!)")
////                        }
////                    }
////                }
////                .onDelete(perform: deleteItems)
////            }
////            .toolbar {
////                ToolbarItem(placement: .navigationBarTrailing) {
////                    EditButton()
////                }
////                ToolbarItem {
////                    Button(action: addItem) {
////                        Label("Add Item", systemImage: "plus")
////                    }
////                }
////            }
////            Text("Select an item")
////
//            MainView()
////        }
//    }
//
////    private func addItem() {
////        withAnimation {
////            let newItem = Item(context: viewContext)
////
////            newItem.timestamp = Date()
////            newItem.title = "this is title"
////
////            do {
////                try viewContext.save()
////            } catch {
////                // Replace this implementation with code to handle the error appropriately.
////                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
////                let nsError = error as NSError
////                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
////            }
////        }
////    }
////
////    private func deleteItems(offsets: IndexSet) {
////        withAnimation {
////            offsets.map { items[$0] }.forEach(viewContext.delete)
////
////            do {
////                try viewContext.save()
////            } catch {
////                // Replace this implementation with code to handle the error appropriately.
////                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
////                let nsError = error as NSError
////                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
////            }
////        }
////    }
////}
////
////private let itemFormatter: DateFormatter = {
////    let formatter = DateFormatter()
////    formatter.dateStyle = .short
////    formatter.timeStyle = .medium
////    return formatter
////}()
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
////            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}


//
//  SegmentPrac.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/28.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var stories: FetchedResults<Story>
    
    
    @State private var tabName = "보여주기"
    var tabList:[String] = ["보여주기", "내글보기"]
    
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
