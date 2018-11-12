import XCTest
import Vectorizate

class Compound4Tests: XCTestCase {
    
    let count = 100
    
    typealias VVVV<F: BinaryFloatingPoint> = (UnsafePointer<F>, Int,
        UnsafePointer<F>, Int,
        UnsafePointer<F>, Int,
        UnsafePointer<F>, Int,
        UnsafeMutablePointer<F>, Int, Int) -> Void
    
    func runTestVVVV<F: BinaryFloatingPoint>(type: F.Type, func1: VVVV<F>, func2: VVVV<F>,
                                             ia: Int, ib: Int, ic: Int, id: Int, iOut: Int,
                                             file: StaticString = #file, line: UInt = #line)
        where F.RawSignificand: FixedWidthInteger {
            let a = (0..<ia*count).shuffled().map(F.init)
            let b = (0..<ib*count).shuffled().map(F.init)
            let c = (0..<ic*count).shuffled().map(F.init)
            let d = (0..<id*count).shuffled().map(F.init)
            
            var ans1 = [F](repeating: 0, count: iOut*count)
            var ans2 = [F](repeating: 0, count: iOut*count)
            
            func1(a, ia, b, ib, c, ic, d, id, &ans1, iOut, count)
            func2(a, ia, b, ib, c, ic, d, id, &ans2, iOut, count)
            
            XCTAssertEqual(ans1, ans2, file: file, line: line)
    }
    
    func testVMMA() {
        runTestVVVV(type: Float.self, func1: VecOps.vmma, func2: VecOpsNoAccelerate.vmma,
                    ia: 1, ib: 1, ic: 1, id: 1, iOut: 1)
        runTestVVVV(type: Float.self, func1: VecOps.vmma, func2: VecOpsNoAccelerate.vmma,
                    ia: 2, ib: 3, ic: 5, id: 7, iOut: 11)
        
        runTestVVVV(type: Double.self, func1: VecOps.vmma, func2: VecOpsNoAccelerate.vmma,
                    ia: 1, ib: 1, ic: 1, id: 1, iOut: 1)
        runTestVVVV(type: Double.self, func1: VecOps.vmma, func2: VecOpsNoAccelerate.vmma,
                    ia: 2, ib: 3, ic: 5, id: 7, iOut: 11)
    }
    
    func testVMMSb() {
        runTestVVVV(type: Float.self, func1: VecOps.vmmsb, func2: VecOpsNoAccelerate.vmmsb,
                    ia: 1, ib: 1, ic: 1, id: 1, iOut: 1)
        runTestVVVV(type: Float.self, func1: VecOps.vmmsb, func2: VecOpsNoAccelerate.vmmsb,
                    ia: 2, ib: 3, ic: 5, id: 7, iOut: 11)
        
        runTestVVVV(type: Double.self, func1: VecOps.vmmsb, func2: VecOpsNoAccelerate.vmmsb,
                    ia: 1, ib: 1, ic: 1, id: 1, iOut: 1)
        runTestVVVV(type: Double.self, func1: VecOps.vmmsb, func2: VecOpsNoAccelerate.vmmsb,
                    ia: 2, ib: 3, ic: 5, id: 7, iOut: 11)
    }
    
    func testVAAM() {
        runTestVVVV(type: Float.self, func1: VecOps.vaam, func2: VecOpsNoAccelerate.vaam,
                    ia: 1, ib: 1, ic: 1, id: 1, iOut: 1)
        runTestVVVV(type: Float.self, func1: VecOps.vaam, func2: VecOpsNoAccelerate.vaam,
                    ia: 2, ib: 3, ic: 5, id: 7, iOut: 11)
        
        runTestVVVV(type: Double.self, func1: VecOps.vaam, func2: VecOpsNoAccelerate.vaam,
                    ia: 1, ib: 1, ic: 1, id: 1, iOut: 1)
        runTestVVVV(type: Double.self, func1: VecOps.vaam, func2: VecOpsNoAccelerate.vaam,
                    ia: 2, ib: 3, ic: 5, id: 7, iOut: 11)
    }
    
    func testVASbM() {
        runTestVVVV(type: Float.self, func1: VecOps.vasbm, func2: VecOpsNoAccelerate.vasbm,
                    ia: 1, ib: 1, ic: 1, id: 1, iOut: 1)
        runTestVVVV(type: Float.self, func1: VecOps.vasbm, func2: VecOpsNoAccelerate.vasbm,
                    ia: 2, ib: 3, ic: 5, id: 7, iOut: 11)
        
        runTestVVVV(type: Double.self, func1: VecOps.vasbm, func2: VecOpsNoAccelerate.vasbm,
                    ia: 1, ib: 1, ic: 1, id: 1, iOut: 1)
        runTestVVVV(type: Double.self, func1: VecOps.vasbm, func2: VecOpsNoAccelerate.vasbm,
                    ia: 2, ib: 3, ic: 5, id: 7, iOut: 11)
    }
}
