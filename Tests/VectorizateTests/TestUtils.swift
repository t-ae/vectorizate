import XCTest

func randomArray<F: BinaryFloatingPoint>(count: Int, in range: Range<F>) -> [F]
    where F.RawSignificand: FixedWidthInteger {
        return (0..<count).map { _ in F.random(in: range) }
}

func XCTAssertEqual<F: FloatingPoint>(_ array1: [F],
                                      _ array2: [F],
                                      accuracy: F,
                                      file: StaticString = #file,
                                      line: UInt = #line) {
    XCTAssertEqual(array1.count, array2.count, file: file, line: line)
    
    for (e1, e2) in zip(array1, array2) {
        XCTAssertEqual(e1, e2, accuracy: accuracy, file: file, line: line)
    }
}
