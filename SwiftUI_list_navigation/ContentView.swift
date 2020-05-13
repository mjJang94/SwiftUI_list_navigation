//
//  ContentView.swift
//  SwiftUI_list_navigation
//
//  Created by Paymint on 2020/05/13.
//  Copyright © 2020 Paymint. All rights reserved.
//

import SwiftUI



var listData: [ToDoData] = [
    ToDoData(task: "1번 항목", imageName: "trash.circle.fill"),
    ToDoData(task: "2번 항목", imageName: "person.2.fill"),
    ToDoData(task: "3번 항목", imageName: "car.fill")
]


struct ContentView: View {
    
    @State var toggleStatus = true
    
    var body: some View {
        
        NavigationView{
            List {
                Section(header: Text("설정")){
                    Toggle(isOn: $toggleStatus){
                        Text("Allow Notifications")
                    }
                }
                
                
                Section(header: Text("해야 할 일들")){
                    ForEach (listData) { item in
                        HStack{
                            
                            NavigationLink(destination: Text(item.task)){
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }.onDelete(perform: deleteItem)
                }
            }.navigationBarTitle(Text("타이틀 바")).navigationBarItems(trailing: EditButton())
            
        }
    }
}

struct ToDoData : Identifiable{
    var id = UUID()
    var task: String
    var imageName: String
}

func deleteItem(at offsets: IndexSet){
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
