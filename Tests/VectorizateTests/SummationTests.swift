import XCTest
import Vectorizate

class SummationTests: XCTestCase {
    
    let count = 100
    
    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, Int, UnsafeMutablePointer<F>, Int)->Void,
        func2: (UnsafePointer<F>, Int, UnsafeMutablePointer<F>, Int)->Void,
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

    func testSVe() {
        runTest(type: Float.self, func1: VecOps.sve, func2: VecOpsNoAccelerate.sve, ia: 1, accuracy: 1e-4)
        runTest(type: Float.self, func1: VecOps.sve, func2: VecOpsNoAccelerate.sve, ia: 3, accuracy: 1e-4)
        
        runTest(type: Double.self, func1: VecOps.sve, func2: VecOpsNoAccelerate.sve, ia: 1, accuracy: 1e-8)
        runTest(type: Double.self, func1: VecOps.sve, func2: VecOpsNoAccelerate.sve, ia: 3, accuracy: 1e-8)
    }
    
    func testSVeMg() {
        runTest(type: Float.self, func1: VecOps.svemg, func2: VecOpsNoAccelerate.svemg, ia: 1, accuracy: 1e-4)
        runTest(type: Float.self, func1: VecOps.svemg, func2: VecOpsNoAccelerate.svemg, ia: 3, accuracy: 1e-4)
        
        runTest(type: Double.self, func1: VecOps.svemg, func2: VecOpsNoAccelerate.svemg, ia: 1, accuracy: 1e-8)
        runTest(type: Double.self, func1: VecOps.svemg, func2: VecOpsNoAccelerate.svemg, ia: 3, accuracy: 1e-8)
    }

    func testSVeSq() {
        runTest(type: Float.self, func1: VecOps.svesq, func2: VecOpsNoAccelerate.svesq, ia: 1, accuracy: 1e-4)
        runTest(type: Float.self, func1: VecOps.svesq, func2: VecOpsNoAccelerate.svesq, ia: 3, accuracy: 1e-4)
        
        runTest(type: Double.self, func1: VecOps.svesq, func2: VecOpsNoAccelerate.svesq, ia: 1, accuracy: 1e-8)
        runTest(type: Double.self, func1: VecOps.svesq, func2: VecOpsNoAccelerate.svesq, ia: 3, accuracy: 1e-8)
    }
    
    func testSVS() {
        runTest(type: Float.self, func1: VecOps.svs, func2: VecOpsNoAccelerate.svs, ia: 1, accuracy: 1e-4)
        runTest(type: Float.self, func1: VecOps.svs, func2: VecOpsNoAccelerate.svs, ia: 3, accuracy: 1e-4)
        
        runTest(type: Double.self, func1: VecOps.svs, func2: VecOpsNoAccelerate.svs, ia: 1, accuracy: 1e-8)
        runTest(type: Double.self, func1: VecOps.svs, func2: VecOpsNoAccelerate.svs, ia: 3, accuracy: 1e-8)
    }
}
