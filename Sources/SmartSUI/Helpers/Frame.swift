import SwiftUI

public struct Size {
    let width: CGFloat
    let height: CGFloat
    
    public init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    public init(all: CGFloat) {
        self.width = all
        self.height = all
    }
}
