import XCTest
import Vectorizate

class TrigonometricTests: XCTestCase {
    
    let count = 100

    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, UnsafeMutablePointer<F>, Int)->Void,
        func2: (UnsafePointer<F>, UnsafeMutablePointer<F>, Int)->Void,
        range: Range<F> = 0..<1,
        accuracy: F = 0,
        file: StaticString = #file, line: UInt = #line) where F.RawSignificand: FixedWidthInteger {
        
        let x: [F] = randomArray(count: count, in: range)
        var ans1 = [F](repeating: 0, count: count)
        var ans2 = [F](repeating: 0, count: count)
        
        func1(x, &ans1, count)
        func2(x, &ans2, count)
        
        XCTAssertEqual(ans1, ans2, accuracy: accuracy, file: file, line: line)
    }

    func testSin() {
        runTest(type: Float.self, func1: Vectorizate.sin, func2: VectorizateNoAccelerate.sin, accuracy: 1e-4)
        runTest(type: Double.self, func1: Vectorizate.sin, func2: VectorizateNoAccelerate.sin, accuracy: 1e-8)
    }
    
    func testCos() {
        runTest(type: Float.self, func1: Vectorizate.cos, func2: VectorizateNoAccelerate.cos, accuracy: 1e-4)
        runTest(type: Double.self, func1: Vectorizate.cos, func2: VectorizateNoAccelerate.cos, accuracy: 1e-8)
    }
    
    func testTan() {
        runTest(type: Float.self, func1: Vectorizate.tan, func2: VectorizateNoAccelerate.tan, accuracy: 1e-4)
        runTest(type: Double.self, func1: Vectorizate.tan, func2: VectorizateNoAccelerate.tan, accuracy: 1e-8)
    }
    
    func testASin() {
        runTest(type: Float.self, func1: Vectorizate.asin, func2: VectorizateNoAccelerate.asin, accuracy: 1e-4)
        runTest(type: Double.self, func1: Vectorizate.asin, func2: VectorizateNoAccelerate.asin, accuracy: 1e-8)
    }
    
    func testACos() {
        runTest(type: Float.self, func1: Vectorizate.acos, func2: VectorizateNoAccelerate.acos, accuracy: 1e-4)
        runTest(type: Double.self, func1: Vectorizate.acos, func2: VectorizateNoAccelerate.acos, accuracy: 1e-8)
    }
    
    func testATan() {
        runTest(type: Float.self, func1: Vectorizate.atan, func2: VectorizateNoAccelerate.atan, accuracy: 1e-4)
        runTest(type: Double.self, func1: Vectorizate.atan, func2: VectorizateNoAccelerate.atan, accuracy: 1e-8)
    }
    
    func testATan2() {
        do {
            typealias F = Float
            let x: [F] = randomArray(count: count, in: 0..<1)
            let y: [F] = randomArray(count: count, in: 0..<1)
            
            var ans1 = [F](repeating: 0, count: count)
            var ans2 = [F](repeating: 0, count: count)
            
            Vectorizate.atan2(y: y, x: x, out: &ans1, count: count)
            VectorizateNoAccelerate.atan2(y: y, x: x, out: &ans2, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-6)
        }
        do {
            typealias F = Double
            let x: [F] = randomArray(count: count, in: 0..<1)
            let y: [F] = randomArray(count: count, in: 0..<1)
            
            var ans1 = [F](repeating: 0, count: count)
            var ans2 = [F](repeating: 0, count: count)
            
            Vectorizate.atan2(y: y, x: x, out: &ans1, count: count)
            VectorizateNoAccelerate.atan2(y: y, x: x, out: &ans2, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-12)
        }
    }
}
