import XCTest
import Vectorizate

class HyperbolicTests: XCTestCase {
    
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
    
    func testSinh() {
        runTest(type: Float.self, func1: VecOps.sinh, func2: VecOpsNoAccelerate.sinh, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.sinh, func2: VecOpsNoAccelerate.sinh, accuracy: 1e-8)
    }
    
    func testCosh() {
        runTest(type: Float.self, func1: VecOps.cosh, func2: VecOpsNoAccelerate.cosh, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.cosh, func2: VecOpsNoAccelerate.cosh, accuracy: 1e-8)
    }
    
    func testTanh() {
        runTest(type: Float.self, func1: VecOps.tanh, func2: VecOpsNoAccelerate.tanh, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.tanh, func2: VecOpsNoAccelerate.tanh, accuracy: 1e-8)
    }
    
    func testASinh() {
        runTest(type: Float.self, func1: VecOps.asinh, func2: VecOpsNoAccelerate.asinh, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.asinh, func2: VecOpsNoAccelerate.asinh, accuracy: 1e-8)
    }
    
    func testACosh() {
        runTest(type: Float.self, func1: VecOps.acosh, func2: VecOpsNoAccelerate.acosh, range: 1..<Float.pi, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.acosh, func2: VecOpsNoAccelerate.acosh, range: 1..<Double.pi, accuracy: 1e-8)
    }
    
    func testATanh() {
        runTest(type: Float.self, func1: VecOps.atanh, func2: VecOpsNoAccelerate.atanh, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.atanh, func2: VecOpsNoAccelerate.atanh, accuracy: 1e-8)
    }

}
