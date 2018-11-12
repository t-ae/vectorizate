import XCTest
import Vectorizate

class Compound3Tests: XCTestCase {
    let count = 100
    
    typealias VVV<F: BinaryFloatingPoint> = (UnsafePointer<F>, Int,
        UnsafePointer<F>, Int,
        UnsafePointer<F>, Int,
        UnsafeMutablePointer<F>, Int, Int) -> Void
    
    typealias VVS<F: BinaryFloatingPoint> = (UnsafePointer<F>, Int,
        UnsafePointer<F>, Int,
        F,
        UnsafeMutablePointer<F>, Int, Int) -> Void
    
    typealias VSV<F: BinaryFloatingPoint> = (UnsafePointer<F>, Int,
        F,
        UnsafePointer<F>, Int,
        UnsafeMutablePointer<F>, Int, Int) -> Void
    
    typealias VSS<F: BinaryFloatingPoint> = (UnsafePointer<F>, Int,
        F, F,
        UnsafeMutablePointer<F>, Int, Int) -> Void
    
    func runTestVVV<F: BinaryFloatingPoint>(type: F.Type, func1: VVV<F>, func2: VVV<F>,
                                            ia: Int, ib: Int, ic: Int, iOut: Int,
                                            file: StaticString = #file, line: UInt = #line)
        where F.RawSignificand: FixedWidthInteger {
            let a = (0..<ia*count).shuffled().map(F.init)
            let b = (0..<ib*count).shuffled().map(F.init)
            let c = (0..<ic*count).shuffled().map(F.init)
            
            var ans1 = [F](repeating: 0, count: iOut*count)
            var ans2 = [F](repeating: 0, count: iOut*count)
            
            func1(a, ia, b, ib, c, ic, &ans1, iOut, count)
            func2(a, ia, b, ib, c, ic, &ans2, iOut, count)
            
            XCTAssertEqual(ans1, ans2, file: file, line: line)
    }
    
    func runTestVVS<F: BinaryFloatingPoint>(type: F.Type, func1: VVS<F>, func2: VVS<F>,
                                            ia: Int, ib: Int, iOut: Int,
                                            file: StaticString = #file, line: UInt = #line)
        where F.RawSignificand: FixedWidthInteger {
            let a = (0..<ia*count).shuffled().map(F.init)
            let b = (0..<ib*count).shuffled().map(F.init)
            let c: F = 3
            
            var ans1 = [F](repeating: 0, count: iOut*count)
            var ans2 = [F](repeating: 0, count: iOut*count)
            
            func1(a, ia, b, ib, c, &ans1, iOut, count)
            func2(a, ia, b, ib, c, &ans2, iOut, count)
            
            XCTAssertEqual(ans1, ans2, file: file, line: line)
    }
    
    func runTestVSV<F: BinaryFloatingPoint>(type: F.Type, func1: VSV<F>, func2: VSV<F>,
                                            ia: Int, ic: Int, iOut: Int,
                                            file: StaticString = #file, line: UInt = #line)
        where F.RawSignificand: FixedWidthInteger {
            let a = (0..<ia*count).shuffled().map(F.init)
            let b: F = 3
            let c = (0..<ic*count).shuffled().map(F.init)
            
            var ans1 = [F](repeating: 0, count: iOut*count)
            var ans2 = [F](repeating: 0, count: iOut*count)
            
            func1(a, ia, b, c, ic, &ans1, iOut, count)
            func2(a, ia, b, c, ic, &ans2, iOut, count)
            
            XCTAssertEqual(ans1, ans2, file: file, line: line)
    }
    
    func runTestVSS<F: BinaryFloatingPoint>(type: F.Type, func1: VSS<F>, func2: VSS<F>,
                                            ia: Int, iOut: Int,
                                            file: StaticString = #file, line: UInt = #line)
        where F.RawSignificand: FixedWidthInteger {
            let a = (0..<ia*count).shuffled().map(F.init)
            let b: F = 3
            let c: F = 7
            
            var ans1 = [F](repeating: 0, count: iOut*count)
            var ans2 = [F](repeating: 0, count: iOut*count)
            
            func1(a, ia, b, c, &ans1, iOut, count)
            func2(a, ia, b, c, &ans2, iOut, count)
            
            XCTAssertEqual(ans1, ans2, file: file, line: line)
    }

    func testVMA() {
        runTestVVV(type: Float.self, func1: VecOps.vma, func2: VecOpsNoAccelerate.vma, ia: 1, ib: 1, ic: 1, iOut: 1)
        runTestVVV(type: Float.self, func1: VecOps.vma, func2: VecOpsNoAccelerate.vma, ia: 2, ib: 3, ic: 5, iOut: 7)

        runTestVVV(type: Double.self, func1: VecOps.vma, func2: VecOpsNoAccelerate.vma, ia: 1, ib: 1, ic: 1, iOut: 1)
        runTestVVV(type: Double.self, func1: VecOps.vma, func2: VecOpsNoAccelerate.vma, ia: 2, ib: 3, ic: 5, iOut: 7)
    }
    
    func testVMSb() {
        runTestVVV(type: Float.self, func1: VecOps.vmsb, func2: VecOpsNoAccelerate.vmsb, ia: 1, ib: 1, ic: 1, iOut: 1)
        runTestVVV(type: Float.self, func1: VecOps.vmsb, func2: VecOpsNoAccelerate.vmsb, ia: 2, ib: 3, ic: 5, iOut: 7)
        
        runTestVVV(type: Double.self, func1: VecOps.vmsb, func2: VecOpsNoAccelerate.vmsb, ia: 1, ib: 1, ic: 1, iOut: 1)
        runTestVVV(type: Double.self, func1: VecOps.vmsb, func2: VecOpsNoAccelerate.vmsb, ia: 2, ib: 3, ic: 5, iOut: 7)
    }
    
    func testVAM() {
        runTestVVV(type: Float.self, func1: VecOps.vam, func2: VecOpsNoAccelerate.vam, ia: 1, ib: 1, ic: 1, iOut: 1)
        runTestVVV(type: Float.self, func1: VecOps.vam, func2: VecOpsNoAccelerate.vam, ia: 2, ib: 3, ic: 5, iOut: 7)
        
        runTestVVV(type: Double.self, func1: VecOps.vam, func2: VecOpsNoAccelerate.vam, ia: 1, ib: 1, ic: 1, iOut: 1)
        runTestVVV(type: Double.self, func1: VecOps.vam, func2: VecOpsNoAccelerate.vam, ia: 2, ib: 3, ic: 5, iOut: 7)
    }
    
    func testVSbM() {
        runTestVVV(type: Float.self, func1: VecOps.vsbm, func2: VecOpsNoAccelerate.vsbm, ia: 1, ib: 1, ic: 1, iOut: 1)
        runTestVVV(type: Float.self, func1: VecOps.vsbm, func2: VecOpsNoAccelerate.vsbm, ia: 2, ib: 3, ic: 5, iOut: 7)
        
        runTestVVV(type: Double.self, func1: VecOps.vsbm, func2: VecOpsNoAccelerate.vsbm, ia: 1, ib: 1, ic: 1, iOut: 1)
        runTestVVV(type: Double.self, func1: VecOps.vsbm, func2: VecOpsNoAccelerate.vsbm, ia: 2, ib: 3, ic: 5, iOut: 7)
    }
    
    func testVMSA() {
        runTestVVS(type: Float.self, func1: VecOps.vmsa, func2: VecOpsNoAccelerate.vmsa, ia: 1, ib: 1, iOut: 1)
        runTestVVS(type: Float.self, func1: VecOps.vmsa, func2: VecOpsNoAccelerate.vmsa, ia: 2, ib: 3, iOut: 5)
        
        runTestVVS(type: Double.self, func1: VecOps.vmsa, func2: VecOpsNoAccelerate.vmsa, ia: 1, ib: 1, iOut: 1)
        runTestVVS(type: Double.self, func1: VecOps.vmsa, func2: VecOpsNoAccelerate.vmsa, ia: 2, ib: 3, iOut: 5)
    }
    
    func testVSMA() {
        runTestVSV(type: Float.self, func1: VecOps.vsma, func2: VecOpsNoAccelerate.vsma, ia: 1, ic: 1, iOut: 1)
        runTestVSV(type: Float.self, func1: VecOps.vsma, func2: VecOpsNoAccelerate.vsma, ia: 2, ic: 3, iOut: 5)
        
        runTestVSV(type: Double.self, func1: VecOps.vsma, func2: VecOpsNoAccelerate.vsma, ia: 1, ic: 1, iOut: 1)
        runTestVSV(type: Double.self, func1: VecOps.vsma, func2: VecOpsNoAccelerate.vsma, ia: 2, ic: 3, iOut: 5)
    }
    
    func testVSMSb() {
        runTestVSV(type: Float.self, func1: VecOps.vsmsb, func2: VecOpsNoAccelerate.vsmsb, ia: 1, ic: 1, iOut: 1)
        runTestVSV(type: Float.self, func1: VecOps.vsmsb, func2: VecOpsNoAccelerate.vsmsb, ia: 2, ic: 3, iOut: 5)
        
        runTestVSV(type: Double.self, func1: VecOps.vsmsb, func2: VecOpsNoAccelerate.vsmsb, ia: 1, ic: 1, iOut: 1)
        runTestVSV(type: Double.self, func1: VecOps.vsmsb, func2: VecOpsNoAccelerate.vsmsb, ia: 2, ic: 3, iOut: 5)
    }
    
    func testVSMSA() {
        runTestVSS(type: Float.self, func1: VecOps.vsmsa, func2: VecOpsNoAccelerate.vsmsa, ia: 1, iOut: 1)
        runTestVSS(type: Float.self, func1: VecOps.vsmsa, func2: VecOpsNoAccelerate.vsmsa, ia: 2, iOut: 5)
        
        runTestVSS(type: Double.self, func1: VecOps.vsmsa, func2: VecOpsNoAccelerate.vsmsa, ia: 1, iOut: 1)
        runTestVSS(type: Double.self, func1: VecOps.vsmsa, func2: VecOpsNoAccelerate.vsmsa, ia: 2, iOut: 5)
    }
}
