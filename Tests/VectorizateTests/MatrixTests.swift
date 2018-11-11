import XCTest
import Vectorizate

class MatrixTests: XCTestCase {

    func testMMul() {
        do {
            typealias F = Float
            func runTest(ia: Int, ib: Int, iOut: Int,
                         m: Int, n: Int, p: Int,
                         file: StaticString = #file, line: UInt = #line)  {
                let a: [F] = (0..<m*p*ia).map { F($0) }
                let b: [F] = (0..<p*n*ib).map { F($0) }
                
                var ans1 = [F](repeating: 0, count: m*n*iOut)
                var ans2 = [F](repeating: 0, count: m*n*iOut)
                
                VecOps.mmul(a: a, ia: ia, b: b, ib: ib, out: &ans1, iOut: iOut, m: m, n: n, p: p)
                VecOpsNoAccelerate.mmul(a: a, ia: ia, b: b, ib: ib, out: &ans2, iOut: iOut, m: m, n: n, p: p)

                XCTAssertEqual(ans1, ans2, file: file, line: line)
            }
            
            runTest(ia: 1, ib: 1, iOut: 1, m: 2, n: 5, p: 4)
            runTest(ia: 2, ib: 3, iOut: 5, m: 3, n: 13, p: 5)
        }
        do {
            typealias F = Double
            func runTest(ia: Int, ib: Int, iOut: Int,
                         m: Int, n: Int, p: Int,
                         file: StaticString = #file, line: UInt = #line)  {
                let a: [F] = (0..<m*p*ia).map { F($0) }
                let b: [F] = (0..<p*n*ib).map { F($0) }
                
                var ans1 = [F](repeating: 0, count: m*n*iOut)
                var ans2 = [F](repeating: 0, count: m*n*iOut)
                
                VecOps.mmul(a: a, ia: ia, b: b, ib: ib, out: &ans1, iOut: iOut, m: m, n: n, p: p)
                VecOpsNoAccelerate.mmul(a: a, ia: ia, b: b, ib: ib, out: &ans2, iOut: iOut, m: m, n: n, p: p)
                
                XCTAssertEqual(ans1, ans2, file: file, line: line)
            }
            
            runTest(ia: 1, ib: 1, iOut: 1, m: 2, n: 5, p: 4)
            runTest(ia: 2, ib: 3, iOut: 5, m: 3, n: 13, p: 5)
        }
    }

    func testMTrans() {
        do {
            typealias F = Float
            func runTest(ix: Int, iOut: Int,
                         m: Int, n: Int,
                         file: StaticString = #file, line: UInt = #line)  {
                let x: [F] = randomArray(count: n*m*ix, in: 0..<1)
                
                var ans1 = [F](repeating: 0, count: m*n*iOut)
                var ans2 = [F](repeating: 0, count: m*n*iOut)
                
                VecOps.mtrans(x: x, ix: ix, out: &ans1, iOut: iOut, m: m, n: n)
                VecOpsNoAccelerate.mtrans(x: x, ix: ix, out: &ans2, iOut: iOut, m: m, n: n)
                
                XCTAssertEqual(ans1, ans2, file: file, line: line)
            }
            
            runTest(ix: 1, iOut: 1, m: 3, n: 5)
            runTest(ix: 2, iOut: 3, m: 5, n: 7)
        }
        do {
            typealias F = Double
            func runTest(ix: Int, iOut: Int,
                         m: Int, n: Int,
                         file: StaticString = #file, line: UInt = #line)  {
                let x: [F] = randomArray(count: n*m*ix, in: 0..<1)
                
                var ans1 = [F](repeating: 0, count: m*n*iOut)
                var ans2 = [F](repeating: 0, count: m*n*iOut)
                
                VecOps.mtrans(x: x, ix: ix, out: &ans1, iOut: iOut, m: m, n: n)
                VecOpsNoAccelerate.mtrans(x: x, ix: ix, out: &ans2, iOut: iOut, m: m, n: n)
                
                XCTAssertEqual(ans1, ans2, file: file, line: line)
            }
            
            runTest(ix: 1, iOut: 1, m: 3, n: 5)
            runTest(ix: 2, iOut: 3, m: 5, n: 7)
        }
    }
    
    func testMMov() {
        do {
            typealias F = Float
            func runTest(cols: Int, rows: Int,
                         tx: Int, tOut: Int,
                         file: StaticString = #file, line: UInt = #line)  {
                let x: [F] = randomArray(count: rows*tx, in: 0..<1)

                var ans1 = [F](repeating: 0, count: rows*tOut)
                var ans2 = [F](repeating: 0, count: rows*tOut)

                VecOps.mmov(x: x, out: &ans1, cols: cols, rows: rows, tx: tx, tOut: tOut)
                VecOpsNoAccelerate.mmov(x: x, out: &ans2, cols: cols, rows: rows, tx: tx, tOut: tOut)

                XCTAssertEqual(ans1, ans2, file: file, line: line)
            }
            
            runTest(cols: 5, rows: 3, tx: 5, tOut: 5)
            runTest(cols: 4, rows: 3, tx: 5, tOut: 7)
        }
        do {
            typealias F = Double
            func runTest(cols: Int, rows: Int,
                         tx: Int, tOut: Int,
                         file: StaticString = #file, line: UInt = #line)  {
                let x: [F] = randomArray(count: rows*tx, in: 0..<1)
                
                var ans1 = [F](repeating: 0, count: rows*tOut)
                var ans2 = [F](repeating: 0, count: rows*tOut)
                
                VecOps.mmov(x: x, out: &ans1, cols: cols, rows: rows, tx: tx, tOut: tOut)
                VecOpsNoAccelerate.mmov(x: x, out: &ans2, cols: cols, rows: rows, tx: tx, tOut: tOut)
                
                XCTAssertEqual(ans1, ans2, file: file, line: line)
            }
            
            runTest(cols: 5, rows: 3, tx: 5, tOut: 5)
            runTest(cols: 4, rows: 3, tx: 5, tOut: 7)
        }
    }
}
