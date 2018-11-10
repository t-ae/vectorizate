import XCTest
import Vectorizate

class CastTests: XCTestCase {
    func runTest<From, To: ExpressibleByIntegerLiteral&Comparable>(
        to: To.Type, x: [From], ix: Int, iOut: Int,
        func1: (UnsafePointer<From>, Int, UnsafeMutablePointer<To>, Int, Int)->Void,
        func2: (UnsafePointer<From>, Int, UnsafeMutablePointer<To>, Int, Int)->Void,
        file: StaticString = #file, line: UInt = #line) {
            var ans1 = [To](repeating: 0, count: x.count/ix*iOut)
            var ans2 = [To](repeating: 0, count: x.count/ix*iOut)
            
            func1(x, ix, &ans1, iOut, x.count/ix)
            func2(x, ix, &ans2, iOut, x.count/ix)
            
            XCTAssertEqual(ans1, ans2, file: file, line: line)
    }
    
    func testVFlt() {
        do {
            typealias To = Float
            do {
                typealias From = UInt8
                let x = [From](0...255)
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
            }
            do {
                typealias From = UInt16
                let x = [From](0...255)
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
            }
            do {
                typealias From = UInt32
                let x = [From](0...255)
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
            }
            do {
                typealias From = Int8
                let x = [From](-128...127)
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
            }
            do {
                typealias From = Int16
                let x = [From](-128...127)
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
            }
            do {
                typealias From = Int32
                let x = [From](-128...127)
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
            }
        }
        do {
            typealias To = Double
            do {
                typealias From = UInt8
                let x = [From](0...255)
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
            }
            do {
                typealias From = UInt16
                let x = [From](0...255)
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
            }
            do {
                typealias From = UInt32
                let x = [From](0...255)
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
            }
            do {
                typealias From = Int8
                let x = [From](-128...127)
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
            }
            do {
                typealias From = Int16
                let x = [From](-128...127)
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
            }
            do {
                typealias From = Int32
                let x = [From](-128...127)
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vflt, func2: VecOpsNoAccelerate.vflt)
            }
        }
    }
    
    func testFix() {
        do {
            typealias From = Float
            do {
                typealias To = UInt8
                let x = [From](stride(from: 0, to: 10, by: 0.1))
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfix, func2: VecOpsNoAccelerate.vfix)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfix, func2: VecOpsNoAccelerate.vfix)
            }
            do {
                typealias To = UInt16
                let x = [From](stride(from: 0, to: 10, by: 0.1))
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfix, func2: VecOpsNoAccelerate.vfix)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfix, func2: VecOpsNoAccelerate.vfix)
            }
            do {
                typealias To = UInt32
                let x = [From](stride(from: 0, to: 10, by: 0.1))
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfix, func2: VecOpsNoAccelerate.vfix)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfix, func2: VecOpsNoAccelerate.vfix)
            }
            do {
                typealias To = Int8
                let x = [From](stride(from: -10, to: 10, by: 0.1))
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfix, func2: VecOpsNoAccelerate.vfix)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfix, func2: VecOpsNoAccelerate.vfix)
            }
            do {
                typealias To = Int16
                let x = [From](stride(from: -10, to: 10, by: 0.1))
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfix, func2: VecOpsNoAccelerate.vfix)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfix, func2: VecOpsNoAccelerate.vfix)
            }
            do {
                typealias To = Int32
                let x = [From](stride(from: -10, to: 10, by: 0.1))
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfix, func2: VecOpsNoAccelerate.vfix)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfix, func2: VecOpsNoAccelerate.vfix)
            }
        }
    }
    
    func testFixr() {
        // It seems all vDSP_vfixr* convert 0.5 to 0.
        // Add 0.01 to avoid 0.5.
        do {
            typealias From = Float
            do {
                typealias To = UInt8
                let x = [From](stride(from: 0, to: 10, by: 0.1)).map { $0+0.01 }
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
            }
            do {
                typealias To = UInt16
                let x = [From](stride(from: 0, to: 10, by: 0.1)).map { $0+0.01 }
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
            }
            do {
                typealias To = UInt32
                let x = [From](stride(from: 0, to: 10, by: 0.1)).map { $0+0.01 }
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
            }
            do {
                typealias To = Int8
                let x = [From](stride(from: -10, to: 10, by: 0.1)).map { $0+0.01 }
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
            }
            do {
                typealias To = Int16
                let x = [From](stride(from: -10, to: 10, by: 0.1)).map { $0+0.01 }
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
            }
            do {
                typealias To = Int32
                let x = [From](stride(from: -10, to: 10, by: 0.1)).map { $0+0.01 }
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
            }
        }
        do {
            typealias From = Double
            do {
                typealias To = UInt8
                let x = [From](stride(from: 0, to: 10, by: 0.1)).map { $0+0.01 }
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
            }
            do {
                typealias To = UInt16
                let x = [From](stride(from: 0, to: 10, by: 0.1)).map { $0+0.01 }
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
            }
            do {
                typealias To = UInt32
                let x = [From](stride(from: 0, to: 10, by: 0.1)).map { $0+0.01 }
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
            }
            do {
                typealias To = Int8
                let x = [From](stride(from: -10, to: 10, by: 0.1)).map { $0+0.01 }
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
            }
            do {
                typealias To = Int16
                let x = [From](stride(from: -10, to: 10, by: 0.1)).map { $0+0.01 }
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
            }
            do {
                typealias To = Int32
                let x = [From](stride(from: -10, to: 10, by: 0.1)).map { $0+0.01 }
                runTest(to: To.self, x: x, ix: 1, iOut: 1, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
                runTest(to: To.self, x: x, ix: 2, iOut: 3, func1: VecOps.vfixr, func2: VecOpsNoAccelerate.vfixr)
            }
        }
    }
}
