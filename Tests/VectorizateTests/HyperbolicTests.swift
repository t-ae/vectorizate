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
    
    func testVSinh() {
        runTest(type: Float.self, func1: VecOps.vsinh, func2: VecOpsNoAccelerate.vsinh, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vsinh, func2: VecOpsNoAccelerate.vsinh, accuracy: 1e-8)
    }
    
    func testVCosh() {
        runTest(type: Float.self, func1: VecOps.vcosh, func2: VecOpsNoAccelerate.vcosh, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vcosh, func2: VecOpsNoAccelerate.vcosh, accuracy: 1e-8)
    }
    
    func testVTanh() {
        runTest(type: Float.self, func1: VecOps.vtanh, func2: VecOpsNoAccelerate.vtanh, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vtanh, func2: VecOpsNoAccelerate.vtanh, accuracy: 1e-8)
    }
    
    func testVASinh() {
        runTest(type: Float.self, func1: VecOps.vasinh, func2: VecOpsNoAccelerate.vasinh, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vasinh, func2: VecOpsNoAccelerate.vasinh, accuracy: 1e-8)
    }
    
    func testVACosh() {
        runTest(type: Float.self, func1: VecOps.vacosh, func2: VecOpsNoAccelerate.vacosh, range: 1..<Float.pi, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vacosh, func2: VecOpsNoAccelerate.vacosh, range: 1..<Double.pi, accuracy: 1e-8)
    }
    
    func testVATanh() {
        runTest(type: Float.self, func1: VecOps.vatanh, func2: VecOpsNoAccelerate.vatanh, accuracy: 1e-4)
        runTest(type: Double.self, func1: VecOps.vatanh, func2: VecOpsNoAccelerate.vatanh, accuracy: 1e-8)
    }

}
