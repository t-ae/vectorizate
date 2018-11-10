import XCTest
import Vectorizate

class ExponentialTests: XCTestCase {

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
    
    func testExp() {
        runTest(type: Float.self, func1: VecOps.exp, func2: VecOpsNoAccelerate.exp, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.exp, func2: VecOpsNoAccelerate.exp, accuracy: 1e-12)
    }
    
    func testExp2() {
        runTest(type: Float.self, func1: VecOps.exp2, func2: VecOpsNoAccelerate.exp2, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.exp2, func2: VecOpsNoAccelerate.exp2, accuracy: 1e-12)
    }
    
    func testExpm1() {
        runTest(type: Float.self, func1: VecOps.expm1, func2: VecOpsNoAccelerate.expm1, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.expm1, func2: VecOpsNoAccelerate.expm1, accuracy: 1e-12)
    }
    
    func testLog() {
        runTest(type: Float.self, func1: VecOps.log, func2: VecOpsNoAccelerate.log, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.log, func2: VecOpsNoAccelerate.log, accuracy: 1e-12)
    }
    
    func testLog1p() {
        runTest(type: Float.self, func1: VecOps.log1p, func2: VecOpsNoAccelerate.log1p, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.log1p, func2: VecOpsNoAccelerate.log1p, accuracy: 1e-12)
    }
    
    func testLog2() {
        runTest(type: Float.self, func1: VecOps.log2, func2: VecOpsNoAccelerate.log2, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.log2, func2: VecOpsNoAccelerate.log2, accuracy: 1e-12)
    }
    
    func testLog10() {
        runTest(type: Float.self, func1: VecOps.log10, func2: VecOpsNoAccelerate.log10, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.log10, func2: VecOpsNoAccelerate.log10, accuracy: 1e-12)
    }
    
    func testLogb() {
        runTest(type: Float.self, func1: VecOps.logb, func2: VecOpsNoAccelerate.logb, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.logb, func2: VecOpsNoAccelerate.logb, accuracy: 1e-12)
    }
}
