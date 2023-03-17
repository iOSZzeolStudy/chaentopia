//
//  ContentView.swift
//  Cards
//
//  Created by 정채은 on 2023/03/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List{
            PersonCardView(person: person1)
            PersonCardView(person: person2)
        }
        .listStyle(.plain)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
