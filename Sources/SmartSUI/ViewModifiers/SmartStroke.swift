import SwiftUI

public struct SmartStrokeStyleModifier: ViewModifier {
    public struct Stroke {
        let radius: CGFloat
        let lineWidth: CGFloat
        
        public init(radius: CGFloat = 8,
                    lineWidth: CGFloat = 1) {
            self.radius = radius
            self.lineWidth = lineWidth
        }
    }
    
    let stroke: Stroke?
    let color: Color
    
    public func body(content: Content) -> some View {
        if let stroke {
            content
                .overlay(
                    RoundedRectangle(cornerRadius: stroke.radius)
                        .stroke(color, lineWidth: stroke.lineWidth)
                )
        } else {
            content
        }
    }
}

public extension View {
    func smartStroke(_ stroke: SmartStrokeStyleModifier.Stroke?, color: Color) -> some View {
        modifier(SmartStrokeStyleModifier(stroke: stroke, color: color))
    }
}
