public protocol ValidationRule {
    var errorMessage: String? { get }
    func validate(_ text: String) -> ValidationResult
}

public struct MinLengthRule: ValidationRule {
    let min: Int
    public var errorMessage: String? = nil
    
    public func validate(_ text: String) -> ValidationResult {
        return text.count >= min
            ? .success
            : .failure(errorMessage)
    }
}
