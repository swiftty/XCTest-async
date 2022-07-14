import XCTest
@testable import XCTestAsync

private func bool() async -> Bool {
    true
}

private func error<T>() async throws -> T {
    throw NSError(domain: "", code: 0)
}

final class XCTestAsyncTests: XCTestCase {
    func test_methods() async {
        await _XCTAssert(await bool())
        await _XCTAssertEqual(1, 1)
        await _XCTAssertEqual(1.1, 1.1, accuracy: 0.1)
        await _XCTAssertFalse(await !bool())
        await _XCTAssertGreaterThan(1, 0)
        await _XCTAssertGreaterThanOrEqual(1, 1)

        let obj = NSObject()
        await _XCTAssertIdentical(obj, obj)

        await _XCTAssertLessThan(0, 1)
        await _XCTAssertLessThanOrEqual(1, 1)

        await _XCTAssertNil(nil)
        await _XCTAssertNoThrow(1)

        await _XCTAssertNotEqual(1, 0)
        await _XCTAssertNotEqual(1, 0, accuracy: 0.1)

        await _XCTAssertNotIdentical(NSObject(), NSObject())

        await _XCTAssertNotNil(await bool())

        await _XCTAssertThrowsError(try await error() as String)

        await _XCTAssertTrue(await bool())

        do {
            let value = try await _XCTUnwrap(await bool())
            XCTAssertEqual(value, true)
        } catch {
            XCTFail()
        }
    }
}
