import XCTest
import Vectorizate

class RoundTests: XCTestCase {
    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, UnsafeMutablePointer<F>, Int)->Void,
        func2: (UnsafePointer<F>, UnsafeMutablePointer<F>, Int)->Void,
        file: StaticString = #file, line: UInt = #line) where F.RawSignificand: FixedWidthInteger {
        
        let x: [F] = stride(from: -2, to: -2, by: 0.1).map { F($0) }
        var ans1 = [F](repeating: 0, count: x.count)
        var ans2 = [F](repeating: 0, count: x.count)
        
        func1(x, &ans1, x.count)
        func2(x, &ans2, x.count)
        
        XCTAssertEqual(ans1, ans2, file: file, line: line)
    }
    
    func testVCeil() {
        runTest(type: Float.self, func1: VecOps.vceil, func2: VecOpsNoAccelerate.vceil)
        runTest(type: Double.self, func1: VecOps.vceil, func2: VecOpsNoAccelerate.vceil)
    }
    
    func testVFloor() {
        runTest(type: Float.self, func1: VecOps.vfloor, func2: VecOpsNoAccelerate.vfloor)
        runTest(type: Double.self, func1: VecOps.vfloor, func2: VecOpsNoAccelerate.vfloor)
    }
    
    func testVInt() {
        runTest(type: Float.self, func1: VecOps.vint, func2: VecOpsNoAccelerate.vint)
        runTest(type: Double.self, func1: VecOps.vint, func2: VecOpsNoAccelerate.vint)
    }
    
    func testVNInt() {
        runTest(type: Float.self, func1: VecOps.vnint, func2: VecOpsNoAccelerate.vnint)
        runTest(type: Double.self, func1: VecOps.vnint, func2: VecOpsNoAccelerate.vnint)
    }
}
