//
//  ContentView.swift
//  MemoDemo
//
//  Created by 정채은 on 2023/03/17.
//

import SwiftUI



struct ContentView: View {
    @State private var title: String = ""
    
    var body: some View {
        VStack {
            Text("메모")
                .font(.title).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(5)
            TextField("검색", text: $title)
                .textFieldStyle(.roundedBorder)
                .padding(5)
            Spacer()
            
            Group {
                Text("어제")
                    .font(.title2).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment: .leading ,spacing: 1) {
                    MemoView()
                    MemoView()
                    MemoView()
                }
                .cornerRadius(10)
                Spacer()
            }
            
            Group {
                Text("이전 7일")
                    .font(.title2).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment: .leading ,spacing: 1) {
                    MemoView()
                    MemoView()
                    MemoView()
                }
                .cornerRadius(10)
                Spacer()
            }
        }
        .padding()
        .background(Color(hue: 0.65, saturation: 0.03, brightness: 0.95))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
