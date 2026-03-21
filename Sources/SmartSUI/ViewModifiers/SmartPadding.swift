import SwiftUI

public struct SmartPaddingStyleModifier: ViewModifier {
    public struct Padding {
        let top: CGFloat
        let leading: CGFloat
        let trailing: CGFloat
        let bottom: CGFloat
        
        public init(top: CGFloat = 16,
                    leading: CGFloat = 16,
                    trailing: CGFloat = 16,
                    bottom: CGFloat = 16) {
            self.top = top
            self.leading = leading
            self.trailing = trailing
            self.bottom = bottom
        }
        
        public init(all: CGFloat = 16) {
            self.top = all
            self.leading = all
            self.trailing = all
            self.bottom = all
        }
        
        public init(vertical: CGFloat = 16,
                    horizontal: CGFloat = 16) {
            self.top = vertical
            self.leading = horizontal
            self.trailing = horizontal
            self.bottom = vertical
        }
    }
    
    let padding: Padding?
    
    public func body(content: Content) -> some View {
        if let padding {
            content
                .padding(.top, padding.top)
                .padding(.leading, padding.leading)
                .padding(.trailing, padding.trailing)
                .padding(.bottom, padding.bottom)
        } else {
            content
        }
    }
}

public extension View {
    func smartPadding(_ padding: SmartPaddingStyleModifier.Padding?) -> some View {
        modifier(SmartPaddingStyleModifier(padding: padding))
    }
}
