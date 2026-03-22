import SwiftUI

public struct SmartButton: View {
    private let title: String?
    private let action: () -> Void
    private let config: ButtonConfig
    private let isDisabled: Bool
    private let isLoading: Bool
    private let customLabel: (() -> AnyView)?
    
    public init(
        title: String,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        config: ButtonConfig = .init(),
        action: @escaping () -> Void
    ) {
        self.title = title
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.config = config
        self.action = action
        self.customLabel = nil
    }
    
    public init(
        isDisabled: Bool = false,
        isLoading: Bool = false,
        config: ButtonConfig = .init(),
        action: @escaping () -> Void,
        label: @escaping () -> some View
    ) {
        self.title = nil
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.config = config
        self.action = action
        self.customLabel = { AnyView(label()) }
    }
    
    public var body: some View {
        Button {
            guard !isDisabled && !isLoading else { return }
            action()
        } label: {
            ZStack {
                
                if isLoading {
                    ProgressView()
                        .tint(config.colors.text)
                } else {
                    content
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: config.height)
            .smartPadding(config.padding)
            .background(backgroundColor)
            .cornerRadius(config.cornerRadius)
        }
        .disabled(isDisabled || isLoading)
        .animation(.easeInOut(duration: 0.2), value: isLoading)
    }
    
    @ViewBuilder
    private var content: some View {
        if let customLabel {
            customLabel()
        } else if let title {
            Text(title)
                .foregroundColor(config.colors.text)
        }
    }
    
    private var backgroundColor: Color {
        if isDisabled {
            return config.colors.disabledBackground
        } else if isLoading {
            return config.colors.loadingBackground
        } else {
            return config.colors.background
        }
    }
}
