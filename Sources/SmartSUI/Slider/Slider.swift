import SwiftUI

public struct SmartSlider: View {
    @Binding private var value: Double
    
    private let range: ClosedRange<Double>
    private let step: Double?
    private let config: SliderConfig
    
    public init(
        value: Binding<Double>,
        range: ClosedRange<Double>,
        step: Double? = nil,
        config: SliderConfig = .init()
    ) {
        self._value = value
        self.range = range
        self.step = step
        self.config = config
    }
    
    public var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let progress = normalizedValue
            let xPosition = progress * width
            
            ZStack(alignment: .leading) {
                // Track
                Rectangle()
                    .fill(config.colors.track)
                    .frame(height: config.trackHeight)
                
                // Fill
                Rectangle()
                    .fill(config.colors.fill)
                    .frame(width: xPosition, height: config.trackHeight)
                
                // Thumb
                Circle()
                    .fill(config.colors.thumb)
                    .frame(width: config.thumbSize, height: config.thumbSize)
                    .offset(x: xPosition - config.thumbSize / 2)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                updateValue(from: gesture.location.x, width: width)
                            }
                    )
            }
        }
        .frame(height: config.thumbSize)
    }
    
    private var normalizedValue: CGFloat {
        let rangeSize = range.upperBound - range.lowerBound
        guard rangeSize > 0 else {
            return 0
        }
        return CGFloat((value - range.lowerBound) / rangeSize)
    }
    
    private func updateValue(from locationX: CGFloat, width: CGFloat) {
        let clampedX = min(max(locationX, 0), width)
        let progress = clampedX / width
        var newValue = Double(progress) * (range.upperBound - range.lowerBound) + range.lowerBound
        
        if let step {
            newValue = (newValue / step).rounded() * step
        }
        value = min(max(newValue, range.lowerBound), range.upperBound)
    }
}
