import SwiftUI

public struct SmartRoundedStyleModifier: ViewModifier {
    public struct Rounded {
        let backgroundColor: Color
        let radius: CGFloat
        
        public init(backgroundColor: Color = .gray.opacity(0.5),
                    radius: CGFloat = 8) {
            self.backgroundColor = backgroundColor
            self.radius = radius
        }
    }
    
    let rounded: Rounded?
    
    public func body(content: Content) -> some View {
        if let rounded {
            content
                .background(rounded.backgroundColor)
                .cornerRadius(rounded.radius)
        } else {
            content
        }
    }
}

public extension View {
    func smartRounded(_ rounded: SmartRoundedStyleModifier.Rounded?) -> some View {
        modifier(SmartRoundedStyleModifier(rounded: rounded))
    }
}
