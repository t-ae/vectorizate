import XCTest
import Vectorizate

class Vector_ScalarArithmeticTests: XCTestCase {
    
    let count = 100

    typealias VS<F> = (UnsafePointer<F>, Int, F, UnsafeMutablePointer<F>, Int, Int)->Void
    typealias SV<F> = (F, UnsafePointer<F>, Int, UnsafeMutablePointer<F>, Int, Int)->Void
    
    func runTestVS<F: BinaryFloatingPoint>(
        type: F.Type, func1: VS<F>, func2: VS<F>,
        ia: Int, iOut: Int,
        accuracy: F = 0,
        file: StaticString = #file, line: UInt = #line)
        where F.RawSignificand: FixedWidthInteger {
            let a: [F] = randomArray(count: count*ia, in: 1..<10)
            let b = F.random(in: 1..<10)
            var ans1 = [F](repeating: 0, count: count*iOut)
            var ans2 = [F](repeating: 0, count: count*iOut)
            
            func1(a, ia, b, &ans1, iOut, count)
            func2(a, ia, b, &ans2, iOut, count)
            
            XCTAssertEqual(ans1, ans2, accuracy: accuracy, file: file, line: line)
    }
    
    func runTestSV<F: BinaryFloatingPoint>(
        type: F.Type, func1: SV<F>, func2: SV<F>,
        ib: Int, iOut: Int,
        accuracy: F = 0,
        file: StaticString = #file, line: UInt = #line)
        where F.RawSignificand: FixedWidthInteger{
            let a = F.random(in: 1..<10)
            let b: [F] = randomArray(count: count*ib, in: 1..<10)
            
            var ans1 = [F](repeating: 0, count: count*iOut)
            var ans2 = [F](repeating: 0, count: count*iOut)
            
            func1(a, b, ib, &ans1, iOut, count)
            func2(a, b, ib, &ans2, iOut, count)
            
            XCTAssertEqual(ans1, ans2, accuracy: accuracy, file: file, line: line)
    }
    
    func testVSAdd() {
        do {
            typealias T = Float
            runTestVS(type: T.self,
                    func1: VecOps.vsadd, func2: VecOpsNoAccelerate.vsadd,
                    ia: 1, iOut: 1)
            runTestVS(type: T.self,
                    func1: VecOps.vsadd, func2: VecOpsNoAccelerate.vsadd,
                    ia: 2, iOut: 3)
        }
        do {
            typealias T = Double
            runTestVS(type: T.self,
                    func1: VecOps.vsadd, func2: VecOpsNoAccelerate.vsadd,
                    ia: 1, iOut: 1)
            runTestVS(type: T.self,
                    func1: VecOps.vsadd, func2: VecOpsNoAccelerate.vsadd,
                    ia: 2, iOut: 3)
        }
    }
    
    func testVSSub() {
        do {
            typealias T = Float
            runTestVS(type: T.self,
                    func1: VecOps.vssub, func2: VecOpsNoAccelerate.vssub,
                    ia: 1, iOut: 1)
            runTestVS(type: T.self,
                    func1: VecOps.vssub, func2: VecOpsNoAccelerate.vssub,
                    ia: 2, iOut: 3)
        }
        do {
            typealias T = Double
            runTestVS(type: T.self,
                    func1: VecOps.vssub, func2: VecOpsNoAccelerate.vssub,
                    ia: 1, iOut: 1)
            runTestVS(type: T.self,
                    func1: VecOps.vssub, func2: VecOpsNoAccelerate.vssub,
                    ia: 2, iOut: 3)
        }
    }
    
    func testSVSub() {
        do {
            typealias T = Float
            runTestSV(type: T.self,
                    func1: VecOps.svsub, func2: VecOpsNoAccelerate.svsub,
                    ib: 1, iOut: 1)
            runTestSV(type: T.self,
                    func1: VecOps.svsub, func2: VecOpsNoAccelerate.svsub,
                    ib: 2, iOut: 3)
        }
        do {
            typealias T = Double
            runTestSV(type: T.self,
                    func1: VecOps.svsub, func2: VecOpsNoAccelerate.svsub,
                    ib: 1, iOut: 1)
            runTestSV(type: T.self,
                    func1: VecOps.svsub, func2: VecOpsNoAccelerate.svsub,
                    ib: 2, iOut: 3)
        }
    }
    
    func testVSMul() {
        do {
            typealias T = Float
            runTestVS(type: T.self,
                    func1: VecOps.vsmul, func2: VecOpsNoAccelerate.vsmul,
                    ia: 1, iOut: 1)
            runTestVS(type: T.self,
                    func1: VecOps.vsmul, func2: VecOpsNoAccelerate.vsmul,
                    ia: 2, iOut: 3)
        }
        do {
            typealias T = Double
            runTestVS(type: T.self,
                    func1: VecOps.vsmul, func2: VecOpsNoAccelerate.vsmul,
                    ia: 1, iOut: 1)
            runTestVS(type: T.self,
                    func1: VecOps.vsmul, func2: VecOpsNoAccelerate.vsmul,
                    ia: 2, iOut: 3)
        }
    }
    
    func testVSDiv() {
        do {
            typealias T = Float
            let accuracy: T = 1e-4
            runTestVS(type: T.self,
                    func1: VecOps.vsdiv, func2: VecOpsNoAccelerate.vsdiv,
                    ia: 1, iOut: 1, accuracy: accuracy)
            runTestVS(type: T.self,
                    func1: VecOps.vsdiv, func2: VecOpsNoAccelerate.vsdiv,
                    ia: 2, iOut: 3, accuracy: accuracy)
        }
        do {
            typealias T = Double
            let accuracy: T = 1e-8
            runTestVS(type: T.self,
                    func1: VecOps.vsdiv, func2: VecOpsNoAccelerate.vsdiv,
                    ia: 1, iOut: 1, accuracy: accuracy)
            runTestVS(type: T.self,
                    func1: VecOps.vsdiv, func2: VecOpsNoAccelerate.vsdiv,
                    ia: 2, iOut: 3, accuracy: accuracy)
        }
    }
    
    func testSVDiv() {
        do {
            typealias T = Float
            let accuracy: T = 1e-4
            runTestSV(type: T.self,
                    func1: VecOps.svdiv, func2: VecOpsNoAccelerate.svdiv,
                    ib: 1, iOut: 1, accuracy: accuracy)
            runTestSV(type: T.self,
                    func1: VecOps.svdiv, func2: VecOpsNoAccelerate.svdiv,
                    ib: 2, iOut: 3, accuracy: accuracy)
        }
        do {
            typealias T = Double
            let accuracy: T = 1e-8
            runTestSV(type: T.self,
                    func1: VecOps.svdiv, func2: VecOpsNoAccelerate.svdiv,
                    ib: 1, iOut: 1, accuracy: accuracy)
            runTestSV(type: T.self,
                    func1: VecOps.svdiv, func2: VecOpsNoAccelerate.svdiv,
                    ib: 2, iOut: 3, accuracy: accuracy)
        }
    }
}
