//
//  BarsView.swift
//  Crane
//
//  Created by captain on 2020/8/13.
//  Copyright © 2020 captain. All rights reserved.
//

import SwiftUI

struct BarCharView: View {
    let bars: [Bar]
    
    var body: some View {
        Group {
            if bars.isEmpty {
                Text("There is no data to display chart...")
            }else {
                VStack {
                    BarsView(bars: bars)
                    LabelsView(bars: bars, labelCount: 4)
                    LegendView(bars: bars).padding().accessibility(hidden: true)
                }
            }
        }
    }
}

struct BarsView: View {
    let bars: [Bar]
    let max: Double
    init(bars: [Bar]) {
        self.bars = bars
        self.max = bars.map{ $0.value}.max() ?? 0
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .bottom) {
                ForEach(self.bars) {bar in
                    Capsule()
                        .fill(bar.legend.color)
                        .frame(height: CGFloat(bar.value) / CGFloat(self.max) * geometry.size.height)
                        .overlay(Rectangle().stroke(Color.white))
                        .accessibility(hint: Text(bar.label))
                        .accessibility(hint: Text(bar.legend.label))
                }
            }
        }
    }
}

struct LegendView: View {
    private let legends: [Legend]
    
    init(bars: [Bar]) {
        legends = Array(Set(bars.map{$0.legend}))
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(legends, id: \.self) { legend in
                VStack(alignment: .center, spacing: 0) {
                    Circle()
                        .fill(legend.color)
                        .frame(width: 16, height: 18)
                    
                    Text(legend.label)
                        .font(.subheadline)
                        .lineLimit(nil)
                    
                }
            }
        }
    }
}

struct LabelsView: View {
    let bars: [Bar]
    let labelCount: Int
    
    private var threshold: Int {
        let threshold = bars.count / labelCount
        return threshold == 0 ? 1 : threshold
    }
    
    var body: some View {
        HStack {
            ForEach(0..<bars.count, id: \.self) { index in
                Group {
                    if index % self.threshold == 0 {
                        Spacer()
                        Text(self.bars[index].label).font(.subheadline)
                        Spacer()
                    }
                }
            }
        }
    }
}


struct Legend: Hashable {
    let color: Color
    let label: String
}
struct Bar: Identifiable {
    let id: Int
    let value: Double
    let label: String
    let legend: Legend
}


struct BarCharView_Previews: PreviewProvider {
    static var previews: some View {
        
        var bars: [Bar] = []
        
        for i in 0..<20 {
            let bar = Bar(id: i, value: Double(arc4random() % 10), label: "\(i)\(i):\(i)\(i)", legend: Legend(color:  i % 3 == 0 ? .red : i % 3 == 1 ? .blue : .green, label: "\(i % 3)\(i % 3):\(i % 3)\(i % 3)"))
            bars.append(bar)
        }
        
        return BarCharView(bars: bars).frame(height: 300, alignment: .leading)
    }
}
