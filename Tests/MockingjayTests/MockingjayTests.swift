import XCTest
import Runtime
@testable import Mockingjay

final class MockingjayTests: XCTestCase {
    struct Cat: Codable, Equatable {
        let age: Int
        let name: String
        let speed: Double
        let children: [CatChild]
        let parent: CatParent

        enum CatChild: String, Codable {
            case one
            case two
            case three
        }
    }

    struct CatParent: Codable, Equatable {
        let parentId: String
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let mock: Cat? = try Mockingjay.mock()
        XCTAssertNotNil(mock)
    }
}
