//
//  ChatView.swift
//  FontEx
//
//  Created by haeryu on 2022/06/27.
//

import SwiftUI

struct ChatView: View {
    var user: String
    var chat: String
    var body: some View {
        HStack(alignment: .top) {
            Text(user)
            Text(":")
            Text(chat)
        }
        .padding(.leading)
        .font(.custom("NeoDunggeunmo-Regular", size: 16))
        .frame(maxWidth: .infinity, alignment: .leading)
        .listRowBackground(Color.clear)
//        .background(.clear)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(user: "김보연", chat: "안녕하세요. 저는 바보입니다.")
    }
}
