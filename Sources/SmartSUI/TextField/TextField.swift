import SwiftUI

public struct SmartTextField: View {
    @Binding private var text: String
    @State private var isFocused = false
    @State private var error: String?
    private let config: TextFieldConfig
    
    public init(text: Binding<String>, config: TextFieldConfig) {
        self._text = text
        self.config = config
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                ForEach(config.icons, id: \.id) { icon in
                    makeIconView(icon: icon, locaion: .left)
                        .visibleIf(icon.isVisible(textIsEmpty: text.isEmpty))
                }
                
                TextField(
                    config.placeholder,
                    text: $text,
                    onEditingChanged: { focused in
                        isFocused = focused
                        validate()
                    }
                )
                .font(config.font)
                .foregroundColor(config.colors.text)
                .onChange(of: text) { newValue in
                    applyMaxLength()
                    validate()
                }
                .smartPadding(config.padding.textField)
                .smartRounded(config.rounded)
                .smartStroke(config.stroke, color: borderColor)
                .frame(maxWidth: .infinity)
                
                ForEach(config.icons, id: \.id) { icon in
                    makeIconView(icon: icon, locaion: .right)
                        .visibleIf(icon.isVisible(textIsEmpty: text.isEmpty))
                }
            }
            
            if let error {
                Text(error)
                    .font(config.font)
                    .foregroundColor(config.colors.errorBorder)
                    .smartPadding(config.padding.error)
            }
        }
    }
    
    private var borderColor: Color {
        if error != nil {
            return config.colors.errorBorder
        } else if isFocused {
            return config.colors.focusedBorder
        } else {
            return config.colors.border
        }
    }
    
    @ViewBuilder
    private func makeIconView(icon: TextFieldConfig.Icon, locaion: TextFieldConfig.Icon.Aligment) -> some View {
        if locaion == icon.location {
            if let acion = icon.action {
                Button {
                    switch acion {
                    case .clear:
                        text = ""
                        isFocused = false
                    case .custom(let void):
                        void()
                    }
                } label: {
                    makeImage(image: icon.icon, size: icon.size, padding: icon.padding)
                }
            } else {
                makeImage(image: icon.icon, size: icon.size, padding: icon.padding)
            }
        }
    }
    
    private func makeImage(image: Image, size: Size, padding: SmartPaddingStyleModifier.Padding) -> some View {
        image
            .resizable()
            .size(size)
            .smartPadding(padding)
    }
    
    private func applyMaxLength() {
        guard let maxLength = config.maxLength else {
            return
        }
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
