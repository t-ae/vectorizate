import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vdist
    
    /// out[i * iOut] = sqrt(a[i * ia]**2 + b[i * ib]**2), for 0 <= i < count
    public static func vdist(a: UnsafePointer<Float>, ia: Int,
                             b: UnsafePointer<Float>, ib: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        vDSP_vdist(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = sqrt(a[i * ia]**2 + b[i * ib]**2), for 0 <= i < count
    public static func vdist(a: UnsafePointer<Double>, ia: Int,
                             b: UnsafePointer<Double>, ib: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        vDSP_vdistD(a, ia, b, ib, out, iOut, UInt(count))
    }

    // MARK: distancesq
    
    /// Calculate euclidian distance of two vectors.
    /// out = sqrt(sum((a[i * ia] - b[i * ib]) ** 2))
    public static func distancesq(a: UnsafePointer<Float>, ia: Int,
                                  b: UnsafePointer<Float>, ib: Int,
                                  out: inout Float, count: Int) {
        vDSP_distancesq(a, ia, b, ib, &out, UInt(count))
    }
    
    /// Calculate euclidian distance of two vectors.
    /// out = sqrt(sum((a[i * ia] - b[i * ib]) ** 2))
    public static func distancesq(a: UnsafePointer<Double>, ia: Int,
                                  b: UnsafePointer<Double>, ib: Int,
                                  out: inout Double, count: Int) {
        vDSP_distancesqD(a, ia, b, ib, &out, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: vdist
    
    /// out[i * iOut] = sqrt(a[i * ia]**2 + b[i * ib]**2), for 0 <= i < count
    public static func vdist(a: UnsafePointer<Float>, ia: Int,
                             b: UnsafePointer<Float>, ib: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map2(x: a, ix: ia, y: b, iy: ib, out: out, iOut: iOut, operation: {
            $0 = sqrt($1*$1 + $2*$2)
        }, count: count)
    }
    
    /// out[i * iOut] = sqrt(a[i * ia]**2 + b[i * ib]**2), for 0 <= i < count
    public static func vdist(a: UnsafePointer<Double>, ia: Int,
                             b: UnsafePointer<Double>, ib: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map2(x: a, ix: ia, y: b, iy: ib, out: out, iOut: iOut, operation: {
            $0 = sqrt($1*$1 + $2*$2)
        }, count: count)
    }
    
    // MARK: distancesq
    
    private static func _distancesq<F: BinaryFloatingPoint>(a: UnsafePointer<F>, ia: Int,
                                                            b: UnsafePointer<F>, ib: Int,
                                                            out: inout F, count: Int) {
        var a = a
        var b = b
        out = 0
        for _ in 0..<count {
            out += (a.pointee - b.pointee) * (a.pointee - b.pointee)
            a += ia
            b += ib
        }
    }
    
    /// Calculate euclidian distance of two vectors.
    /// out = sqrt(sum((a[i * ia] - b[i * ib]) ** 2))
    public static func distancesq(a: UnsafePointer<Float>, ia: Int,
                                  b: UnsafePointer<Float>, ib: Int,
                                  out: inout Float, count: Int) {
        _distancesq(a: a, ia: ia, b: b, ib: ib, out: &out, count: count)
    }
    
    /// Calculate euclidian distance of two vectors.
    /// out = sqrt(sum((a[i * ia] - b[i * ib]) ** 2))
    public static func distancesq(a: UnsafePointer<Double>, ia: Int,
                                  b: UnsafePointer<Double>, ib: Int,
                                  out: inout Double, count: Int) {
        _distancesq(a: a, ia: ia, b: b, ib: ib, out: &out, count: count)
    }
}
