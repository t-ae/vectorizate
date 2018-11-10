import XCTest
import Vectorizate

class CompoundTests: XCTestCase {
    
    let count = 100

    func testVMA() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 1..<2)
            let b: [T] = randomArray(count: count, in: 1..<2)
            let c: [T] = randomArray(count: count, in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            VecOps.vma(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &ans1, iOut: 1, count: count)
            VecOpsNoAccelerate.vma(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 1..<2)
            let b: [T] = randomArray(count: count, in: 1..<2)
            let c: [T] = randomArray(count: count, in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            VecOps.vma(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &ans1, iOut: 1, count: count)
            VecOpsNoAccelerate.vma(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
    }
    
    func testVMSb() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 1..<2)
            let b: [T] = randomArray(count: count, in: 1..<2)
            let c: [T] = randomArray(count: count, in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            VecOps.vmsb(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &ans1, iOut: 1, count: count)
            VecOpsNoAccelerate.vmsb(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-6)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 1..<2)
            let b: [T] = randomArray(count: count, in: 1..<2)
            let c: [T] = randomArray(count: count, in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            VecOps.vmsb(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &ans1, iOut: 1, count: count)
            VecOpsNoAccelerate.vmsb(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
    }
    
    func testVMSA() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 1..<2)
            let b: [T] = randomArray(count: count, in: 1..<2)
            let c = T.random(in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            VecOps.vmsa(a: a, ia: 1, b: b, ib: 1, c: c, out: &ans1, iOut: 1, count: count)
            VecOpsNoAccelerate.vmsa(a: a, ia: 1, b: b, ib: 1, c: c, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-6)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 1..<2)
            let b: [T] = randomArray(count: count, in: 1..<2)
            let c = T.random(in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            VecOps.vmsa(a: a, ia: 1, b: b, ib: 1, c: c, out: &ans1, iOut: 1, count: count)
            VecOpsNoAccelerate.vmsa(a: a, ia: 1, b: b, ib: 1, c: c, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
    }
    
    func testVSMA() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 1..<2)
            let b = T.random(in: 1..<2)
            let c: [T] = randomArray(count: count, in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            VecOps.vsma(a: a, ia: 1, b: b, c: c, ic: 1, out: &ans1, iOut: 1, count: count)
            VecOpsNoAccelerate.vsma(a: a, ia: 1, b: b, c: c, ic: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-6)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 1..<2)
            let b = T.random(in: 1..<2)
            let c: [T] = randomArray(count: count, in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            VecOps.vsma(a: a, ia: 1, b: b, c: c, ic: 1, out: &ans1, iOut: 1, count: count)
            VecOpsNoAccelerate.vsma(a: a, ia: 1, b: b, c: c, ic: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2)
        }
    }
    
    func testVSMSb() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 1..<2)
            let b = T.random(in: 1..<2)
            let c: [T] = randomArray(count: count, in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            VecOps.vsmsb(a: a, ia: 1, b: b, c: c, ic: 1, out: &ans1, iOut: 1, count: count)
            VecOpsNoAccelerate.vsmsb(a: a, ia: 1, b: b, c: c, ic: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-6)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 1..<2)
            let b = T.random(in: 1..<2)
            let c: [T] = randomArray(count: count, in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            VecOps.vsmsb(a: a, ia: 1, b: b, c: c, ic: 1, out: &ans1, iOut: 1, count: count)
            VecOpsNoAccelerate.vsmsb(a: a, ia: 1, b: b, c: c, ic: 1, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-8)
        }
    }
    
    func testVSMSA() {
        do {
            typealias T = Float
            let a: [T] = randomArray(count: count, in: 1..<2)
            let b = T.random(in: 1..<2)
            let c = T.random(in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            VecOps.vsmsa(a: a, ia: 1, b: b, c: c, out: &ans1, iOut: 1, count: count)
            VecOpsNoAccelerate.vsmsa(a: a, ia: 1, b: b, c: c, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-6)
        }
        do {
            typealias T = Double
            let a: [T] = randomArray(count: count, in: 1..<2)
            let b = T.random(in: 1..<2)
            let c = T.random(in: 1..<2)
            var ans1 = [T](repeating: 0, count: count)
            var ans2 = [T](repeating: 0, count: count)
            
            VecOps.vsmsa(a: a, ia: 1, b: b, c: c, out: &ans1, iOut: 1, count: count)
            VecOpsNoAccelerate.vsmsa(a: a, ia: 1, b: b, c: c, out: &ans2, iOut: 1, count: count)
            
            XCTAssertEqual(ans1, ans2, accuracy: 1e-12)
        }
    }
}
