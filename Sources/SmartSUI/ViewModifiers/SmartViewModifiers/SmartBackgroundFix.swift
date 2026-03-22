import SwiftUI

public struct SmartBackgroundFixStyleModifier: ViewModifier {
    let background: Color
    
    public func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .scrollContentBackground(.hidden)
                .background(background)
        } else {
            content
                .background(background)
        }
    }
}

public extension View {
    func smartBackgroundFix(_ background: Color) -> some View {
        modifier(SmartBackgroundFixStyleModifier(background: background))
    }
}
