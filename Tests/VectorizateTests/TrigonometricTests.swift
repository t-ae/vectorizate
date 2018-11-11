import XCTest
import Vectorizate

class TrigonometricTests: XCTestCase {
    
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

    func testVSin() {
        runTest(type: Float.self, func1: VecOps.vsin, func2: VecOpsNoAccelerate.vsin, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vsin, func2: VecOpsNoAccelerate.vsin, accuracy: 1e-8)
        
        runTest(type: Float.self, func1: VecOps.vsinpi, func2: VecOpsNoAccelerate.vsinpi, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vsinpi, func2: VecOpsNoAccelerate.vsinpi, accuracy: 1e-8)
    }
    
    func testVCos() {
        runTest(type: Float.self, func1: VecOps.vcos, func2: VecOpsNoAccelerate.vcos, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vcos, func2: VecOpsNoAccelerate.vcos, accuracy: 1e-8)
        
        runTest(type: Float.self, func1: VecOps.vcospi, func2: VecOpsNoAccelerate.vcospi, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vcospi, func2: VecOpsNoAccelerate.vcospi, accuracy: 1e-8)
    }
    
    func testVTan() {
        runTest(type: Float.self, func1: VecOps.vtan, func2: VecOpsNoAccelerate.vtan, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vtan, func2: VecOpsNoAccelerate.vtan, accuracy: 1e-8)
        
        runTest(type: Float.self, func1: VecOps.vtanpi, func2: VecOpsNoAccelerate.vtanpi, range: 0..<0.3, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vtanpi, func2: VecOpsNoAccelerate.vtanpi, range: 0..<0.9, accuracy: 1e-8)
    }
    
    func testVASin() {
        runTest(type: Float.self, func1: VecOps.vasin, func2: VecOpsNoAccelerate.vasin, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vasin, func2: VecOpsNoAccelerate.vasin, accuracy: 1e-8)
    }
    
    func testVACos() {
        runTest(type: Float.self, func1: VecOps.vacos, func2: VecOpsNoAccelerate.vacos, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vacos, func2: VecOpsNoAccelerate.vacos, accuracy: 1e-8)
    }
    
    func testVATan() {
        runTest(type: Float.self, func1: VecOps.vatan, func2: VecOpsNoAccelerate.vatan, range: 0..<0.9, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vatan, func2: VecOpsNoAccelerate.vatan, range: 0..<0.9, accuracy: 1e-8)
    }
    
    func testVATan2() {
        do {
            typealias F = Float
            let x: [F] = randomArray(count: count, in: 0..<1)
            let y: [F] = randomArray(count: count, in: 0..<1)
            
            var ans1 = [F](repeating: 0, count: count)
            var ans2 = [F](repeating: 0, count: count)
            
            VecOps.vatan2(y: y, x: x, out: &ans1, count: count)
            VecOpsNoAccelerate.vatan2(y: y, x: x, out: &ans2, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-6)
        }
        do {
            typealias F = Double
            let x: [F] = randomArray(count: count, in: 0..<1)
            let y: [F] = randomArray(count: count, in: 0..<1)
            
            var ans1 = [F](repeating: 0, count: count)
            var ans2 = [F](repeating: 0, count: count)
            
            VecOps.vatan2(y: y, x: x, out: &ans1, count: count)
            VecOpsNoAccelerate.vatan2(y: y, x: x, out: &ans2, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-12)
        }
    }
}
