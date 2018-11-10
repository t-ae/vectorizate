import XCTest
import Vectorizate

class Vector_VectorArithmeticTests: XCTestCase {
    
    let count = 10

    func testVAdd() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b: [T] = randomArray(count: count, in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vadd(a: a, ia: 1, b: b, ib: 1, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vadd(a: a, ia: 1, b: b, ib: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b: [T] = randomArray(count: count, in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vadd(a: a, ia: 1, b: b, ib: 1, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vadd(a: a, ia: 1, b: b, ib: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
    }
    
    func testVSSub() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b: [T] = randomArray(count: count, in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vsub(a: a, ia: 1, b: b, ib: 1, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vsub(a: a, ia: 1, b: b, ib: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b: [T] = randomArray(count: count, in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vsub(a: a, ia: 1, b: b, ib: 1, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vsub(a: a, ia: 1, b: b, ib: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
    }
    
    func testVMul() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b: [T] = randomArray(count: count, in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vmul(a: a, ia: 1, b: b, ib: 1, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vmul(a: a, ia: 1, b: b, ib: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b: [T] = randomArray(count: count, in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vmul(a: a, ia: 1, b: b, ib: 1, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vmul(a: a, ia: 1, b: b, ib: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
    }
    
    func testVDiv() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b: [T] = randomArray(count: count, in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vdiv(a: a, ia: 1, b: b, ib: 1, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vdiv(a: a, ia: 1, b: b, ib: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-4)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b: [T] = randomArray(count: count, in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vdiv(a: a, ia: 1, b: b, ib: 1, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vdiv(a: a, ia: 1, b: b, ib: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-8)
        }
    }

}
