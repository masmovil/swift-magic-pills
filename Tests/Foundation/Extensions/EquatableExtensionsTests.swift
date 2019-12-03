import XCTest
import Foundation
import MagicPills

class EquatableExtensionsTests: XCTestCase {
    func test_isoneof() {
        let something = "hola"

        XCTAssertTrue(something.isOneOf("hola", "chau"))
        XCTAssertFalse(something.isOneOf("kjj"))
    }
}
