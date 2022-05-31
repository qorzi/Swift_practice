//
//  StockUI.swift
//  StockRankUI
//
//  Created by haeryu on 2022/05/31.
//

import SwiftUI

struct StockUI: View {

    //String 값을 저장할 경우, 값이 없을 때, nil을 반환 하기 때문에
    //let name = UserDefaults.standard.string(forKey: "name") ?? "" 처럼 옵셔널 바인딩 필수!
    
//    @State var isLikeStock: Bool = UserDefaults.standard.bool(forKey: "isLikeStock_key")
    @AppStorage("isLikeStock_key") var isLikeStock: Bool = UserDefaults.standard.bool(forKey: "isLikeStock_key")
    
    var rank: Int
    var imageName: String
    var name: String
    var price: String
    var diff: Double

    var body: some View {
        HStack {
            Text("\(rank)")
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .frame(width: 20, alignment: .center)
                .padding(.trailing, 10)
            Image(imageName)
                .resizable()
                .frame(width: 45, height: 45, alignment: .center)
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                HStack {
                    Text("\(price) 원")
                        .font(.caption)
                        .foregroundColor(.gray)
                    //String(format: "%.2f", value)는 소수점 2째 자리까지 value 갑을 나타낸다는 의미
                    Text("\(String(format: "%.2f", diff))%")
                        .font(.caption)
                        .foregroundColor(diff >= 0 ? .blue : .red)
                }
            }
            .padding(.leading, 10)
            Spacer()
            Image(systemName: "heart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .foregroundColor(isLikeStock ? .red : .gray)
                .padding(.trailing)
                .onTapGesture {
                    isLikeStock.toggle()
//                    UserDefaults.standard.setValue(isLikeStock, forKey: "isLikeStock_key")
                }
        }
        .background(.black)
        //리스트의 백그라운드 색상을 변경 .clear를 이용하면 배경을 그대로 투영.
        .listRowBackground(Color.clear)
        //리스트의 구분선을 숨기는 코드
        .listRowSeparator(.hidden)
        .padding(EdgeInsets(top: 15, leading: 0, bottom: 7, trailing: 0))
    }
}

struct StockUI_Previews: PreviewProvider {
    static var previews: some View {
        StockUI(rank: 1, imageName: "AAPL", name: "애플", price: "0000", diff: 0.000)
            .background(.black)
    }
}

