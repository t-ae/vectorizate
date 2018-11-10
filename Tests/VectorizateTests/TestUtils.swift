import XCTest

func randomArray(count: Int, in range: Range<Float>) -> [Float] {
    return (0..<count).map { _ in Float.random(in: range) }
}

func randomArray(count: Int, in range: Range<Double>) -> [Double] {
    return (0..<count).map { _ in Double.random(in: range) }
}

func XCTAssertEqual(_ array1: [Float],
                    _ array2: [Float],
                    accuracy: Float,
                    file: StaticString = #file,
                    line: UInt = #line) {
    XCTAssertEqual(array1.count, array2.count, file: file, line: line)
    
    for (e1, e2) in zip(array1, array2) {
        XCTAssertEqual(e1, e2, accuracy: accuracy, file: file, line: line)
    }
}

func XCTAssertEqual(_ array1: [Double],
                    _ array2: [Double],
                    accuracy: Double,
                    file: StaticString = #file,
                    line: UInt = #line) {
    XCTAssertEqual(array1.count, array2.count, file: file, line: line)
    
    for (e1, e2) in zip(array1, array2) {
        XCTAssertEqual(e1, e2, accuracy: accuracy, file: file, line: line)
    }
}
