//
//  ContentView.swift
//  Drawing
//
//  Created by Christopher Fonseka on 03/05/2023.
//

import SwiftUI

struct Triangle: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .init(x: rect.midX, y: rect.minY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        path.closeSubpath()

        return path
    }
}

struct Arc: InsettableShape {

    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool

    var insetAmount = 0.0

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: .init(x: rect.midX, y: rect.midY),
            radius: (rect.width / 2.0) - insetAmount,
            startAngle: startAngle - .degrees(90),
            endAngle: endAngle - .degrees(90),
            clockwise: !clockwise
        )
        return path
    }

    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ContentView: View {
    var body: some View {
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(.blue, lineWidth: 40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
