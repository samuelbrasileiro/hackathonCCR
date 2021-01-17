//
//  TrailLineShape.swift
//  daqui
//
//  Created by Danilo Araújo on 17/01/21.
//

import SwiftUI

struct TrailLineShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let firstPoint = CGPoint(x: rect.midX, y: rect.height/2 )

        p.move(to: firstPoint)

        p.addCurve(
            to: CGPoint(x:rect.midX, y: rect.midY + rect.maxY/4),
            control1: CGPoint(x:rect.maxX,y: rect.midY),
            control2: CGPoint(x: rect.maxX,y: rect.midY))
    
        
        return p.strokedPath(StrokeStyle(lineWidth: 8, lineCap: .round))
    }
}

struct TrailLineShape_Previews: PreviewProvider {
    static var previews: some View {
        TrailLineShape()
    }
}
