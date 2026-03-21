import Foundation

/// Ensures the text contains only numeric characters
public struct OnlyDigitsRule: ValidationRule {
    public let errorMessage: String?
    
    public init(errorMessage: String? = nil) {
        self.errorMessage = errorMessage
    }
    
    public func validate(_ text: String) -> ValidationResult {
        let isValid = !text.isEmpty && text.allSatisfy { $0.isNumber }
        return isValid ? .success : .failure(errorMessage)
    }
}

/// Ensures the text contains only alphabetic characters
public struct OnlyLettersRule: ValidationRule {
    public let errorMessage: String?
    
    public init(errorMessage: String? = nil) {
        self.errorMessage = errorMessage
    }
    
    public func validate(_ text: String) -> ValidationResult {
        let isValid = !text.isEmpty && text.allSatisfy { $0.isLetter }
        return isValid ? .success : .failure(errorMessage)
    }
}

/// Ensures the text meets a minimum length requirement
public struct MinLengthRule: ValidationRule {
    let min: Int
    public let errorMessage: String?
    
    public init(min: Int, errorMessage: String? = nil) {
        self.min = min
        self.errorMessage = errorMessage
    }
    
    public func validate(_ text: String) -> ValidationResult {
        return text.count >= min
            ? .success
            : .failure(errorMessage)
    }
}

/// Allows only letters and whitespace characters
public struct LettersAndSpacesRule: ValidationRule {
    public let errorMessage: String?
    
    public init(errorMessage: String? = nil) {
        self.errorMessage = errorMessage
    }
    
    public func validate(_ text: String) -> ValidationResult {
        let isValid = !text.isEmpty && text.allSatisfy {
            $0.isLetter || $0.isWhitespace
        }
        return isValid ? .success : .failure(errorMessage)
    }
}

/// Validates that the first character is uppercase
public struct StartsWithUppercaseRule: ValidationRule {
    public let errorMessage: String?
    
    public init(errorMessage: String? = nil) {
        self.errorMessage = errorMessage
    }
    
    public func validate(_ text: String) -> ValidationResult {
        guard let first = text.first else {
            return .failure(errorMessage)
        }
        
        return first.isUppercase
            ? .success
            : .failure(errorMessage)
    }
}

/// Disallows any special characters
public struct NoSpecialCharactersRule: ValidationRule {
    public let errorMessage: String?
    
    public init(errorMessage: String? = nil) {
        self.errorMessage = errorMessage
    }
    
    public func validate(_ text: String) -> ValidationResult {
        let isValid = text.allSatisfy {
            $0.isLetter || $0.isNumber
        }
        
        return isValid ? .success : .failure(errorMessage)
    }
}

/// Allows only letters and numbers
public struct AlphanumericRule: ValidationRule {
    public let errorMessage: String?
    
    public init(errorMessage: String? = nil) {
        self.errorMessage = errorMessage
    }
    
    public func validate(_ text: String) -> ValidationResult {
        let isValid = !text.isEmpty && text.allSatisfy {
            $0.isLetter || $0.isNumber
        }
        
        return isValid ? .success : .failure(errorMessage)
    }
}

/// Validates text using a regular expression pattern
public struct RegexRule: ValidationRule {
    let pattern: String
    public let errorMessage: String?
    
    public init(pattern: String, errorMessage: String? = nil) {
        self.pattern = pattern
        self.errorMessage = errorMessage
    }
    
    public func validate(_ text: String) -> ValidationResult {
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: text)
            ? .success
            : .failure(errorMessage)
    }
}

