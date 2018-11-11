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
    
    func testVExp() {
        runTest(type: Float.self, func1: VecOps.vexp, func2: VecOpsNoAccelerate.vexp, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.vexp, func2: VecOpsNoAccelerate.vexp, accuracy: 1e-12)
    }
    
    func testVExp2() {
        runTest(type: Float.self, func1: VecOps.vexp2, func2: VecOpsNoAccelerate.vexp2, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.vexp2, func2: VecOpsNoAccelerate.vexp2, accuracy: 1e-12)
    }
    
    func testVExpm1() {
        runTest(type: Float.self, func1: VecOps.vexpm1, func2: VecOpsNoAccelerate.vexpm1, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.vexpm1, func2: VecOpsNoAccelerate.vexpm1, accuracy: 1e-12)
    }
    
    func testVLog() {
        runTest(type: Float.self, func1: VecOps.vlog, func2: VecOpsNoAccelerate.vlog, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.vlog, func2: VecOpsNoAccelerate.vlog, accuracy: 1e-12)
    }
    
    func testVLog1p() {
        runTest(type: Float.self, func1: VecOps.vlog1p, func2: VecOpsNoAccelerate.vlog1p, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.vlog1p, func2: VecOpsNoAccelerate.vlog1p, accuracy: 1e-12)
    }
    
    func testVLog2() {
        runTest(type: Float.self, func1: VecOps.vlog2, func2: VecOpsNoAccelerate.vlog2, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.vlog2, func2: VecOpsNoAccelerate.vlog2, accuracy: 1e-12)
    }
    
    func testVLog10() {
        runTest(type: Float.self, func1: VecOps.vlog10, func2: VecOpsNoAccelerate.vlog10, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.vlog10, func2: VecOpsNoAccelerate.vlog10, accuracy: 1e-12)
    }
    
    func testVLogb() {
        runTest(type: Float.self, func1: VecOps.vlogb, func2: VecOpsNoAccelerate.vlogb, accuracy: 1e-6)
        runTest(type: Double.self, func1: VecOps.vlogb, func2: VecOpsNoAccelerate.vlogb, accuracy: 1e-12)
    }
}
