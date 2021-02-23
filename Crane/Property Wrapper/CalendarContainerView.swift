//
//  CalendarContainerView.swift
//  Crane
//
//  Created by captain on 2020/10/23.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct CalendarContainerView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
            ForEach(viewModel.dates, id: \.self) {date in
                Text(date)
            }
        
    }
}
    
    struct CalendarContainerView_Previews: PreviewProvider {
        static var previews: some View {
            if #available(iOS 14.0, *) {
                CalendarContainerView()
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    
    struct CalendarView: View {
        var dataList:[String]
        init(_ list: [String]) {
            self.dataList = list
        }
        var body: some View {
            List {
                ForEach(dataList, id: \.self) {date in
                    Text(date)
                }
            }
        }
        
    }
    
    class ViewModel: ObservableObject {
        @Published var dates: [String] = ["2020-02-01"]
        
        func fetch() {
            dates.append("2020-02-01")
            print(dates)
        }
    }
