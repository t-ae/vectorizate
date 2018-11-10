import XCTest
import Vectorizate

class Vector_ScalarArithmeticTests: XCTestCase {

    let count = 1000
    
    func testVSAdd() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b = T.random(in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vsadd(a: a, ia: 1, b: b, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vsadd(a: a, ia: 1, b: b, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b = T.random(in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vsadd(a: a, ia: 1, b: b, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vsadd(a: a, ia: 1, b: b, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
    }

    func testVSSub() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b = T.random(in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vssub(a: a, ia: 1, b: b, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vssub(a: a, ia: 1, b: b, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b = T.random(in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vssub(a: a, ia: 1, b: b, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vssub(a: a, ia: 1, b: b, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
    }
    
    func testVSMul() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b = T.random(in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vsmul(a: a, ia: 1, b: b, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vsmul(a: a, ia: 1, b: b, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b = T.random(in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vsmul(a: a, ia: 1, b: b, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vsmul(a: a, ia: 1, b: b, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
    }
    
    func testVSDiv() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b = T.random(in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vsdiv(a: a, ia: 1, b: b, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vsdiv(a: a, ia: 1, b: b, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-4)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b = T.random(in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vsdiv(a: a, ia: 1, b: b, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vsdiv(a: a, ia: 1, b: b, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-8)
        }
    }
}
