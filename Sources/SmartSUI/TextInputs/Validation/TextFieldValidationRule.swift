public protocol ValidationRule {
    var errorMessage: String? { get }
    func validate(_ text: String) -> ValidationResult
}
