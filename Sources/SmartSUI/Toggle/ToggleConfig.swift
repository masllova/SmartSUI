import SwiftUI

public struct ToggleConfig {
    let size: CGSize
    let padding: CGFloat
    let colors: Colors
    
    public init(
        size: CGSize = .init(width: 50, height: 30),
        padding: CGFloat = 3,
        colors: Colors = .init()
    ) {
        self.size = size
        self.padding = padding
        self.colors = colors
    }
    
    public struct Colors {
        let on: Color
        let off: Color
        let thumb: Color
        
        public init(
            on: Color = .green,
            off: Color = .gray,
            thumb: Color = .white
        ) {
            self.on = on
            self.off = off
            self.thumb = thumb
        }
    }
}
