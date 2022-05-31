//
//  StockList.swift
//  StockRankUI
//
//  Created by haeryu on 2022/05/31.
//

import SwiftUI

struct StockList: View {
    
    var stockList: [StockModel] = Stocks.list
    
    var body: some View {
        List(stockList, id: \.id) { stock in
            StockUI(rank: stock.rank, imageName: stock.imageName, name: stock.name, price: convertToCurrencyFormat(price: stock.price), diff: stock.diff)
        }
        .background(.black)
        .listStyle(PlainListStyle())
    }
}

struct StockList_Previews: PreviewProvider {
    static var previews: some View {
        StockList()
    }
}

extension View {
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
//        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
}

