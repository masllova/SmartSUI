import SwiftUI

public struct ButtonConfig {
    let height: CGFloat
    let padding: SmartPaddingStyleModifier.Padding
    let cornerRadius: CGFloat
    let colors: Colors
    
    public init(
        height: CGFloat = 44,
        padding: SmartPaddingStyleModifier.Padding = .init(),
        cornerRadius: CGFloat = 12,
        colors: Colors = .init()
    ) {
        self.height = height
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.colors = colors
    }
    
    public struct Colors {
        let background: Color
        let text: Color
        let disabledBackground: Color
        let loadingBackground: Color
        
        public init(
            background: Color = .accentColor,
            text: Color = .white,
            disabledBackground: Color = .gray,
            loadingBackground: Color = .accentColor
        ) {
            self.background = background
            self.text = text
            self.disabledBackground = disabledBackground
            self.loadingBackground = loadingBackground
        }
    }
}
