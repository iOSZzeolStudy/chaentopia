//
//  SmallAddButton.swift
//  ToDoDemo
//
//  Created by 정채은 on 2023/02/11.
//

import SwiftUI

struct SmallAddButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width:50)
                .foregroundColor(Color(hue:0.923, saturation: 0.69, brightness: 0.82))
            
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height:50)
    }
}

struct SmallAddButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallAddButton()
    }
}
