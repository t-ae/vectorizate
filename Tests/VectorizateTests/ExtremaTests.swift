import XCTest
import Vectorizate

class ExtremaTests: XCTestCase {
    
    let count = 100
    
    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, Int, inout F, Int)->Void,
        func2: (UnsafePointer<F>, Int, inout F, Int)->Void,
        ia: Int,
        accuracy: F = 0,
        file: StaticString = #file, line: UInt = #line)
        where F.RawSignificand: FixedWidthInteger {
            let a: [F] = randomArray(count: count*ia, in: -1..<1)
            var ans1: F = 0
            var ans2: F = 0
            
            func1(a, ia, &ans1, count)
            func2(a, ia, &ans2, count)
            
            XCTAssertEqual(ans1, ans2, accuracy: accuracy, file: file, line: line)
    }
    
    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, Int, inout F, inout UInt, Int)->Void,
        func2: (UnsafePointer<F>, Int, inout F, inout UInt, Int)->Void,
        ia: Int,
        accuracy: F = 0,
        file: StaticString = #file, line: UInt = #line)
        where F.RawSignificand: FixedWidthInteger {
            let a: [F] = randomArray(count: count*ia, in: -1..<1)
            var ans1: F = 0
            var index1: UInt = 0
            var ans2: F = 0
            var index2: UInt = 0
            
            func1(a, ia, &ans1, &index1, count)
            func2(a, ia, &ans2, &index2, count)
            
            XCTAssertEqual(ans1, ans2, file: file, line: line)
            XCTAssertEqual(index1, index2, file: file, line: line)
    }
    
    func testMaxv() {
        runTest(type: Float.self, func1: VecOps.maxv, func2: VecOpsNoAccelerate.maxv, ia: 1)
        runTest(type: Float.self, func1: VecOps.maxv, func2: VecOpsNoAccelerate.maxv, ia: 2)
        
        runTest(type: Double.self, func1: VecOps.maxv, func2: VecOpsNoAccelerate.maxv, ia: 1)
        runTest(type: Double.self, func1: VecOps.maxv, func2: VecOpsNoAccelerate.maxv, ia: 2)
    }
    
    func testMaxvi() {
        runTest(type: Float.self, func1: VecOps.maxvi, func2: VecOpsNoAccelerate.maxvi, ia: 1)
        runTest(type: Float.self, func1: VecOps.maxvi, func2: VecOpsNoAccelerate.maxvi, ia: 2)
        
        runTest(type: Double.self, func1: VecOps.maxvi, func2: VecOpsNoAccelerate.maxvi, ia: 1)
        runTest(type: Double.self, func1: VecOps.maxvi, func2: VecOpsNoAccelerate.maxvi, ia: 2)
    }
    
    func testMaxMgv() {
        runTest(type: Float.self, func1: VecOps.maxmgv, func2: VecOpsNoAccelerate.maxmgv, ia: 1)
        runTest(type: Float.self, func1: VecOps.maxmgv, func2: VecOpsNoAccelerate.maxmgv, ia: 2)
        
        runTest(type: Double.self, func1: VecOps.maxmgv, func2: VecOpsNoAccelerate.maxmgv, ia: 1)
        runTest(type: Double.self, func1: VecOps.maxmgv, func2: VecOpsNoAccelerate.maxmgv, ia: 2)
    }
    
    func testMaxMgvi() {
        runTest(type: Float.self, func1: VecOps.maxmgvi, func2: VecOpsNoAccelerate.maxmgvi, ia: 1)
        runTest(type: Float.self, func1: VecOps.maxmgvi, func2: VecOpsNoAccelerate.maxmgvi, ia: 2)
        
        runTest(type: Double.self, func1: VecOps.maxmgvi, func2: VecOpsNoAccelerate.maxmgvi, ia: 1)
        runTest(type: Double.self, func1: VecOps.maxmgvi, func2: VecOpsNoAccelerate.maxmgvi, ia: 2)
    }
    
    func testMinv() {
        runTest(type: Float.self, func1: VecOps.minv, func2: VecOpsNoAccelerate.minv, ia: 1)
        runTest(type: Float.self, func1: VecOps.minv, func2: VecOpsNoAccelerate.minv, ia: 2)
        
        runTest(type: Double.self, func1: VecOps.minv, func2: VecOpsNoAccelerate.minv, ia: 1)
        runTest(type: Double.self, func1: VecOps.minv, func2: VecOpsNoAccelerate.minv, ia: 2)
    }
    
    func testMinvi() {
        runTest(type: Float.self, func1: VecOps.minvi, func2: VecOpsNoAccelerate.minvi, ia: 1)
        runTest(type: Float.self, func1: VecOps.minvi, func2: VecOpsNoAccelerate.minvi, ia: 2)
        
        runTest(type: Double.self, func1: VecOps.minvi, func2: VecOpsNoAccelerate.minvi, ia: 1)
        runTest(type: Double.self, func1: VecOps.minvi, func2: VecOpsNoAccelerate.minvi, ia: 2)
    }
    
    func testMinMgv() {
        runTest(type: Float.self, func1: VecOps.minmgv, func2: VecOpsNoAccelerate.minmgv, ia: 1)
        runTest(type: Float.self, func1: VecOps.minmgv, func2: VecOpsNoAccelerate.minmgv, ia: 2)
        
        runTest(type: Double.self, func1: VecOps.minmgv, func2: VecOpsNoAccelerate.minmgv, ia: 1)
        runTest(type: Double.self, func1: VecOps.minmgv, func2: VecOpsNoAccelerate.minmgv, ia: 2)
    }
    
    func testMinMgvi() {
        runTest(type: Float.self, func1: VecOps.minmgvi, func2: VecOpsNoAccelerate.minmgvi, ia: 1)
        runTest(type: Float.self, func1: VecOps.minmgvi, func2: VecOpsNoAccelerate.minmgvi, ia: 2)
        
        runTest(type: Double.self, func1: VecOps.minmgvi, func2: VecOpsNoAccelerate.minmgvi, ia: 1)
        runTest(type: Double.self, func1: VecOps.minmgvi, func2: VecOpsNoAccelerate.minmgvi, ia: 2)
    }
}
