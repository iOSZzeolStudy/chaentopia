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
    var body: some View {
        VStack{
            ScrollView {
                VStack {
                    Text(memo.insertDate, style: .date)
                        .padding()
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    HStack {
                        Text(memo.content)
                            .padding()
                            .font(.title2)
                        Spacer(minLength: 0)
                    }
//                    Spacer()
                }
                
            }
        }
//        .navigationTitle("메모 보기")
//        .navigationBarTitleDisplayMode(.inline)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(memo: Memo(content: "Hello"))
            .environmentObject(MemoStore())
    }
}
