import XCTest
import Vectorizate

class ClippingTests: XCTestCase {
    
    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, Int, F, F, UnsafeMutablePointer<F>, Int, Int)->Void,
        func2: (UnsafePointer<F>, Int, F, F, UnsafeMutablePointer<F>, Int, Int)->Void,
        ix: Int, iOut: Int,
        accuracy: F = 0,
        file: StaticString = #file, line: UInt = #line) {
        
        let x = stride(from: -1, to: 1, by: 0.1).map { F($0) }
        
        var ans1 = [F](repeating: 0, count: x.count / ix * iOut)
        var ans2 = [F](repeating: 0, count: x.count / ix * iOut)
        
        func1(x, ix, -0.5, 0.5, &ans1, iOut, x.count/ix)
        func2(x, ix, -0.5, 0.5, &ans2, iOut, x.count/ix)
        
        XCTAssertEqual(ans1, ans2)
    }
    
    func testVClip() {
        runTest(type: Float.self, func1: VecOps.vclip, func2: VecOpsNoAccelerate.vclip, ix: 1, iOut: 1)
        runTest(type: Float.self, func1: VecOps.vclip, func2: VecOpsNoAccelerate.vclip, ix: 2, iOut: 3)
        
        runTest(type: Double.self, func1: VecOps.vclip, func2: VecOpsNoAccelerate.vclip, ix: 1, iOut: 1)
        runTest(type: Double.self, func1: VecOps.vclip, func2: VecOpsNoAccelerate.vclip, ix: 2, iOut: 3)
    }
    
    func testVIClip() {
        runTest(type: Float.self, func1: VecOps.viclip, func2: VecOpsNoAccelerate.viclip, ix: 1, iOut: 1)
        runTest(type: Float.self, func1: VecOps.viclip, func2: VecOpsNoAccelerate.viclip, ix: 2, iOut: 3)
        
        runTest(type: Double.self, func1: VecOps.viclip, func2: VecOpsNoAccelerate.viclip, ix: 1, iOut: 1)
        runTest(type: Double.self, func1: VecOps.viclip, func2: VecOpsNoAccelerate.viclip, ix: 2, iOut: 3)
    }
}
