//
//  MemoView.swift
//  MemoDemo
//
//  Created by 정채은 on 2023/03/17.
//

import SwiftUI

struct MemoView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                    Text("제목을 작성해보겠습니다 하하")

                        .font(.headline).bold()
                        .foregroundColor(.black)
                    HStack(spacing: 15){
                        Text("어제")
                        Text("이 부분은 내용입니다 안녕안녀")
                    }
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(15)
        .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(.white)
    }
}

struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        MemoView()
    }
}
