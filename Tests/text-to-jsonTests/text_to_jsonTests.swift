import XCTest
@testable import text_to_json

final class text_to_jsonTests: XCTestCase {
    func testExample() throws {

        let result = generate_steps(from: "hihi")
        print("Get this resulted json:")
        print(result)
        
    }
}
