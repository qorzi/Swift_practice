//
//  StaggerdGrid.swift
//  StaggeredGrid
//
//  Created by haeryu on 2022/06/10.
//

import SwiftUI

//Custom View Builder

//T는 identifiable한 컬랙션을 전달
struct StaggerdGrid<Content: View, T: Identifiable>: View where T: Hashable {
    
    //컬랙션에서 뷰빌드로 각 객체를 반환
    var content: (T) -> Content
    
    var list: [T]
    
    var showsIndicators: Bool
    var spacing: CGFloat
    
    var columns: Int
    
    init(columns: Int, showsIndicators: Bool = false, spacing: CGFloat = 10, list: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.content = content
        self.list = list
        self.spacing = spacing
        self.showsIndicators = showsIndicators
        self.columns = columns
    }
    
    //Staggered Grid Function
    //columns 값에 맞는 이중 배열을 생성하고 list의 url을 각각의 내부 배열에 나누는 기능
    func outterArray() -> [[T]] {
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        var currentIndex: Int = 0
        
        for object in list {
            gridArray[currentIndex].append(object)
            
            if currentIndex == (columns - 1) {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        
        return gridArray
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: showsIndicators) {
            HStack(alignment: .top) {
                ForEach(outterArray(), id: \.self) { innerArray in
                    LazyVStack(spacing: spacing) {
                        ForEach(innerArray) { innerList in
                            content(innerList)
                        }
                    }
                }
            }
            .padding(.vertical)
        }
    }
}

struct StaggerdGrid_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
