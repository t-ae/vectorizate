import XCTest
import Vectorizate

class PowerTests: XCTestCase {
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
    
    func runTest2<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, UnsafePointer<F>, UnsafeMutablePointer<F>, Int)->Void,
        func2: (UnsafePointer<F>, UnsafePointer<F>, UnsafeMutablePointer<F>, Int)->Void,
        range: Range<F> = 0..<1,
        accuracy: F = 0,
        file: StaticString = #file, line: UInt = #line) where F.RawSignificand: FixedWidthInteger {
        
        let x: [F] = randomArray(count: count, in: range)
        let y: [F] = randomArray(count: count, in: range)
        var ans1 = [F](repeating: 0, count: count)
        var ans2 = [F](repeating: 0, count: count)
        
        func1(x, y, &ans1, count)
        func2(x, y, &ans2, count)
        
        XCTAssertEqual(ans1, ans2, accuracy: accuracy, file: file, line: line)
    }
    
    func testPow() {
        runTest2(type: Float.self, func1: VecOps.vpow, func2: VecOpsNoAccelerate.vpow, accuracy: 1e-4)
        runTest2(type: Double.self, func1: VecOps.vpow, func2: VecOpsNoAccelerate.vpow, accuracy: 1e-8)
    }
    
    func testPows() {
        runTest(type: Float.self,
                func1: { VecOps.vpows(base: $0, exponent: 2, out: $1, count: $2) },
                func2: { VecOpsNoAccelerate.vpows(base: $0, exponent: 2, out: $1, count: $2) },
                accuracy: 1e-4)
        runTest(type: Double.self,
                func1: { VecOps.vpows(base: $0, exponent: 2, out: $1, count: $2) },
                func2: { VecOpsNoAccelerate.vpows(base: $0, exponent: 2, out: $1, count: $2) },
                accuracy: 1e-8)
    }
    
    func testVSqrt() {
        runTest(type: Float.self, func1: VecOps.vsqrt, func2: VecOpsNoAccelerate.vsqrt)
        runTest(type: Double.self, func1: VecOps.vsqrt, func2: VecOpsNoAccelerate.vsqrt)
    }
    
    func testVRSqrt() {
        runTest(type: Float.self, func1: VecOps.vrsqrt, func2: VecOpsNoAccelerate.vrsqrt, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vrsqrt, func2: VecOpsNoAccelerate.vrsqrt)
    }
    
    func testVCbrt() {
        runTest(type: Float.self, func1: VecOps.vcbrt, func2: VecOpsNoAccelerate.vcbrt, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vcbrt, func2: VecOpsNoAccelerate.vcbrt, accuracy: 1e-8)
    }
}
