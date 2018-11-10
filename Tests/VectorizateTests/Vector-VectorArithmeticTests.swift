import XCTest
import Vectorizate

class Vector_VectorArithmeticTests: XCTestCase {
    
    let count = 100
    
    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, Int, UnsafePointer<F>, Int, UnsafeMutablePointer<F>, Int, Int)->Void,
        func2: (UnsafePointer<F>, Int, UnsafePointer<F>, Int, UnsafeMutablePointer<F>, Int, Int)->Void,
        ia: Int, ib: Int, iOut: Int,
        accuracy: F = 0,
        file: StaticString = #file, line: UInt = #line)
        where F.RawSignificand: FixedWidthInteger {
            let a: [F] = randomArray(count: count*ia, in: 0..<10)
            let b: [F] = randomArray(count: count*ib, in: 1..<10)
            var ans1 = [F](repeating: 0, count: count*iOut)
            var ans2 = [F](repeating: 0, count: count*iOut)
            
            func1(a, ia, b, ib, &ans1, iOut, count)
            func2(a, ia, b, ib, &ans2, iOut, count)
            
            XCTAssertEqual(ans1, ans2, accuracy: accuracy, file: file, line: line)
    }
    
    func testVAdd() {
        do {
            typealias T = Float
            runTest(type: T.self,
                    func1: VecOps.vadd, func2: VecOpsNoAccelerate.vadd,
                    ia: 1, ib: 1, iOut: 1)
            runTest(type: T.self,
                    func1: VecOps.vadd, func2: VecOpsNoAccelerate.vadd,
                    ia: 2, ib: 2, iOut: 1)
            runTest(type: T.self,
                    func1: VecOps.vadd, func2: VecOpsNoAccelerate.vadd,
                    ia: 1, ib: 1, iOut: 2)
            runTest(type: T.self,
                    func1: VecOps.vadd, func2: VecOpsNoAccelerate.vadd,
                    ia: 3, ib: 2, iOut: 4)
        }
        do {
            typealias T = Double
            runTest(type: T.self,
                    func1: VecOps.vadd, func2: VecOpsNoAccelerate.vadd,
                    ia: 1, ib: 1, iOut: 1)
            runTest(type: T.self,
                    func1: VecOps.vadd, func2: VecOpsNoAccelerate.vadd,
                    ia: 2, ib: 2, iOut: 1)
            runTest(type: T.self,
                    func1: VecOps.vadd, func2: VecOpsNoAccelerate.vadd,
                    ia: 1, ib: 1, iOut: 2)
            runTest(type: T.self,
                    func1: VecOps.vadd, func2: VecOpsNoAccelerate.vadd,
                    ia: 3, ib: 2, iOut: 4)
        }
    }
    
    func testVSub() {
        do {
            typealias T = Float
            runTest(type: T.self,
                    func1: VecOps.vsub, func2: VecOpsNoAccelerate.vsub,
                    ia: 1, ib: 1, iOut: 1)
            runTest(type: T.self,
                    func1: VecOps.vsub, func2: VecOpsNoAccelerate.vsub,
                    ia: 2, ib: 2, iOut: 1)
            runTest(type: T.self,
                    func1: VecOps.vsub, func2: VecOpsNoAccelerate.vsub,
                    ia: 1, ib: 1, iOut: 2)
            runTest(type: T.self,
                    func1: VecOps.vsub, func2: VecOpsNoAccelerate.vsub,
                    ia: 3, ib: 2, iOut: 4)
        }
        do {
            typealias T = Double
            runTest(type: T.self,
                    func1: VecOps.vsub, func2: VecOpsNoAccelerate.vsub,
                    ia: 1, ib: 1, iOut: 1)
            runTest(type: T.self,
                    func1: VecOps.vsub, func2: VecOpsNoAccelerate.vsub,
                    ia: 2, ib: 2, iOut: 1)
            runTest(type: T.self,
                    func1: VecOps.vsub, func2: VecOpsNoAccelerate.vsub,
                    ia: 1, ib: 1, iOut: 2)
            runTest(type: T.self,
                    func1: VecOps.vsub, func2: VecOpsNoAccelerate.vsub,
                    ia: 3, ib: 2, iOut: 4)
        }
    }
    
    func testVMul() {
        do {
            typealias T = Float
            runTest(type: T.self,
                    func1: VecOps.vmul, func2: VecOpsNoAccelerate.vmul,
                    ia: 1, ib: 1, iOut: 1)
            runTest(type: T.self,
                    func1: VecOps.vmul, func2: VecOpsNoAccelerate.vmul,
                    ia: 2, ib: 2, iOut: 1)
            runTest(type: T.self,
                    func1: VecOps.vmul, func2: VecOpsNoAccelerate.vmul,
                    ia: 1, ib: 1, iOut: 2)
            runTest(type: T.self,
                    func1: VecOps.vmul, func2: VecOpsNoAccelerate.vmul,
                    ia: 3, ib: 2, iOut: 4)
        }
        do {
            typealias T = Double
            runTest(type: T.self,
                    func1: VecOps.vmul, func2: VecOpsNoAccelerate.vmul,
                    ia: 1, ib: 1, iOut: 1)
            runTest(type: T.self,
                    func1: VecOps.vmul, func2: VecOpsNoAccelerate.vmul,
                    ia: 2, ib: 2, iOut: 1)
            runTest(type: T.self,
                    func1: VecOps.vmul, func2: VecOpsNoAccelerate.vmul,
                    ia: 1, ib: 1, iOut: 2)
            runTest(type: T.self,
                    func1: VecOps.vmul, func2: VecOpsNoAccelerate.vmul,
                    ia: 3, ib: 2, iOut: 4)
        }
    }
    
    func testVDiv() {
        do {
            typealias T = Float
            let accuracy: T = 1e-4
            runTest(type: T.self,
                    func1: VecOps.vdiv, func2: VecOpsNoAccelerate.vdiv,
                    ia: 1, ib: 1, iOut: 1, accuracy: accuracy)
            runTest(type: T.self,
                    func1: VecOps.vdiv, func2: VecOpsNoAccelerate.vdiv,
                    ia: 2, ib: 2, iOut: 1, accuracy: accuracy)
            runTest(type: T.self,
                    func1: VecOps.vdiv, func2: VecOpsNoAccelerate.vdiv,
                    ia: 1, ib: 1, iOut: 2, accuracy: accuracy)
            runTest(type: T.self,
                    func1: VecOps.vdiv, func2: VecOpsNoAccelerate.vdiv,
                    ia: 3, ib: 2, iOut: 4, accuracy: accuracy)
        }
        do {
            typealias T = Double
            let accuracy: T = 1e-8
            runTest(type: T.self,
                    func1: VecOps.vdiv, func2: VecOpsNoAccelerate.vdiv,
                    ia: 1, ib: 1, iOut: 1, accuracy: accuracy)
            runTest(type: T.self,
                    func1: VecOps.vdiv, func2: VecOpsNoAccelerate.vdiv,
                    ia: 2, ib: 2, iOut: 1, accuracy: accuracy)
            runTest(type: T.self,
                    func1: VecOps.vdiv, func2: VecOpsNoAccelerate.vdiv,
                    ia: 1, ib: 1, iOut: 2, accuracy: accuracy)
            runTest(type: T.self,
                    func1: VecOps.vdiv, func2: VecOpsNoAccelerate.vdiv,
                    ia: 3, ib: 2, iOut: 4, accuracy: accuracy)
        }
    }
}
