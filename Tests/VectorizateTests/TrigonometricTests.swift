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
        runTest(type: Float.self, func1: VecOps.sin, func2: VecOpsNoAccelerate.sin, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.sin, func2: VecOpsNoAccelerate.sin, accuracy: 1e-8)
        
        runTest(type: Float.self, func1: VecOps.sinpi, func2: VecOpsNoAccelerate.sinpi, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.sinpi, func2: VecOpsNoAccelerate.sinpi, accuracy: 1e-8)
    }
    
    func testCos() {
        runTest(type: Float.self, func1: VecOps.cos, func2: VecOpsNoAccelerate.cos, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.cos, func2: VecOpsNoAccelerate.cos, accuracy: 1e-8)
        
        runTest(type: Float.self, func1: VecOps.cospi, func2: VecOpsNoAccelerate.cospi, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.cospi, func2: VecOpsNoAccelerate.cospi, accuracy: 1e-8)
    }
    
    func testTan() {
        runTest(type: Float.self, func1: VecOps.tan, func2: VecOpsNoAccelerate.tan, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.tan, func2: VecOpsNoAccelerate.tan, accuracy: 1e-8)
        
        runTest(type: Float.self, func1: VecOps.tanpi, func2: VecOpsNoAccelerate.tanpi, range: 0..<0.3, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.tanpi, func2: VecOpsNoAccelerate.tanpi, range: 0..<0.9, accuracy: 1e-8)
    }
    
    func testASin() {
        runTest(type: Float.self, func1: VecOps.asin, func2: VecOpsNoAccelerate.asin, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.asin, func2: VecOpsNoAccelerate.asin, accuracy: 1e-8)
    }
    
    func testACos() {
        runTest(type: Float.self, func1: VecOps.acos, func2: VecOpsNoAccelerate.acos, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.acos, func2: VecOpsNoAccelerate.acos, accuracy: 1e-8)
    }
    
    func testATan() {
        runTest(type: Float.self, func1: VecOps.atan, func2: VecOpsNoAccelerate.atan, range: 0..<0.9, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.atan, func2: VecOpsNoAccelerate.atan, range: 0..<0.9, accuracy: 1e-8)
    }
    
    func testATan2() {
        do {
            typealias F = Float
            let x: [F] = randomArray(count: count, in: 0..<1)
            let y: [F] = randomArray(count: count, in: 0..<1)
            
            var ans1 = [F](repeating: 0, count: count)
            var ans2 = [F](repeating: 0, count: count)
            
            VecOps.atan2(y: y, x: x, out: &ans1, count: count)
            VecOpsNoAccelerate.atan2(y: y, x: x, out: &ans2, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-6)
        }
        do {
            typealias F = Double
            let x: [F] = randomArray(count: count, in: 0..<1)
            let y: [F] = randomArray(count: count, in: 0..<1)
            
            var ans1 = [F](repeating: 0, count: count)
            var ans2 = [F](repeating: 0, count: count)
            
            VecOps.atan2(y: y, x: x, out: &ans1, count: count)
            VecOpsNoAccelerate.atan2(y: y, x: x, out: &ans2, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-12)
        }
    }
}
