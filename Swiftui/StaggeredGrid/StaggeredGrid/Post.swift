//
//  Post.swift
//  StaggeredGrid
//
//  Created by haeryu on 2022/06/10.
//

import SwiftUI

struct Post: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
}

struct postURL {
    let list: [Post] = [
    Post(imageURL: "https://picsum.photos/id/0/5616/3744"),
    Post(imageURL: "https://picsum.photos/id/1/5616/3744"),
    Post(imageURL: "https://picsum.photos/id/10/2500/1667"),
    Post(imageURL: "https://picsum.photos/id/100/2500/1656"),
    Post(imageURL: "https://picsum.photos/id/1000/5626/3635"),
    Post(imageURL: "https://picsum.photos/id/1001/5616/3744"),
    Post(imageURL: "https://picsum.photos/id/1002/4312/2868"),
    Post(imageURL: "https://picsum.photos/id/1003/1181/1772"),
    Post(imageURL: "https://picsum.photos/id/1005/5760/3840"),
    Post(imageURL: "https://picsum.photos/id/1006/3000/2000"),
    ]
}
