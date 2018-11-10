import XCTest
import Vectorizate

class CompoundTests: XCTestCase {
    
    let count = 1000

    func testVMA() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b: [T] = randomArray(count: count, in: 0..<1)
            let c: [T] = randomArray(count: count, in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vma(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vma(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 0..<1)
            let b: [T] = randomArray(count: count, in: 0..<1)
            let c: [T] = randomArray(count: count, in: 0..<1)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            Vectorizate.vma(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &ans1, iOut: 1, count: count)
            VectorizateNoAccelerate.vma(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
    }
}
