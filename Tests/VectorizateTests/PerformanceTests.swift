import XCTest
import Vectorizate

#if !DEBUG

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
}

#endif
