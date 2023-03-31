//
//  DetailView.swift
//  SwiftUIMemo
//
//  Created by 정채은 on 2023/03/31.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var memo: Memo
    
    @EnvironmentObject var store: MemoStore
    @State private var showComposer = false
    @State private var showDeleteAlert = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView {
                    VStack {
                        Text(memo.insertDate, style: .date)
//                            .padding()
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        HStack {
                            Text(memo.content)
                                .padding()
                                .font(.title2)
                            Spacer(minLength: 0)
                        }
                    }
                }
            }
//                    .navigationTitle("메모 보기")
//                    .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showDeleteAlert = true
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.yellow)
                    }
                    .alert("삭제 확인", isPresented: $showDeleteAlert) {
                        Button(role: .destructive){
                            store.delete(memo: memo)
                            dismiss()
                        } label: {
                            Text("삭제")
                        }
                    } message: {
                        Text("메모를 삭제할까요?")
                        
                    }
                    Spacer()
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showComposer = true
                    } label: {
                        Text("편집")
                            .foregroundColor(.yellow)
                    }
                }
            })
            .sheet(isPresented: $showComposer) {
                ComposeView(memo: memo)
            }
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DetailView(memo: Memo(content: "Hello"))
                .environmentObject(MemoStore())
        }
    }
}
