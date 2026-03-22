import SwiftUI

public struct SliderConfig {
    let trackHeight: CGFloat
    let thumbSize: CGFloat
    let colors: Colors
    
    public init(
        trackHeight: CGFloat = 4,
        thumbSize: CGFloat = 20,
        colors: Colors = .init()
    ) {
        self.trackHeight = trackHeight
        self.thumbSize = thumbSize
        self.colors = colors
    }
    
    public struct Colors {
        let track: Color
        let fill: Color
        let thumb: Color
        
        public init(
            track: Color = .gray,
            fill: Color = .accentColor,
            thumb: Color = .white
        ) {
            self.track = track
            self.fill = fill
            self.thumb = thumb
        }
    }
}
