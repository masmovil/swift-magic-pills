import Foundation

public extension Equatable {

    /// Check if the instance is equal to one of given values
    func isOneOf(_ types: [Self]) -> Bool {
        return types.contains(self)
    }

    /// Check if the instance is equal to one of given values
    func isOneOf(_ types: Self...) -> Bool {
        return self.isOneOf(types)
    }
}
