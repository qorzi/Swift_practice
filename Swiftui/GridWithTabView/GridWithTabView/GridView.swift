//
//  GridView.swift
//  GridWithTabView
//
//  Created by haeryu on 2022/06/09.
//

import SwiftUI

struct GridView: View {
    
    //Grid에 필요한 columns 어레이와 GridItem을 repeating을 이용해 표현
    //columns에 있는 spacing은 행간의 공간 너비를 뜻함
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    //아니라면 아래처럼 일일히 배열을 넣어줘야함
//    let columns: [GridItem] = [
//            GridItem(.flexible(), spacing: 20),
//            GridItem(.flexible(), spacing: 20) ]
    
    var fit_Data: [Fitness]
    
    var body: some View {
        
        //Grid에 있는 spacing은 열간의 여분 공간 높이를 뜻함
        LazyVGrid(columns: columns, spacing: 30) {
            
            ForEach(fit_Data) { fitness in
                ZStack(alignment: .topTrailing) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(fitness.title)
                            .foregroundStyle(.white)
                        Text(fitness.data)
                            .font(.system(size: 25, weight: .bold))
                            .foregroundStyle(.white)
                            .padding(.top, 10)
                        
                        HStack {
                            Spacer()
                            
                            Text(fitness.suggest)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding()
                    .background(Color(fitness.image))
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 1, y: 5)
                    
                    Image(fitness.image)
                        .foregroundColor(.white)
                        .padding()
                        .background(.white.opacity(0.12))
                        .clipShape(Circle())
                        .padding(5)
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 25)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(fit_Data: day_Fit_Data)
    }
}
