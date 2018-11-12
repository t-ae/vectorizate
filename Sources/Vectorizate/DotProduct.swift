import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    
    // MARK: dotpr

    /// Calculate dot product of two vectors.
    ///
    /// out = sum(a[i * ia] * b[i * ib]), for 0 <= i < count
    public static func dotpr(a: UnsafePointer<Float>, ia: Int,
                             b: UnsafePointer<Float>, ib: Int,
                             out: inout Float, count: Int) {
        vDSP_dotpr(a, ia, b, ib, &out, UInt(count))
    }
    
    /// Calculate dot product of two vectors.
    ///
    /// out = sum(a[i * ia] * b[i * ib]), for 0 <= i < count
    public static func dotpr(a: UnsafePointer<Double>, ia: Int,
                             b: UnsafePointer<Double>, ib: Int,
                             out: inout Double, count: Int) {
        vDSP_dotprD(a, ia, b, ib, &out, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    
    // MARK: dotpr
    
    /// Calculate dot product of two vectors.
    ///
    /// out = sum(a[i * ia] * b[i * ib]), for 0 <= i < count
    public static func dotpr(a: UnsafePointer<Float>, ia: Int,
                             b: UnsafePointer<Float>, ib: Int,
                             out: inout Float, count: Int) {
        reduce2(a: a, ia: ia, b: b, ib: ib, out: &out, operation: {
            $0 += $1*$2
        }, count: count)
    }
    
    /// Calculate dot product of two vectors.
    ///
    /// out = sum(a[i * ia] * b[i * ib]), for 0 <= i < count
    public static func dotpr(a: UnsafePointer<Double>, ia: Int,
                             b: UnsafePointer<Double>, ib: Int,
                             out: inout Double, count: Int) {
        reduce2(a: a, ia: ia, b: b, ib: ib, out: &out, operation: {
            $0 += $1*$2
        }, count: count)
    }
}
