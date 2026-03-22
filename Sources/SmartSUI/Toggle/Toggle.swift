import SwiftUI

public struct SmartToggle: View {
    @Binding private var isOn: Bool
    private let config: ToggleConfig
    
    public init(
        isOn: Binding<Bool>,
        config: ToggleConfig = .init()
    ) {
        self._isOn = isOn
        self.config = config
    }
    
    public var body: some View {
        let width = config.size.width
        let height = config.size.height
        let thumbSize = height - config.padding * 2
        
        ZStack(alignment: isOn ? .trailing : .leading) {
            // Track
            RoundedRectangle(cornerRadius: height / 2)
                .fill(isOn ? config.colors.on : config.colors.off)
            // Thumb
            Circle()
                .fill(config.colors.thumb)
                .frame(width: thumbSize, height: thumbSize)
                .padding(config.padding)
        }
        .frame(width: width, height: height)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                isOn.toggle()
            }
        }
    }
}
