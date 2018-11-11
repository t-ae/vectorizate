import XCTest
import Vectorizate

class AverageTests: XCTestCase {
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
    
    func testMeanv() {
        runTest(type: Float.self, func1: VecOps.meanv, func2: VecOpsNoAccelerate.meanv,
                ia: 1, accuracy: 1e-4)
        runTest(type: Float.self, func1: VecOps.meanv, func2: VecOpsNoAccelerate.meanv,
                ia: 2, accuracy: 1e-4)
        
        runTest(type: Double.self, func1: VecOps.meanv, func2: VecOpsNoAccelerate.meanv,
                ia: 1, accuracy: 1e-8)
        runTest(type: Double.self, func1: VecOps.meanv, func2: VecOpsNoAccelerate.meanv,
                ia: 2, accuracy: 1e-8)
    }
    
    func testMeamgv() {
        runTest(type: Float.self, func1: VecOps.meamgv, func2: VecOpsNoAccelerate.meamgv,
                ia: 1, accuracy: 1e-4)
        runTest(type: Float.self, func1: VecOps.meamgv, func2: VecOpsNoAccelerate.meamgv,
                ia: 2, accuracy: 1e-4)
        
        runTest(type: Double.self, func1: VecOps.meamgv, func2: VecOpsNoAccelerate.meamgv,
                ia: 1, accuracy: 1e-8)
        runTest(type: Double.self, func1: VecOps.meamgv, func2: VecOpsNoAccelerate.meamgv,
                ia: 2, accuracy: 1e-8)
    }
    
    func testMeasqv() {
        runTest(type: Float.self, func1: VecOps.measqv, func2: VecOpsNoAccelerate.measqv,
                ia: 1, accuracy: 1e-4)
        runTest(type: Float.self, func1: VecOps.measqv, func2: VecOpsNoAccelerate.measqv,
                ia: 2, accuracy: 1e-4)
        
        runTest(type: Double.self, func1: VecOps.measqv, func2: VecOpsNoAccelerate.measqv,
                ia: 1, accuracy: 1e-8)
        runTest(type: Double.self, func1: VecOps.measqv, func2: VecOpsNoAccelerate.measqv,
                ia: 2, accuracy: 1e-8)
    }
    
    func testMvessq() {
        runTest(type: Float.self, func1: VecOps.mvessq, func2: VecOpsNoAccelerate.mvessq,
                ia: 1, accuracy: 1e-4)
        runTest(type: Float.self, func1: VecOps.mvessq, func2: VecOpsNoAccelerate.mvessq,
                ia: 2, accuracy: 1e-4)
        
        runTest(type: Double.self, func1: VecOps.mvessq, func2: VecOpsNoAccelerate.mvessq,
                ia: 1, accuracy: 1e-8)
        runTest(type: Double.self, func1: VecOps.mvessq, func2: VecOpsNoAccelerate.mvessq,
                ia: 2, accuracy: 1e-8)
    }
    
    func testRmsqv() {
        runTest(type: Float.self, func1: VecOps.rmsqv, func2: VecOpsNoAccelerate.rmsqv,
                ia: 1, accuracy: 1e-4)
        runTest(type: Float.self, func1: VecOps.rmsqv, func2: VecOpsNoAccelerate.rmsqv,
                ia: 2, accuracy: 1e-4)
        
        runTest(type: Double.self, func1: VecOps.rmsqv, func2: VecOpsNoAccelerate.rmsqv,
                ia: 1, accuracy: 1e-8)
        runTest(type: Double.self, func1: VecOps.rmsqv, func2: VecOpsNoAccelerate.rmsqv,
                ia: 2, accuracy: 1e-8)
    }
}
