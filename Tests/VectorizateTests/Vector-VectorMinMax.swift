import XCTest
import  Vectorizate

class Vector_VectorMinMax: XCTestCase {
    
    let count = 100
    
    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, Int, UnsafePointer<F>, Int, UnsafeMutablePointer<F>, Int, Int)->Void,
        func2: (UnsafePointer<F>, Int, UnsafePointer<F>, Int, UnsafeMutablePointer<F>, Int, Int)->Void,
        ia: Int, ib: Int, iOut: Int,
        accuracy: F = 0,
        file: StaticString = #file, line: UInt = #line) {
        
        let a = stride(from: -0.5, to: 1, by: 0.1).map { F($0) }
        let b: [F] = a.reversed()
        
        let count = a.count / max(ia, ib)
        var ans1 = [F](repeating: 0, count: count*iOut)
        var ans2 = [F](repeating: 0, count: count*iOut)
        
        func1(a, ia, b, ib, &ans1, iOut, count)
        func2(a, ia, b, ib, &ans2, iOut, count)
        
        XCTAssertEqual(ans1, ans2, file: file, line: line)
    }
    
    func testVMin() {
        runTest(type: Float.self, func1: VecOps.vmin, func2: VecOpsNoAccelerate.vmin, ia: 1, ib: 1, iOut: 1)
        runTest(type: Float.self, func1: VecOps.vmin, func2: VecOpsNoAccelerate.vmin, ia: 2, ib: 3, iOut: 5)
        
        runTest(type: Double.self, func1: VecOps.vmin, func2: VecOpsNoAccelerate.vmin, ia: 1, ib: 1, iOut: 1)
        runTest(type: Double.self, func1: VecOps.vmin, func2: VecOpsNoAccelerate.vmin, ia: 2, ib: 3, iOut: 5)
    }
    
    func testVMinMg() {
        runTest(type: Float.self, func1: VecOps.vminmg, func2: VecOpsNoAccelerate.vminmg, ia: 1, ib: 1, iOut: 1)
        runTest(type: Float.self, func1: VecOps.vminmg, func2: VecOpsNoAccelerate.vminmg, ia: 2, ib: 3, iOut: 5)
        
        runTest(type: Double.self, func1: VecOps.vminmg, func2: VecOpsNoAccelerate.vminmg, ia: 1, ib: 1, iOut: 1)
        runTest(type: Double.self, func1: VecOps.vminmg, func2: VecOpsNoAccelerate.vminmg, ia: 2, ib: 3, iOut: 5)
    }
    
    func testVMax() {
        runTest(type: Float.self, func1: VecOps.vmax, func2: VecOpsNoAccelerate.vmax, ia: 1, ib: 1, iOut: 1)
        runTest(type: Float.self, func1: VecOps.vmax, func2: VecOpsNoAccelerate.vmax, ia: 2, ib: 3, iOut: 5)
        
        runTest(type: Double.self, func1: VecOps.vmax, func2: VecOpsNoAccelerate.vmax, ia: 1, ib: 1, iOut: 1)
        runTest(type: Double.self, func1: VecOps.vmax, func2: VecOpsNoAccelerate.vmax, ia: 2, ib: 3, iOut: 5)
    }
    
    func testVMaxMg() {
        runTest(type: Float.self, func1: VecOps.vmaxmg, func2: VecOpsNoAccelerate.vmaxmg, ia: 1, ib: 1, iOut: 1)
        runTest(type: Float.self, func1: VecOps.vmaxmg, func2: VecOpsNoAccelerate.vmaxmg, ia: 2, ib: 3, iOut: 5)
        
        runTest(type: Double.self, func1: VecOps.vmaxmg, func2: VecOpsNoAccelerate.vmaxmg, ia: 1, ib: 1, iOut: 1)
        runTest(type: Double.self, func1: VecOps.vmaxmg, func2: VecOpsNoAccelerate.vmaxmg, ia: 2, ib: 3, iOut: 5)
    }
}
