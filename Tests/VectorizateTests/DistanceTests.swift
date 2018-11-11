import XCTest
import Vectorizate

class DistanceTests: XCTestCase {
    let count = 100
    
    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, Int, UnsafePointer<F>, Int, UnsafeMutablePointer<F>, Int, Int)->Void,
        func2: (UnsafePointer<F>, Int, UnsafePointer<F>, Int, UnsafeMutablePointer<F>, Int, Int)->Void,
        ia: Int, ib: Int, iOut: Int,
        range: Range<F> = 0..<1,
        accuracy: F = 0,
        file: StaticString = #file, line: UInt = #line) where F.RawSignificand: FixedWidthInteger {
        
        let a: [F] = randomArray(count: ia*count, in: range)
        let b: [F] = randomArray(count: ib*count, in: range)
        var ans1 = [F](repeating: 0, count: iOut*count)
        var ans2 = [F](repeating: 0, count: iOut*count)
        
        func1(a, ia, b, ib, &ans1, iOut, count)
        func2(a, ia, b, ib, &ans2, iOut, count)
        
        XCTAssertEqual(ans1, ans2, accuracy: accuracy, file: file, line: line)
    }
    
    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, Int, UnsafePointer<F>, Int, inout F, Int)->Void,
        func2: (UnsafePointer<F>, Int, UnsafePointer<F>, Int, inout F, Int)->Void,
        ia: Int, ib: Int,
        range: Range<F> = 0..<1,
        accuracy: F = 0,
        file: StaticString = #file, line: UInt = #line) where F.RawSignificand: FixedWidthInteger {
        
        let a: [F] = randomArray(count: ia*count, in: range)
        let b: [F] = randomArray(count: ib*count, in: range)
        var ans1: F = 0
        var ans2: F = 0
        
        func1(a, ia, b, ib, &ans1, count)
        func2(a, ia, b, ib, &ans2, count)
        
        XCTAssertEqual(ans1, ans2, accuracy: accuracy, file: file, line: line)
    }
    
    func testVDist() {
        runTest(type: Float.self, func1: VecOps.vdist, func2: VecOpsNoAccelerate.vdist,
                ia: 1, ib: 1, iOut: 1, accuracy: 1e-4)
        runTest(type: Float.self, func1: VecOps.vdist, func2: VecOpsNoAccelerate.vdist,
                ia: 2, ib: 3, iOut: 5, accuracy: 1e-4)
        
        runTest(type: Double.self, func1: VecOps.vdist, func2: VecOpsNoAccelerate.vdist,
                ia: 1, ib: 1, iOut: 1, accuracy: 1e-4)
        runTest(type: Float.self, func1: VecOps.vdist, func2: VecOpsNoAccelerate.vdist,
                ia: 2, ib: 3, iOut: 5, accuracy: 1e-4)
    }
    
    func testDistancesq(){
        runTest(type: Float.self, func1: VecOps.distancesq, func2: VecOpsNoAccelerate.distancesq,
                ia: 1, ib: 1, accuracy: 1e-4)
        runTest(type: Float.self, func1: VecOps.distancesq, func2: VecOpsNoAccelerate.distancesq,
                ia: 2, ib: 3, accuracy: 1e-4)
        
        runTest(type: Double.self, func1: VecOps.distancesq, func2: VecOpsNoAccelerate.distancesq,
                ia: 1, ib: 1, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.distancesq, func2: VecOpsNoAccelerate.distancesq,
                ia: 2, ib: 3, accuracy: 1e-4)
    }
}
