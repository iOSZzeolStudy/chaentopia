//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by 정채은 on 2023/03/31.
//

import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo]
    
    init() {
        list = [
            Memo(content: "아개졸리다", insertDate: Date.now),
            Memo(content: "진짜개졸림..", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "지금내가뭐쓰는건지..", insertDate: Date.now.addingTimeInterval(3600 * -48))
        ]
    }
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else {
            return
        }
        memo.content = content
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }
    }
    
    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
    
}
