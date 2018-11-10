import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vmin
    
    /// out[i * iOut] = min(a[i * ia], b[i * ib]), for 0 <= i < count
    public static func vmin(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vmin(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = min(a[i * ia], b[i * ib]), for 0 <= i < count
    public static func vmin(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vminD(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    // MARK: vminmg
    
    /// out[i * iOut] = min(abs(a[i * ia]), abs(b[i * ib])), for 0 <= i < count
    public static func vminmg(a: UnsafePointer<Float>, ia: Int,
                              b: UnsafePointer<Float>, ib: Int,
                              out: UnsafeMutablePointer<Float>, iOut: Int,
                              count: Int) {
        vDSP_vminmg(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = min(abs(a[i * ia]), abs(b[i * ib])), for 0 <= i < count
    public static func vminmg(a: UnsafePointer<Double>, ia: Int,
                              b: UnsafePointer<Double>, ib: Int,
                              out: UnsafeMutablePointer<Double>, iOut: Int,
                              count: Int) {
        vDSP_vminmgD(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    // MARK: vmax
    
    /// out[i * iOut] = max(a[i * ia], b[i * ib]), for 0 <= i < count
    public static func vmax(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vmax(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = max(a[i * ia], b[i * ib]), for 0 <= i < count
    public static func vmax(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vmaxD(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    // MARK: vmaxmg
    
    /// out[i * iOut] = max(abs(a[i * ia]), abs(b[i * ib])), for 0 <= i < count
    public static func vmaxmg(a: UnsafePointer<Float>, ia: Int,
                              b: UnsafePointer<Float>, ib: Int,
                              out: UnsafeMutablePointer<Float>, iOut: Int,
                              count: Int) {
        vDSP_vmax(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = max(abs(a[i * ia]), abs(b[i * ib])), for 0 <= i < count
    public static func vmaxmg(a: UnsafePointer<Double>, ia: Int,
                              b: UnsafePointer<Double>, ib: Int,
                              out: UnsafeMutablePointer<Double>, iOut: Int,
                              count: Int) {
        vDSP_vmaxD(a, ia, b, ib, out, iOut, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    
    private static func map<T>(a: UnsafePointer<T>, ia: Int,
                               b: UnsafePointer<T>, ib: Int,
                               out: UnsafeMutablePointer<T>, iOut: Int,
                               operation: (inout T, T, T)->Void,
                               count: Int) {
        var a = a
        var b = b
        var out = out
        for _ in 0..<count {
            operation(&out.pointee, a.pointee, b.pointee)
            
            a += ia
            b += ib
            out += iOut
        }
    }
    
    // MARK: vmin
    
    /// out[i * iOut] = min(a[i * ia], b[i * ib]), for 0 <= i < count
    public static func vmin(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: { $0 = min($1, $2) }, count: count)
    }
    
    /// out[i * iOut] = min(a[i * ia], b[i * ib]), for 0 <= i < count
    public static func vmin(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: { $0 = min($1, $2) }, count: count)
    }
    
    // MARK: vminmg
    
    /// out[i * iOut] = min(abs(a[i * ia]), abs(b[i * ib])), for 0 <= i < count
    public static func vminmg(a: UnsafePointer<Float>, ia: Int,
                              b: UnsafePointer<Float>, ib: Int,
                              out: UnsafeMutablePointer<Float>, iOut: Int,
                              count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: { $0 = min(abs($1), abs($2)) }, count: count)
    }
    
    /// out[i * iOut] = min(abs(a[i * ia]), abs(b[i * ib])), for 0 <= i < count
    public static func vminmg(a: UnsafePointer<Double>, ia: Int,
                              b: UnsafePointer<Double>, ib: Int,
                              out: UnsafeMutablePointer<Double>, iOut: Int,
                              count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: { $0 = min(abs($1), abs($2)) }, count: count)
    }
    
    // MARK: vmax
    
    /// out[i * iOut] = max(a[i * ia], b[i * ib]), for 0 <= i < count
    public static func vmax(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: { $0 = max($1, $2) }, count: count)
    }
    
    /// out[i * iOut] = max(a[i * ia], b[i * ib]), for 0 <= i < count
    public static func vmax(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: { $0 = max($1, $2) }, count: count)
    }
    
    // MARK: vmaxmg
    
    /// out[i * iOut] = max(abs(a[i * ia]), abs(b[i * ib])), for 0 <= i < count
    public static func vmaxmg(a: UnsafePointer<Float>, ia: Int,
                              b: UnsafePointer<Float>, ib: Int,
                              out: UnsafeMutablePointer<Float>, iOut: Int,
                              count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: { $0 = max(abs($1), abs($2)) }, count: count)
    }
    
    /// out[i * iOut] = max(abs(a[i * ia]), abs(b[i * ib])), for 0 <= i < count
    public static func vmaxmg(a: UnsafePointer<Double>, ia: Int,
                              b: UnsafePointer<Double>, ib: Int,
                              out: UnsafeMutablePointer<Double>, iOut: Int,
                              count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: { $0 = max(abs($1), abs($2)) }, count: count)
    }
}
