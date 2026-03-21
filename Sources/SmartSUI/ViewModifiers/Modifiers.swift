import SwiftUI

public extension View {
    @ViewBuilder
    func visibleIf(_ isVisible: Bool) -> some View {
        if isVisible {
            self
        }
    }
    
    func hiddenIf(_ isHidden: Bool) -> some View {
        self.opacity(isHidden ? 0 : 1)
    }
    
    func fullWidth(alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func fullSize(alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
    
    func onTap(_ action: @escaping () -> Void) -> some View {
        contentShape(Rectangle())
            .onTapGesture(perform: action)
    }
    
    func hideKeyboardOnTap() -> some View {
        onTap {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
        }
    }
    
    func size(_ value: Size) -> some View {
        frame(width: value.width, height: value.height)
    }
    
    func hitArea(_ insets: CGFloat) -> some View {
        contentShape(Rectangle())
            .padding(insets)
    }
}
