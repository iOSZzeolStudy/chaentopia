//
//  MainListView.swift
//  SwiftUIMemo
//
//  Created by 정채은 on 2023/03/31.
//

import SwiftUI

struct MainListView: View {
    @EnvironmentObject var store : MemoStore
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                MemoCell(memo: memo)
            }
            .navigationTitle("메모")
        }
    }
}

struct MainListView_Previews: PreviewProvider {
    static var previews: some View {
        MainListView()
            .environmentObject(MemoStore())
    }
}