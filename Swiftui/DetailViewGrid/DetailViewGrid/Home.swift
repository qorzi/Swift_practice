//
//  Home.swift
//  DetailViewGrid
//
//  Created by haeryu on 2022/06/11.
//

import SwiftUI
import Combine

struct Home: View {
    
    @State var searchOnOff: Bool = false
    @State var search = ""
    @State var index = 0
    @State var columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    //isLiked를 저장할 배열
    @State var isLiked: [Int] = []
    
    var movieRec: [Movie] = movieDatas.recommendation
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                //Movie
                HStack {
                    Text("Movie")
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                    Button(action: {
                        withAnimation(.easeOut) {
                            searchOnOff.toggle()
                        }
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 25, weight: .bold))
                    }
                }
                .foregroundColor(.white)
                .padding(.horizontal)
                
                //Search Bar
                if searchOnOff == true {
                    TextField("Search", text: $search)
                        .padding(.horizontal)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(20)
                    .padding(.horizontal, 10)
                }
                
                //Main Poster
                ScrollView(.horizontal) {

                    HStack {
                        ForEach(movieRec){ movie in
                            if movie.rating > 3 {
                                Image(movie.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 230)
                                    .cornerRadius(15)
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
//                    .frame(height: 230)
                }
                //Popular
                HStack {
                    Text("Popular")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        withAnimation(.easeIn) {
                            if columns.count == 2 { columns.removeLast() }
                            else { columns.append(GridItem(.flexible(), spacing: 10)) }
                        }
                    }) {
                        Image(systemName: columns.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: columns) {
                    ForEach(movieRec) { movie in
                        GridView(movie: movie, summary: String(movie.id), columns: $columns, isLiked: $isLiked)
                    }
                }
            }
        }
        .background(.black)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct GridView: View {
    
    var movie: Movie
    var summary: String
    
    @Binding var columns: [GridItem]
    @Namespace var namespace
    @Binding var isLiked: [Int]
    
    var body: some View {
        VStack {
            if columns.count == 2 {
                VStack(spacing: 15) {
                    ZStack(alignment: .topTrailing) {
                        Image(movie.image)
                            .resizable()
                            .frame(height: 280)
                            .cornerRadius(15)
                        Button(action: {
                            likeInOut()
                        }) {
                            Image(systemName: "heart.fill")
                                .font(.system(size: 20))
                                .foregroundColor(isLiked.contains(movie.id) ? .red : .white)
                                .padding(8)
                                .background(.white.opacity(0.5))
                                .clipShape(Circle())
                                .padding(5)
                        }
                    }
                    .matchedGeometryEffect(id: "image", in: namespace)
                    
                    Text(movie.name)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .matchedGeometryEffect(id: "title", in: namespace)
                    
                    Button(action: {
                        
                    }) {
                        Text("Watch Now")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 15)
                            .background(.gray)
                            .cornerRadius(10)
                            .padding(.bottom)
                    }
                    .matchedGeometryEffect(id: "watch", in: namespace)
                }
                .background(Color.white.opacity(0.01)
                    .matchedGeometryEffect(id: "bg", in: namespace))
                .cornerRadius(15)
                .padding(.bottom)
            }
            else {
                HStack(spacing: 15) {
                    VStack {
                        ZStack(alignment: .topTrailing) {
                            Image(movie.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 280)
                                .cornerRadius(15)
                            Button(action: {
                                likeInOut()
                            }) {
                                Image(systemName: "heart.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(isLiked.contains(movie.id) ? .red : .white)
                                    .padding(8)
                                    .background(.white.opacity(0.5))
                                    .clipShape(Circle())
                                    .padding(5)
                            }
                        }
                        .matchedGeometryEffect(id: "image", in: namespace)
                    }
                    VStack {
                        Text(movie.name)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .lineLimit(1)
                            .padding(.top, 5)
                            .matchedGeometryEffect(id: "title", in: namespace)

                        //Rating
                        HStack(spacing: 10) {
                            ForEach(1...5, id: \.self) { rating in
                                Image(systemName: "star.fill")
                                    .foregroundColor( movie.rating >= rating ? .yellow : .gray)
                            }
                        }
                        .padding(.vertical, 1)

                        Spacer()
                        Text("영화 설명 \(summary)")
                            .foregroundColor(.white)
                        Spacer()

                        Button(action: {

                        }) {
                            Text("Watch Now")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 15)
                                .background(.gray)
                                .cornerRadius(10)
                                .padding(.bottom)
                        }
                        .matchedGeometryEffect(id: "watch", in: namespace)
                    }

                }
                .padding(.trailing)
                .background(Color.white.opacity(0.01)
                    .matchedGeometryEffect(id: "bg", in: namespace))
                .cornerRadius(15)
            }
        }
    }
    
    func likeInOut() {
        if isLiked.contains(movie.id) {
           let remove = isLiked.filter{$0 != movie.id}
            isLiked = remove
            print("removed \(movie.id)")
        } else {
            isLiked.append(movie.id)
            print("appended \(movie.id)")
        }
    }
}
