import XCTest
import Vectorizate

class Vector_ScalarArithmeticTests: XCTestCase {
    
    let count = 100

    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, Int, F, UnsafeMutablePointer<F>, Int, Int)->Void,
        func2: (UnsafePointer<F>, Int, F, UnsafeMutablePointer<F>, Int, Int)->Void,
        ia: Int, iOut: Int,
        accuracy: F = 0,
        file: StaticString = #file, line: UInt = #line)
        where F.RawSignificand: FixedWidthInteger{
            let a: [F] = randomArray(count: count*ia, in: 1..<10)
            let b = F.random(in: 1..<10)
            var ans1 = [F](repeating: 0, count: count*iOut)
            var ans2 = [F](repeating: 0, count: count*iOut)
            
            func1(a, ia, b, &ans1, iOut, count)
            func2(a, ia, b, &ans2, iOut, count)
            
            XCTAssertEqual(ans1, ans2, accuracy: accuracy, file: file, line: line)
    }
    
    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (F, UnsafePointer<F>, Int, UnsafeMutablePointer<F>, Int, Int)->Void,
        func2: (F, UnsafePointer<F>, Int, UnsafeMutablePointer<F>, Int, Int)->Void,
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
            runTest(type: T.self,
                    func1: Vectorizate.vsadd, func2: VectorizateNoAccelerate.vsadd,
                    ia: 1, iOut: 1)
            runTest(type: T.self,
                    func1: Vectorizate.vsadd, func2: VectorizateNoAccelerate.vsadd,
                    ia: 2, iOut: 3)
        }
        do {
            typealias T = Double
            runTest(type: T.self,
                    func1: Vectorizate.vsadd, func2: VectorizateNoAccelerate.vsadd,
                    ia: 1, iOut: 1)
            runTest(type: T.self,
                    func1: Vectorizate.vsadd, func2: VectorizateNoAccelerate.vsadd,
                    ia: 2, iOut: 3)
        }
    }
    
    func testVSSub() {
        do {
            typealias T = Float
            runTest(type: T.self,
                    func1: Vectorizate.vssub, func2: VectorizateNoAccelerate.vssub,
                    ia: 1, iOut: 1)
            runTest(type: T.self,
                    func1: Vectorizate.vssub, func2: VectorizateNoAccelerate.vssub,
                    ia: 2, iOut: 3)
        }
        do {
            typealias T = Double
            runTest(type: T.self,
                    func1: Vectorizate.vssub, func2: VectorizateNoAccelerate.vssub,
                    ia: 1, iOut: 1)
            runTest(type: T.self,
                    func1: Vectorizate.vssub, func2: VectorizateNoAccelerate.vssub,
                    ia: 2, iOut: 3)
        }
    }
    
    func testSVSub() {
        do {
            typealias T = Float
            runTest(type: T.self,
                    func1: Vectorizate.svsub, func2: VectorizateNoAccelerate.svsub,
                    ib: 1, iOut: 1)
            runTest(type: T.self,
                    func1: Vectorizate.svsub, func2: VectorizateNoAccelerate.svsub,
                    ib: 2, iOut: 3)
        }
        do {
            typealias T = Double
            runTest(type: T.self,
                    func1: Vectorizate.svsub, func2: VectorizateNoAccelerate.svsub,
                    ib: 1, iOut: 1)
            runTest(type: T.self,
                    func1: Vectorizate.svsub, func2: VectorizateNoAccelerate.svsub,
                    ib: 2, iOut: 3)
        }
    }
    
    func testVSMul() {
        do {
            typealias T = Float
            runTest(type: T.self,
                    func1: Vectorizate.vsmul, func2: VectorizateNoAccelerate.vsmul,
                    ia: 1, iOut: 1)
            runTest(type: T.self,
                    func1: Vectorizate.vsmul, func2: VectorizateNoAccelerate.vsmul,
                    ia: 2, iOut: 3)
        }
        do {
            typealias T = Double
            runTest(type: T.self,
                    func1: Vectorizate.vsmul, func2: VectorizateNoAccelerate.vsmul,
                    ia: 1, iOut: 1)
            runTest(type: T.self,
                    func1: Vectorizate.vsmul, func2: VectorizateNoAccelerate.vsmul,
                    ia: 2, iOut: 3)
        }
    }
    
    func testVSDiv() {
        do {
            typealias T = Float
            let accuracy: T = 1e-4
            runTest(type: T.self,
                    func1: Vectorizate.vsdiv, func2: VectorizateNoAccelerate.vsdiv,
                    ia: 1, iOut: 1, accuracy: accuracy)
            runTest(type: T.self,
                    func1: Vectorizate.vsdiv, func2: VectorizateNoAccelerate.vsdiv,
                    ia: 2, iOut: 3, accuracy: accuracy)
        }
        do {
            typealias T = Double
            let accuracy: T = 1e-8
            runTest(type: T.self,
                    func1: Vectorizate.vsdiv, func2: VectorizateNoAccelerate.vsdiv,
                    ia: 1, iOut: 1, accuracy: accuracy)
            runTest(type: T.self,
                    func1: Vectorizate.vsdiv, func2: VectorizateNoAccelerate.vsdiv,
                    ia: 2, iOut: 3, accuracy: accuracy)
        }
    }
    
    func testSVDiv() {
        do {
            typealias T = Float
            let accuracy: T = 1e-4
            runTest(type: T.self,
                    func1: Vectorizate.svdiv, func2: VectorizateNoAccelerate.svdiv,
                    ib: 1, iOut: 1, accuracy: accuracy)
            runTest(type: T.self,
                    func1: Vectorizate.svdiv, func2: VectorizateNoAccelerate.svdiv,
                    ib: 2, iOut: 3, accuracy: accuracy)
        }
        do {
            typealias T = Double
            let accuracy: T = 1e-8
            runTest(type: T.self,
                    func1: Vectorizate.svdiv, func2: VectorizateNoAccelerate.svdiv,
                    ib: 1, iOut: 1, accuracy: accuracy)
            runTest(type: T.self,
                    func1: Vectorizate.svdiv, func2: VectorizateNoAccelerate.svdiv,
                    ib: 2, iOut: 3, accuracy: accuracy)
        }
    }
}
