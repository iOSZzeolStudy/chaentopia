//
//  AddTaskView.swift
//  ToDoDemo
//
//  Created by 정채은 on 2023/02/11.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create a new task")
                .font(.title3).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Enter your task here", text: $title)
                .textFieldStyle(.roundedBorder)
            Button {
                if title != "" {
                    realmManager.addTask(taskTitle: title)
                }
                dismiss()
            } label: {
                Text("Add task")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue:0.923, saturation: 0.69, brightness: 0.82))
                    .cornerRadius(30)
            }
            Spacer()
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue:0.923, saturation: 0.09, brightness: 0.972))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
