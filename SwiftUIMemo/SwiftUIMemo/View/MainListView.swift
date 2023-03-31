//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by 정채은 on 2023/03/31.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store : MemoStore
    @State private var showComposer: Bool = false
    var body: some View {
        NavigationView {
            List {
                ForEach(store.list) { memo in
                    NavigationLink{
                        DetailView(memo: memo)
                    } label: {
                        MemoCell(memo: memo)
                    }
                }
                .onDelete(perform: store.delete)
            }
            .navigationTitle("메모")
            .toolbar(content: {
                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showComposer = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.yellow)
                    }
                }
            })
            .sheet(isPresented: $showComposer) {
                ComposeView()
        }
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}
