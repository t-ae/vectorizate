import XCTest
import Vectorizate

class GatherTests: XCTestCase {

    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, UnsafePointer<UInt>, Int, UnsafeMutablePointer<F>, Int, Int)->Void,
        func2: (UnsafePointer<F>, UnsafePointer<UInt>, Int, UnsafeMutablePointer<F>, Int, Int)->Void,
        ib: Int, iOut: Int,
        file: StaticString = #file, line: UInt = #line) {
        
        let a = stride(from: -0.5, to: 1, by: 0.1).map { F($0) }
        let b = (0..<a.count).map { _ in UInt.random(in: 1...UInt(a.count)) }
        
        let count = a.count / ib
        var ans1 = [F](repeating: 0, count: count*iOut)
        var ans2 = [F](repeating: 0, count: count*iOut)
        
        func1(a, b, ib, &ans1, iOut, count)
        func2(a, b, ib, &ans2, iOut, count)
        
        XCTAssertEqual(ans1, ans2, file: file, line: line)
    }
    
    func testVGathr() {
        runTest(type: Float.self, func1: VecOps.vgathr, func2: VecOpsNoAccelerate.vgathr, ib: 1, iOut: 1)
        runTest(type: Float.self, func1: VecOps.vgathr, func2: VecOpsNoAccelerate.vgathr, ib: 2, iOut: 3)
        
        runTest(type: Double.self, func1: VecOps.vgathr, func2: VecOpsNoAccelerate.vgathr, ib: 1, iOut: 1)
        runTest(type: Double.self, func1: VecOps.vgathr, func2: VecOpsNoAccelerate.vgathr, ib: 2, iOut: 3)
    }
}
