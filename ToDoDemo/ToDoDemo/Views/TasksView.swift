//
//  TasksView.swift
//  ToDoDemo
//
//  Created by 정채은 on 2023/02/11.
//

import SwiftUI

//struct TasksView: View {
//    @EnvironmentObject var realmManager: RealmManager
//
//    var body: some View {
//        VStack {
//            Text("My tasks")
//                .font(.title3).bold()
//                .padding()
//                .frame(maxWidth: .infinity , alignment: .leading)
//
//            List {
//                ForEach(realmManager.tasks, id: \.id) {
//                    task in
//                    if !task.isInvalidated {
//                        TaskRow(task: task.title, completed: task.completed)
//                            .onTapGesture {
//                                realmManager.updateTask(id: task.id, completed: !task.completed)
//                            }
//                            .swipeActions(edge: .trailing){
//                                Button(role : .destructive) {
//                                    realmManager.deleteTask(id: task.id)
//                                } label: {
//                                    Label("Delete", systemImage: "trash")
//                                }
//                            }
//                    }
//                }
//                .listRowSeparator(.hidden)
//            }
//            .onAppear {
//                UITableView.appearance().backgroundColor = UIColor.clear
//                UITableViewCell.appearance().backgroundColor = UIColor.clear
//
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color(hue:0.923, saturation: 0.09, brightness: 0.972))
//    }
//}




struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        VStack {
            Text("My tasks")
                .font(.title2).bold()
                .padding(.horizontal)
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if realmManager.tasks.count > 0 {
                List {
                    ForEach(realmManager.tasks, id: \.id) { task in
                        if !task.isInvalidated && !task.isFrozen {
                            TaskRow(task: task.title, completed: task.completed)
                                .onTapGesture {
                                    realmManager.updateTask(id: task.id, completed: !task.completed)
                                }
                        }
                    }
//                    .onMove { from, to in
//                        realmManager.tasks.move(fromOffsets: from, toOffset: to)
//                                }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let taskTodelete = realmManager.tasks[index]
                            realmManager.deleteTask(id: taskTodelete.id)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .scrollContentBackground(.hidden)
            }
            
            Spacer()
        }
    }

}



struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
