//
//  Home.swift
//  StaggeredGrid
//
//  Created by haeryu on 2022/06/10.
//

import SwiftUI

struct Home: View {
    @State var posts: [Post] = []
    @State var columns: Int = 2
    @Namespace var namespace
    var body: some View {
        
        NavigationView {
            
            StaggerdGrid(columns: columns, list: posts, content: { post in
                PostCardView(post: post)
                    .matchedGeometryEffect(id: post.id, in: namespace)
            })
                .navigationTitle("Staggered Grid")
                .navigationBarItems(trailing:
                                        HStack {
                    Button(action: {
                        columns += 1
                    }) {
                        Image(systemName: "plus")
                    }
                    Button(action: {
                        columns = max(columns - 1, 1)
                    }) {
                        Image(systemName: "minus")
                    }
                    .disabled(columns > 1 ? false : true)
                }
                )
                .animation(.easeInOut, value: columns)
        }
        .padding(.horizontal, 5)
        .onAppear {
            for index in 1...10 {
                posts.append(Post(imageURL: "post\(index)"))
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct PostCardView: View {
    var post: Post
    var body: some View {
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
    }
}
