//
//  Movie.swift
//  DetailViewGrid
//
//  Created by haeryu on 2022/06/11.
//

import SwiftUI

struct Movie: Identifiable {
    
    let id: Int
    let name: String
    let image: String
    let rating: Int
    
}

struct movieDatas {
    
    static var recommendation: [Movie] = [
        Movie(id: 1, name: "1917", image: "1917", rating: 4),
        Movie(id: 2, name: "기생충", image: "기생충", rating: 5),
        Movie(id: 3, name: "너의 이름은", image: "너의이름은", rating: 4),
        Movie(id: 4, name: "라라랜드", image: "라라랜드", rating: 3),
        Movie(id: 5, name: "극한직업", image: "극한직업", rating: 3),
        Movie(id: 6, name: "범죄도시", image: "범죄도시", rating: 4),
        Movie(id: 7, name: "범죄도시2", image: "범죄도시2", rating: 5),
        Movie(id: 8, name: "조커", image: "조커", rating: 5),
        Movie(id: 9, name: "날씨의 아이", image: "날씨의아이", rating: 2),
        Movie(id: 10, name: "그랜드 부다페스트 호텔", image: "그랜드부다페스트호텔", rating: 3)
    ]

}

