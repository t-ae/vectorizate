import XCTest
import Vectorizate

#if !DEBUG

class PerformanceTests: XCTestCase {
    
    // MARK: vadd
    func testVAdd1() {
        let count = 10000
        let a = [Float](repeating: 0, count: count)
        let b = [Float](repeating: 0, count: count)
        var out = [Float](repeating: 0, count: count)
        measure {
            for _ in 0..<10000 {
                VecOps.vadd(a: a, ia: 1, b: b, ib: 1, out: &out, iOut: 1, count: count)
            }
        }
    }
    
    func testVAdd2() {
        let count = 10000
        let a = [Float](repeating: 0, count: count)
        let b = [Float](repeating: 0, count: count)
        var out = [Float](repeating: 0, count: count)
        measure {
            for _ in 0..<10000 {
                VecOpsNoAccelerate.vadd(a: a, ia: 1, b: b, ib: 1, out: &out, iOut: 1, count: count)
            }
        }
    }
    
    func testVAddWithStride1() {
        let count = 10000
        let a = [Float](repeating: 0, count: 2*count)
        let b = [Float](repeating: 0, count: 3*count)
        var out = [Float](repeating: 0, count: 4*count)
        measure {
            for _ in 0..<10000 {
                VecOps.vadd(a: a, ia: 2, b: b, ib: 3, out: &out, iOut: 4, count: count)
            }
        }
    }
    
    func testVAddWithStride2() {
        let count = 10000
        let a = [Float](repeating: 0, count: 2*count)
        let b = [Float](repeating: 0, count: 3*count)
        var out = [Float](repeating: 0, count: 4*count)
        measure {
            for _ in 0..<10000 {
                VecOpsNoAccelerate.vadd(a: a, ia: 2, b: b, ib: 3, out: &out, iOut: 4, count: count)
            }
        }
    }
    
    // MARK: vma
    func testVAMA1() {
        let count = 10000
        let a = [Float](repeating: 0, count: count)
        let b = [Float](repeating: 0, count: count)
        let c = [Float](repeating: 0, count: count)
        var out = [Float](repeating: 0, count: count)
        measure {
            for _ in 0..<10000 {
                VecOps.vma(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &out, iOut: 1, count: count)
            }
        }
    }
    
    func testVAMA2() {
        let count = 10000
        let a = [Float](repeating: 0, count: count)
        let b = [Float](repeating: 0, count: count)
        let c = [Float](repeating: 0, count: count)
        var out = [Float](repeating: 0, count: count)
        measure {
            for _ in 0..<10000 {
                VecOpsNoAccelerate.vma(a: a, ia: 1, b: b, ib: 1, c: c, ic: 1, out: &out, iOut: 1, count: count)
            }
        }
    }
    
    func testVAMAWithStride1() {
        let count = 10000
        let a = [Float](repeating: 0, count: 2*count)
        let b = [Float](repeating: 0, count: 3*count)
        let c = [Float](repeating: 0, count: 4*count)
        var out = [Float](repeating: 0, count: 5*count)
        measure {
            for _ in 0..<10000 {
                VecOps.vma(a: a, ia: 2, b: b, ib: 3, c: c, ic: 4, out: &out, iOut: 5, count: count)
            }
        }
    }
    
    func testVAMAWithStride2() {
        let count = 10000
        let a = [Float](repeating: 0, count: 2*count)
        let b = [Float](repeating: 0, count: 3*count)
        let c = [Float](repeating: 0, count: 4*count)
        var out = [Float](repeating: 0, count: 5*count)
        measure {
            for _ in 0..<10000 {
                VecOpsNoAccelerate.vma(a: a, ia: 2, b: b, ib: 3, c: c, ic: 4, out: &out, iOut: 5, count: count)
            }
        }
    }

    // MARK: sve
    func testSve1() {
        let count = 10000
        let x = [Float](repeating: 0, count: count)
        var out: Float = 0
        measure {
            for _ in 0..<10000 {
                VecOps.sve(x: x, ix: 1, out: &out, count: count)
            }
        }
    }
    
    func testSve2() {
        let count = 10000
        let x = [Float](repeating: 0, count: count)
        var out: Float = 0
        measure {
            for _ in 0..<10000 {
                VecOpsNoAccelerate.sve(x: x, ix: 1, out: &out, count: count)
            }
        }
    }
    
    // MARK: vmin
    func testMinv1() {
        let count = 100000
        let x = [Float](repeating: 0, count: count)
        var out: Float = 0
        measure {
            for _ in 0..<10000 {
                VecOps.minv(x: x, ix: 1, out: &out, count: count)
            }
        }
    }
    
    func testMinv2() {
        let count = 100000
        let x = [Float](repeating: 0, count: count)
        var out: Float = 0
        measure {
            for _ in 0..<10000 {
                VecOpsNoAccelerate.minv(x: x, ix: 1, out: &out, count: count)
            }
        }
    }
    
    // MARK: vsin
    func testVSin1() {
        let count = 1000000
        let a = [Float](repeating: 0, count: count)
        var out = [Float](repeating: 0, count: count)
        measure {
            for _ in 0..<1000 {
                VecOps.vsin(x: a, out: &out, count: count)
            }
        }
    }
    
    func testVSin2() {
        let count = 1000000
        let a = [Float](repeating: 0, count: count)
        var out = [Float](repeating: 0, count: count)
        measure {
            for _ in 0..<1000 {
                VecOpsNoAccelerate.vsin(x: a, out: &out, count: count)
            }
        }
    }
    // MARK: vatan2
    func testVATan2_1() {
        let count = 1000000
        let a = [Float](repeating: 0, count: count)
        let b = [Float](repeating: 0, count: count)
        var out = [Float](repeating: 0, count: count)
        measure {
            for _ in 0..<1000 {
                VecOps.vatan2(y: a, x: b, out: &out, count: count)
            }
        }
    }
    
    func testVAtan2_2() {
        let count = 1000000
        let a = [Float](repeating: 0, count: count)
        let b = [Float](repeating: 0, count: count)
        var out = [Float](repeating: 0, count: count)
        measure {
            for _ in 0..<1000 {
                VecOpsNoAccelerate.vatan2(y: a, x: b, out: &out, count: count)
            }
        }
    }
    
    // MARK: vrsqrt
    func testVRSqrt1() {
        let count = 1000000
        let a = [Float](repeating: 0, count: count)
        var out = [Float](repeating: 0, count: count)
        measure {
            for _ in 0..<1000 {
                VecOps.vrsqrt(x: a, out: &out, count: count)
            }
        }
    }
    
    func testVRSqrt2() {
        let count = 1000000
        let a = [Float](repeating: 0, count: count)
        var out = [Float](repeating: 0, count: count)
        measure {
            for _ in 0..<1000 {
                VecOpsNoAccelerate.vrsqrt(x: a, out: &out, count: count)
            }
        }
    }
    
    // MARK: mmov
    func testMMov1() {
        let matrix = [Double](repeating: 0, count: 100000*10)
        var out = [Double](repeating: 0, count: 100000*30)
        
        measure {
            for _ in 0..<100 {
                VecOps.mmov(x: matrix, out: &out, cols: 5, rows: 100000, tx: 10, tOut: 30)
            }
        }
    }
    
    func testMMov2() {
        let matrix = [Double](repeating: 0, count: 100000*10)
        var out = [Double](repeating: 0, count: 100000*30)
        
        measure {
            for _ in 0..<100 {
                VecOpsNoAccelerate.mmov(x: matrix, out: &out, cols: 5, rows: 100000, tx: 10, tOut: 30)
            }
        }
    }
    
}

#endif
