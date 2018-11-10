import XCTest
import Vectorizate

class SingleVectorArithmericTests: XCTestCase {

    let count = 100
    
    func runTest<F: BinaryFloatingPoint>(
        type: F.Type,
        func1: (UnsafePointer<F>, Int, UnsafeMutablePointer<F>, Int, Int)->Void,
        func2: (UnsafePointer<F>, Int, UnsafeMutablePointer<F>, Int, Int)->Void,
        ix: Int, iOut: Int,
        accuracy: F = 0,
        file: StaticString = #file, line: UInt = #line)
        where F.RawSignificand: FixedWidthInteger {
            let x: [F] = randomArray(count: count*ix, in: -1..<1)
            var ans1 = [F](repeating: 0, count: count*iOut)
            var ans2 = [F](repeating: 0, count: count*iOut)
            
            func1(x, ix, &ans1, iOut, count)
            func2(x, ix, &ans2, iOut, count)
            
            XCTAssertEqual(ans1, ans2, accuracy: accuracy, file: file, line: line)
    }
    
    
    func testVAbs() {
        runTest(type: Float.self, func1: Vectorizate.vabs, func2: VectorizateNoAccelerate.vabs, ix: 1, iOut: 1)
        runTest(type: Float.self, func1: Vectorizate.vabs, func2: VectorizateNoAccelerate.vabs, ix: 3, iOut: 2)
        
        runTest(type: Double.self, func1: Vectorizate.vabs, func2: VectorizateNoAccelerate.vabs, ix: 1, iOut: 1)
        runTest(type: Double.self, func1: Vectorizate.vabs, func2: VectorizateNoAccelerate.vabs, ix: 3, iOut: 2)
    }
    
    func testVNAbs() {
        runTest(type: Float.self, func1: Vectorizate.vnabs, func2: VectorizateNoAccelerate.vnabs, ix: 1, iOut: 1)
        runTest(type: Float.self, func1: Vectorizate.vnabs, func2: VectorizateNoAccelerate.vnabs, ix: 3, iOut: 2)
        
        runTest(type: Double.self, func1: Vectorizate.vnabs, func2: VectorizateNoAccelerate.vnabs, ix: 1, iOut: 1)
        runTest(type: Double.self, func1: Vectorizate.vnabs, func2: VectorizateNoAccelerate.vnabs, ix: 3, iOut: 2)
    }
    
    func testVNeg() {
        runTest(type: Float.self, func1: Vectorizate.vneg, func2: VectorizateNoAccelerate.vneg, ix: 1, iOut: 1)
        runTest(type: Float.self, func1: Vectorizate.vneg, func2: VectorizateNoAccelerate.vneg, ix: 3, iOut: 2)
        
        runTest(type: Double.self, func1: Vectorizate.vneg, func2: VectorizateNoAccelerate.vneg, ix: 1, iOut: 1)
        runTest(type: Double.self, func1: Vectorizate.vneg, func2: VectorizateNoAccelerate.vneg, ix: 3, iOut: 2)
    }
    
    func testVSq() {
        runTest(type: Float.self, func1: Vectorizate.vsq, func2: VectorizateNoAccelerate.vsq, ix: 1, iOut: 1)
        runTest(type: Float.self, func1: Vectorizate.vsq, func2: VectorizateNoAccelerate.vsq, ix: 3, iOut: 2)
        
        runTest(type: Double.self, func1: Vectorizate.vsq, func2: VectorizateNoAccelerate.vsq, ix: 1, iOut: 1)
        runTest(type: Double.self, func1: Vectorizate.vsq, func2: VectorizateNoAccelerate.vsq, ix: 3, iOut: 2)
    }
    
    func testVSSq() {
        runTest(type: Float.self, func1: Vectorizate.vssq, func2: VectorizateNoAccelerate.vssq, ix: 1, iOut: 1)
        runTest(type: Float.self, func1: Vectorizate.vssq, func2: VectorizateNoAccelerate.vssq, ix: 3, iOut: 2)
        
        runTest(type: Double.self, func1: Vectorizate.vssq, func2: VectorizateNoAccelerate.vssq, ix: 1, iOut: 1)
        runTest(type: Double.self, func1: Vectorizate.vssq, func2: VectorizateNoAccelerate.vssq, ix: 3, iOut: 2)
    }
}
