import XCTest

private func wrapper<T>(_ error: some Error) throws -> T {
    throw error
}

private func fatal<T>() -> T {
    fatalError()
}

// MARK: -
public func _XCTAssert(
    _ expression: @autoclosure () async throws -> Bool,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async {
    do {
        let expression = try await expression()
        XCTAssert(expression, message(), file: file, line: line)
    } catch {
        XCTAssert(try wrapper(error), message(), file: file, line: line)
    }
}

public func _XCTAssertEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async where T: Equatable {
    do {
        let expression1 = try await expression1()
        do {
            let expression2 = try await expression2()
            XCTAssertEqual(expression1, expression2, message(), file: file, line: line)
        } catch {
            XCTAssertEqual(expression1, try wrapper(error), message(), file: file, line: line)
        }
    } catch {
        XCTAssertEqual(try wrapper(error), fatalError(), message(), file: file, line: line)
    }
}

public func _XCTAssertEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async where T: FloatingPoint {
    do {
        let expression1 = try await expression1()
        do {
            let expression2 = try await expression2()
            XCTAssertEqual(expression1, expression2, accuracy: accuracy, message(), file: file, line: line)
        } catch {
            XCTAssertEqual(expression1, try wrapper(error), accuracy: accuracy, message(), file: file, line: line)
        }
    } catch {
        XCTAssertEqual(try wrapper(error), fatal(), accuracy: accuracy, message(), file: file, line: line)
    }
}

public func _XCTAssertEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async where T: Numeric {
    do {
        let expression1 = try await expression1()
        do {
            let expression2 = try await expression2()
            XCTAssertEqual(expression1, expression2, accuracy: accuracy, message(), file: file, line: line)
        } catch {
            XCTAssertEqual(expression1, try wrapper(error), accuracy: accuracy, message(), file: file, line: line)
        }
    } catch {
        XCTAssertEqual(try wrapper(error), fatal(), accuracy: accuracy, message(), file: file, line: line)
    }
}

public func _XCTAssertFalse(
    _ expression: @autoclosure () async throws -> Bool,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async {
    do {
        let expression = try await expression()
        XCTAssertFalse(expression, message(), file: file, line: line)
    } catch {
        XCTAssertFalse(try wrapper(error), message(), file: file, line: line)
    }
}

public func _XCTAssertGreaterThan<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async where T: Comparable {
    do {
        let expression1 = try await expression1()
        do {
            let expression2 = try await expression2()
            XCTAssertGreaterThan(expression1, expression2, message(), file: file, line: line)
        } catch {
            XCTAssertGreaterThan(expression1, try wrapper(error), message(), file: file, line: line)
        }
    } catch {
        XCTAssertGreaterThan(try wrapper(error), fatal() as T, message(), file: file, line: line)
    }
}

public func _XCTAssertGreaterThanOrEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async where T: Comparable {
    do {
        let expression1 = try await expression1()
        do {
            let expression2 = try await expression2()
            XCTAssertGreaterThanOrEqual(expression1, expression2, message(), file: file, line: line)
        } catch {
            XCTAssertGreaterThanOrEqual(expression1, try wrapper(error), message(), file: file, line: line)
        }
    } catch {
        XCTAssertGreaterThanOrEqual(try wrapper(error), fatal() as T, message(), file: file, line: line)
    }
}


public func _XCTAssertIdentical(
    _ expression1: @autoclosure () async throws -> AnyObject?,
    _ expression2: @autoclosure () async throws -> AnyObject?,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async {
    do {
        let expression1 = try await expression1()
        do {
            let expression2 = try await expression2()
            XCTAssertIdentical(expression1, expression2, message(), file: file, line: line)
        } catch {
            XCTAssertIdentical(expression1, try wrapper(error), message(), file: file, line: line)
        }
    } catch {
        XCTAssertIdentical(try wrapper(error), fatal(), message(), file: file, line: line)
    }
}

public func _XCTAssertLessThan<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async where T: Comparable {
    do {
        let expression1 = try await expression1()
        do {
            let expression2 = try await expression2()
            XCTAssertLessThan(expression1, expression2, message(), file: file, line: line)
        } catch {
            XCTAssertLessThan(expression1, try wrapper(error), message(), file: file, line: line)
        }
    } catch {
        XCTAssertLessThan(try wrapper(error), fatal() as T, message(), file: file, line: line)
    }
}

public func _XCTAssertLessThanOrEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async where T: Comparable {
    do {
        let expression1 = try await expression1()
        do {
            let expression2 = try await expression2()
            XCTAssertLessThanOrEqual(expression1, expression2, message(), file: file, line: line)
        } catch {
            XCTAssertLessThanOrEqual(expression1, try wrapper(error), message(), file: file, line: line)
        }
    } catch {
        XCTAssertLessThanOrEqual(try wrapper(error), fatal() as T, message(), file: file, line: line)
    }
}

public func _XCTAssertNil(
    _ expression: @autoclosure () async throws -> Any?,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async {
    do {
        let expression = try await expression()
        XCTAssertNil(expression, message(), file: file, line: line)
    } catch {
        XCTAssertNil(try wrapper(error), message(), file: file, line: line)
    }
}

public func _XCTAssertNoThrow<T>(
    _ expression: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async {
    do {
        let expression = try await expression()
        XCTAssertNoThrow(expression, message(), file: file, line: line)
    } catch {
        XCTAssertNoThrow(try wrapper(error) as T, message(), file: file, line: line)
    }
}

public func _XCTAssertNotEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async where T: Equatable {
    do {
        let expression1 = try await expression1()
        do {
            let expression2 = try await expression2()
            XCTAssertNotEqual(expression1, expression2, message(), file: file, line: line)
        } catch {
            XCTAssertNotEqual(expression1, try wrapper(error), message(), file: file, line: line)
        }
    } catch {
        XCTAssertNotEqual(try wrapper(error), fatalError(), message(), file: file, line: line)
    }
}

public func _XCTAssertNotEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    accuracy: T, _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async where T: FloatingPoint {
    do {
        let expression1 = try await expression1()
        do {
            let expression2 = try await expression2()
            XCTAssertNotEqual(expression1, expression2, accuracy: accuracy, message(), file: file, line: line)
        } catch {
            XCTAssertNotEqual(expression1, try wrapper(error), accuracy: accuracy, message(), file: file, line: line)
        }
    } catch {
        XCTAssertNotEqual(try wrapper(error), fatal(), accuracy: accuracy, message(), file: file, line: line)
    }
}

public func _XCTAssertNotEqual<T>(
    _ expression1: @autoclosure () async throws -> T,
    _ expression2: @autoclosure () async throws -> T,
    accuracy: T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async where T: Numeric {
    do {
        let expression1 = try await expression1()
        do {
            let expression2 = try await expression2()
            XCTAssertNotEqual(expression1, expression2, accuracy: accuracy, message(), file: file, line: line)
        } catch {
            XCTAssertNotEqual(expression1, try wrapper(error), accuracy: accuracy, message(), file: file, line: line)
        }
    } catch {
        XCTAssertNotEqual(try wrapper(error), fatal(), accuracy: accuracy, message(), file: file, line: line)
    }
}
public func _XCTAssertNotIdentical(
    _ expression1: @autoclosure () async throws -> AnyObject?,
    _ expression2: @autoclosure () async throws -> AnyObject?,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async {
    do {
        let expression1 = try await expression1()
        do {
            let expression2 = try await expression2()
            XCTAssertNotIdentical(expression1, expression2, message(), file: file, line: line)
        } catch {
            XCTAssertNotIdentical(expression1, try wrapper(error), message(), file: file, line: line)
        }
    } catch {
        XCTAssertNotIdentical(try wrapper(error), fatal(), message(), file: file, line: line)
    }
}

public func _XCTAssertNotNil(
    _ expression: @autoclosure () async throws -> Any?,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async {
    do {
        let expression = try await expression()
        XCTAssertNotNil(expression, message(), file: file, line: line)
    } catch {
        XCTAssertNotNil(try wrapper(error), message(), file: file, line: line)
    }
}

public func _XCTAssertThrowsError<T>(
    _ expression: @autoclosure () async throws -> T,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line,
    _ errorHandler: (_ error: Error) -> Void = { _ in }
) async {
    do {
        let expression = try await expression()
        XCTAssertThrowsError(expression, message(), file: file, line: line, errorHandler)
    } catch {
        XCTAssertThrowsError(try wrapper(error) as T, message(), file: file, line: line, errorHandler)
    }
}

public func _XCTAssertTrue(
    _ expression: @autoclosure () async throws -> Bool,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async {
    do {
        let expression = try await expression()
        XCTAssertTrue(expression, message(), file: file, line: line)
    } catch {
        XCTAssertTrue(try wrapper(error), message(), file: file, line: line)
    }
}

/// Evaluates a boolean expression and, if it is true, throws an error which
/// causes the current test to cease executing and be marked as skipped.
public func _XCTSkipIf(
    _ expression: @autoclosure () async throws -> Bool,
    _ message: @autoclosure () -> String? = nil,
    file: StaticString = #filePath, line: UInt = #line
) async throws {
    do {
        let expression = try await expression()
        try XCTSkipIf(expression, message(), file: file, line: line)
    } catch {
        try XCTSkipIf(try wrapper(error), message(), file: file, line: line)
    }
}

/// Evaluates a boolean expression and, if it is false, throws an error which
/// causes the current test to cease executing and be marked as skipped.
public func _XCTSkipUnless(
    _ expression: @autoclosure () async throws -> Bool,
    _ message: @autoclosure () -> String? = nil,
    file: StaticString = #filePath, line: UInt = #line
) async throws {
    do {
        let expression = try await expression()
        try XCTSkipUnless(expression, message(), file: file, line: line)
    } catch {
        try XCTSkipUnless(try wrapper(error), message(), file: file, line: line)
    }
}

/// Asserts that an expression is not `nil`, and returns its unwrapped value.
///
/// Generates a failure when `expression == nil`.
///
/// - Parameters:
///   - expression: An expression of type `T?` to compare against `nil`. Its type will determine the type of the returned value.
///   - message: An optional description of the failure.
///   - file: The file in which failure occurred. Defaults to the file name of the test case in which this function was called.
///   - line: The line number on which failure occurred. Defaults to the line number on which this function was called.
/// - Returns: A value of type `T`, the result of evaluating and unwrapping the given `expression`.
/// - Throws: An error when `expression == nil`. It will also rethrow any error thrown while evaluating the given expression.
public func _XCTUnwrap<T>(
    _ expression: @autoclosure () async throws -> T?,
    _ message: @autoclosure () -> String = "",
    file: StaticString = #filePath, line: UInt = #line
) async throws -> T {
    do {
        let expression = try await expression()
        return try XCTUnwrap(expression, message(), file: file, line: line)
    } catch {
        return try XCTUnwrap(try wrapper(error), message(), file: file, line: line)
    }
}
