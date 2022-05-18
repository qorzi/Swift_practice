//
//  FloatingButton.swift
//  FloatingButtonWithCustomSheet
//
//  Created by haeryu on 2022/05/17.
//

import SwiftUI

struct FloatingButton: View {
    
    @Binding var show : Bool
    @Binding var showMic : Bool
    @Binding var showKeyboard : Bool
    @State var isLongPressing = false
    @Binding var selectedTitle : String
    
    var body: some View {
        
        ZStack {
            
            //Mic Button
            Button(action: {
                showMic = true
            }) {
                Image(systemName: "mic.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15)
                    .padding(22)
            }
            .buttonStyle(TapShrinkButton())
            .offset(y: show ? -140 : 0)
            .opacity(show ? 1 : 0)
            //기존 시트 뷰를 불러오는 코드
            .sheet(isPresented: $showMic, content: {
                MicView(showMic: $showMic)
            })
            
            //Keyboard Button
            Button(action: {
                //이 버튼으로 활성화되는 모든 동작에 대해 애니메이션 영향을 받는다.
                //여기선 숨겨있던 버튼들이 나타나고 화살표 모양이 돌아가는 모션이다.
                withAnimation(.easeInOut) {
                    showKeyboard = true
                }
            }) {
                Image(systemName: "keyboard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .padding(22)
            }
            .buttonStyle(TapShrinkButton())
            .offset(y: show ? -70 : 0)
            .opacity(show ? 1 : 0)
            
            //Swaping&Floating Button
            Button(action: {
                if isLongPressing  {
                    isLongPressing.toggle()
                } else if show == true {
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8)) {
                        show.toggle()
                    }
                } else {
                    if selectedTitle == "Main" {
                        selectedTitle = "Sub"
                    } else {
                        selectedTitle = "Main"
                    }
                }
            }) {
                Image(systemName: "chevron.up")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .padding(22)
            }
            .buttonStyle(TapShrinkButton())
            .rotationEffect(.degrees(show ? 180 : 0))
            //버튼에 롱프레스 제스쳐를 첨가해서 액션을 추가
            .simultaneousGesture(LongPressGesture(minimumDuration: 0.5)
                .onEnded{_ in
                    isLongPressing = true
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8)) {
                        show.toggle()
                    }
                    //확인용
                    print("Pressing")
                }
            )
        }
    }
}
                   
struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(show: .constant(false), showMic: .constant(false), showKeyboard: .constant(false), selectedTitle: .constant("Main"))
    }
}

struct TapShrinkButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        //.label은 버튼을 감싼다고 생각하면 된다. 이 자리에 버튼 자체르 삽입해서 획일화 가능.
        configuration.label
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
    }
}
