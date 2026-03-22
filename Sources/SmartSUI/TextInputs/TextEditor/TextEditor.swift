import SwiftUI

public struct SmartTextEditor: View {
    @Binding private var text: String
    @State private var isFocused = false
    @State private var error: String?
    
    private let config: TextEditorConfig
    private let height: CGFloat
    
    public init(
        text: Binding<String>,
        config: TextEditorConfig,
        height: CGFloat = 120
    ) {
        self._text = text
        self.config = config
        self.height = height
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(config.placeholder)
                        .font(config.font)
                        .foregroundColor(config.colors.placeholder)
                        .smartPadding(config.padding.placeholder)
                }
                
                TextEditor(text: $text)
                    .font(config.font)
                    .onTapGesture {
                        isFocused = true
                    }
                    .onChange(of: text) { _ in
                        applyMaxLength()
                        validate()
                    }
                    .smartBackgroundFix(.clear)
                    .smartPadding(config.padding.textField)
                    .smartRounded(config.rounded)
                    .smartStroke(config.stroke, color: borderColor)
                    .frame(height: height)
            }
            
            if let error {
                Text(error)
                    .font(config.font)
                    .foregroundColor(config.colors.error)
                    .smartPadding(config.padding.error)
            }
        }
    }
    
    private var borderColor: Color {
        if error != nil {
            return config.colors.error
        } else if isFocused {
            return config.colors.focused
        } else {
            return config.colors.border
        }
    }
    
    private func applyMaxLength() {
        guard let maxLength = config.maxLength else { return }
        if text.count > maxLength {
            text = String(text.prefix(maxLength))
        }
    }
    
    private func validate() {
        for rule in config.rules {
            if case .failure(let message) = rule.validate(text) {
                error = message
                return
            }
        }
        error = nil
    }
}
