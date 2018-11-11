#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vadd
    
    /// out[i * iOut] = a[i * ia] + b[i * ib], for 0 <= i < count
    public static func vadd(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vadd(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = a[i * ia] + b[i * ib], for 0 <= i < count
    public static func vadd(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vaddD(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    // MARK: vsub
    
    /// out[i * iOut] = a[i * ia] - b[i * ib], for 0 <= i < count
    public static func vsub(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vsub(b, ib, a, ia, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = a[i * ia] - b[i * ib], for 0 <= i < count
    public static func vsub(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vsubD(b, ib, a, ia, out, iOut, UInt(count))
    }
    
    // MARK: vmul
    
    /// out[i * iOut] = a[i * ia] * b[i * ib], for 0 <= i < count
    public static func vmul(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vmul(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = a[i * ia] * b[i * ib], for 0 <= i < count
    public static func vmul(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vmulD(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    // MARK: vdiv
    
    /// out[i * iOut] = a[i * ia] / b[i * ib], for 0 <= i < count
    public static func vdiv(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vdiv(b, ib, a, ia, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = a[i * ia] / b[i * ib], for 0 <= i < count
    public static func vdiv(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vdivD(b, ib, a, ia, out, iOut, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: vadd
    
    /// out[i * iOut] = a[i * ia] + b[i * ib], for 0 <= i < count
    public static func vadd(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map2(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
             operation: { $0 = $1 + $2 }, count: count)
    }
    
    /// out[i * iOut] = a[i * ia] + b[i * ib], for 0 <= i < count
    public static func vadd(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map2(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
             operation: { $0 = $1 + $2 }, count: count)
    }
    
    // MARK: vsub
    
    /// out[i * iOut] = a[i * ia] - b[i * ib], for 0 <= i < count
    public static func vsub(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map2(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
             operation: { $0 = $1 - $2 }, count: count)
    }
    
    /// out[i * iOut] = a[i * ia] - b[i * ib], for 0 <= i < count
    public static func vsub(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map2(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
             operation: { $0 = $1 - $2 }, count: count)
    }
    
    // MARK: vmul
    
    /// out[i * iOut] = a[i * ia] * b[i * ib], for 0 <= i < count
    public static func vmul(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map2(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
             operation: { $0 = $1 * $2 }, count: count)
    }
    
    /// out[i * iOut] = a[i * ia] * b[i * ib], for 0 <= i < count
    public static func vmul(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map2(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
             operation: { $0 = $1 * $2 }, count: count)
    }
    
    // MARK: vdiv
    
    /// out[i * iOut] = a[i * ia] / b[i * ib], for 0 <= i < count
    public static func vdiv(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map2(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
             operation: { $0 = $1 / $2 }, count: count)
    }
    
    /// out[i * iOut] = a[i * ia] / b[i * ib], for 0 <= i < count
    public static func vdiv(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map2(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
             operation: { $0 = $1 / $2 }, count: count)
    }
}
