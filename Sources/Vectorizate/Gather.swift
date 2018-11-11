import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: - vgathr
    
    /// out[i * iOut] = a[b[i * ib]], for 0 <= i < count
    /// - Parameters:
    ///   - b: UInt vector containing **1-based** indices.
    public static func vgathr(a: UnsafePointer<Float>, b: UnsafePointer<UInt>, ib: Int,
                              out: UnsafeMutablePointer<Float>, iOut: Int,
                              count: Int) {
        vDSP_vgathr(a, b, ib, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = a[b[i * ib]], for 0 <= i < count
    /// - Parameters:
    ///   - b: UInt vector containing **1-based** indices.
    public static func vgathr(a: UnsafePointer<Double>, b: UnsafePointer<UInt>, ib: Int,
                              out: UnsafeMutablePointer<Double>, iOut: Int,
                              count: Int) {
        vDSP_vgathrD(a, b, ib, out, iOut, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: - vgathr
    
    private static func _vgathr<T>(a: UnsafePointer<T>, b: UnsafePointer<UInt>, ib: Int,
                                   out: UnsafeMutablePointer<T>, iOut: Int,
                                   count: Int) {
        var b = b
        var out = out
        for _ in 0..<count {
            out.pointee = a[Int(b.pointee)-1]
            b += ib
            out += iOut
        }
    }
    
    /// out[i * iOut] = a[b[i * ib]], for 0 <= i < count
    /// - Parameters:
    ///   - b: UInt vector containing **1-based** indices.
    public static func vgathr(a: UnsafePointer<Float>, b: UnsafePointer<UInt>, ib: Int,
                              out: UnsafeMutablePointer<Float>, iOut: Int,
                              count: Int) {
        _vgathr(a: a, b: b, ib: ib, out: out, iOut: iOut, count: count)
    }
    
    /// out[i * iOut] = a[b[i * ib]], for 0 <= i < count
    /// - Parameters:
    ///   - b: UInt vector containing **1-based** indices.
    public static func vgathr(a: UnsafePointer<Double>, b: UnsafePointer<UInt>, ib: Int,
                              out: UnsafeMutablePointer<Double>, iOut: Int,
                              count: Int) {
        _vgathr(a: a, b: b, ib: ib, out: out, iOut: iOut, count: count)
    }
}
