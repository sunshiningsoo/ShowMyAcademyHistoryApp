//
//  SegmentPrac.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/28.
//

import SwiftUI

struct MainView: View {
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

struct SegmentPrac_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
