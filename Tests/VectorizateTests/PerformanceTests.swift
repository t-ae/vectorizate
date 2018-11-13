import XCTest
import Vectorizate

//#if !DEBUG

class PerformanceTests: XCTestCase {

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
        let count = 10000
        let x = [Float](repeating: 0, count: count)
        var out: Float = 0
        measure {
            for _ in 0..<10000 {
                VecOps.minv(x: x, ix: 1, out: &out, count: count)
            }
        }
    }
    
    func testMinv2() {
        let count = 10000
        let x = [Float](repeating: 0, count: count)
        var out: Float = 0
        measure {
            for _ in 0..<10000 {
                VecOpsNoAccelerate.minv(x: x, ix: 1, out: &out, count: count)
            }
        }
    }
    
    // MARK: mmov
    func testMMov2_1() {
        let matrix = [Double](repeating: 0, count: 100000*10)
        var out = [Double](repeating: 0, count: 100000*30)
        
        measure {
            for _ in 0..<100 {
                VecOps.mmov(x: matrix, out: &out, cols: 5, rows: 100000, tx: 10, tOut: 30)
            }
        }
    }
    
    func testMMov2_2() {
        let matrix = [Double](repeating: 0, count: 100000*10)
        var out = [Double](repeating: 0, count: 100000*30)
        
        measure {
            for _ in 0..<100 {
                VecOpsNoAccelerate.mmov(x: matrix, out: &out, cols: 5, rows: 100000, tx: 10, tOut: 30)
            }
        }
    }
    
}

//#endif
