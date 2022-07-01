//
//  ContentView.swift
//  FontEx
//
//  Created by haeryu on 2022/06/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    //xcode가 인식하는 font 이름으로 목록 불러오기
//    init(){
//        for family in UIFont.familyNames {
//             print(family)
//
//             for names in UIFont.fontNames(forFamilyName: family){
//             print("== \(names)")
//             }
//        }
//    }
    //TextEditor 배경 지우기
    init() {
            UITextView.appearance().backgroundColor = .clear
        }
    
    @State var userNickname: String = ""
    @State var text: String = ""
    @State var isTapped = false
    @FocusState var textFieldFocused: Bool
    @State var textMaxHeight:CGFloat = 50
    
    @State var chatList: [ChatList] = []
    
    var body: some View {
        
        ZStack {
            Color("bg.gray").ignoresSafeArea()
            VStack {
                VStack {
                    HStack {
                        Text("PC통신...")
                            .font(.custom("NeoDunggeunmo-Regular", size: 32))
                            .foregroundColor(.white)
                            .padding()
                        Spacer()
                    }
                    //scrollView.scrollTo 사용으로 위해 list를 ScrollView로 변경, ScrolloViewReader 추가
                    ScrollViewReader { scrollView in
                        ScrollView {
                            LazyVStack {
                                ForEach(chatList) { list in
                                    //ChatView에 id 식별자를 추가 해줘야 작동한다.
                                    ChatView(user: list.user, chat: list.chat).id(list)
                                        .padding(.vertical, 8)
                                }
                            }
                        }
                        .foregroundColor(.white)
                        .onChange(of: chatList) { _ in
                            
                            if !chatList.isEmpty {
                                print("채팅 기록 : \(chatList.endIndex)")
                                scrollView.scrollTo(chatList[chatList.endIndex-1])
                            }
                        }
                        .onTapGesture {
                            textFieldFocused = false
                        }
                    }
                }
                .background(Color("bg"))
                
//                Spacer()
                
                //텍스트 필드
                VStack {
                    //닉네임 텍스트 필드
                    TextField("", text: $userNickname) { status in
                        //텍스트필드가 선택 되었을 때
                        if status {
                            withAnimation(.easeIn){
                                isTapped = true
                            }
                        } else if userNickname == "" {
                            withAnimation(.easeIn){
                                isTapped = false
                            }
                        }
                    } //onChanged
                    //글자 수 제한
                    .onReceive(Just(userNickname), perform: { _ in
                                    if userNickname.count > 15 {
                                        userNickname = String(userNickname.prefix(15))
                                    }
                                })
                    .padding(.top, 20)
                    .padding(.horizontal)
                    .keyboardType(.default)
                    .background(alignment: .leading) {
                        Text("UserName")
                            .font(.custom("NeoDunggeunmo-Regular", size: 16))
                            .scaleEffect(isTapped ? 0.8 : 1.2)
                            .offset(x: isTapped ? 0 : 20, y: isTapped ? -10 : 10)
                            .foregroundColor(.black.opacity(0.15))
                    }
                    .overlay(alignment: .bottomTrailing) {
                        Text("\(userNickname.count)/15")
                            .opacity(isTapped ? 1 : 0)
                            .font(.custom("NeoDunggeunmo-Regular", size: 13))
                            .padding(.trailing, 10)
                    }
                    
                    Divider()
                    
                    //대화 내용 텍스트 필드
                    HStack {
                        TextEditor(text: $text)
                        .background(Color.clear)
                        .keyboardType(.default)
                        .padding(.bottom, 20)
                        .padding(.horizontal)
                        .frame(maxHeight: max(50,textMaxHeight))
                        .lineLimit(3)
                        //내용이 정상 입력 되었을 때, 커서가 다시 내용 필드로
                        .focused($textFieldFocused)
                        .onChange(of: text) { string in
                            if string.last == "\n" {
                                if text == "\n" {
                                    print("text is empty")
                                    text = ""
                                } else {
                                    print("Found new line character")
                                    textMaxHeight = 80
                                }
                            }
                        }
                        Button(action: send) { Text("Send")}
                            .padding(.horizontal)
                    }
                }
                .font(.custom("NeoDunggeunmo-Regular", size: 16))
                .foregroundColor(.white)
                .background(.gray)
            }
        }
        
    }
    func send() {
        if text != "" && userNickname != "" {
            chatList.append(ChatList(user: userNickname, chat: text))
            textFieldFocused = true
        } else if text != "" && userNickname == "" {
            userNickname = "익명\(Int.random(in: 1..<10000))"
            chatList.append(ChatList(user: userNickname, chat: text))
            textFieldFocused = true
//            userNickname = ""
            textMaxHeight = 50
        }
        isTapped = true
        text = ""
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ChatList: Identifiable, Hashable {
    
    let id = UUID()
    let user: String
    let chat: String
    
}
