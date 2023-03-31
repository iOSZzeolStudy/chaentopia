//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by 정채은 on 2023/03/31.
//

import SwiftUI


struct MemoCell: View {
    @ObservedObject var memo: Memo
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            
            Text(memo.insertDate, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}


struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "테스트입니다옹"))
    }
}
