import Foundation

/// Type erasure for optional
public protocol OptionalType {
    associatedtype Wrapped
    var wrapped: Wrapped? { get }
}

extension Optional: OptionalType {
    /// Return himselft value as a optional
    public var wrapped: Wrapped? {
        return self
    }
}

public extension Sequence where Iterator.Element: OptionalType {
    /// Remove all the nullable values inside a nullable values array.
    ///
    /// - Returns: A Collection without null values.
    var filterNil: [Iterator.Element.Wrapped] {
        return compactMap { $0.wrapped }
    }

    @available(*, deprecated, renamed: "filterNil")
    var filterNils: [Iterator.Element.Wrapped] {
        return filterNil
    }
}

/// Return nil if any of his components is nil
public func unwrapTuple<A, B>(first: A?, second: B?) -> (A, B)? {
    return first.flatMap { firstUnwrapped -> (A, B)? in
        second.flatMap { secondUnwrapped -> (A, B)? in
            return (firstUnwrapped, secondUnwrapped)
        }
    }
}

/// Return nil if any of his components is nil
// swiftlint:disable large_tuple
public func unwrapTuple<A, B, C>(first: A?, second: B?, third: C?) -> (A, B, C)? {
    return first.flatMap { firstUnwraped -> (A, B, C)? in
        second.flatMap { secondUnwrapped -> (A, B, C)? in
            third.flatMap { thirdUnwrapped -> (A, B, C)? in
                return (firstUnwraped, secondUnwrapped, thirdUnwrapped)
            }
        }
    }
}

/// Return nil if any of his components is nil
// swiftlint:disable large_tuple
public func unwrapTuple<A, B, C, D>(first: A?, second: B?, third: C?, fourth: D?) -> (A, B, C, D)? {
    return first.flatMap { firstUnwraped -> (A, B, C, D)? in
        second.flatMap { secondUnwrapped -> (A, B, C, D)? in
            third.flatMap { thirdUnwrapped -> (A, B, C, D)? in
                fourth.flatMap { fourthUnwrapped -> (A, B, C, D)? in
                    return (firstUnwraped, secondUnwrapped, thirdUnwrapped, fourthUnwrapped)
                }
            }
        }
    }
}
