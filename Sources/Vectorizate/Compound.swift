#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vma
    
    /// out[i * iOut] = a[i * ia] * b[i * ib] + c[i * ic], for 0 <= i < count
    public static func vma(a: UnsafePointer<Float>, ia: Int,
                           b: UnsafePointer<Float>, ib: Int,
                           c: UnsafePointer<Float>, ic: Int,
                           out: UnsafeMutablePointer<Float>, iOut: Int,
                           count: Int) {
        vDSP_vma(a, ia, b, ib, c, ic, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = a[i * ia] * b[i * ib] + c[i * ic], for 0 <= i < count
    public static func vma(a: UnsafePointer<Double>, ia: Int,
                           b: UnsafePointer<Double>, ib: Int,
                           c: UnsafePointer<Double>, ic: Int,
                           out: UnsafeMutablePointer<Double>, iOut: Int,
                           count: Int) {
        vDSP_vmaD(a, ia, b, ib, c, ic, out, iOut, UInt(count))
    }
    
    // MARK: vmsb
    
    /// out[i * iOut] = a[i * ia] * b[i * ib] - c[i * ic], for 0 <= i < count
    public static func vmsb(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            c: UnsafePointer<Float>, ic: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vmsb(a, ia, b, ib, c, ic, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = a[i * ia] * b[i * ib] - c[i * ic], for 0 <= i < count
    public static func vmsb(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            c: UnsafePointer<Double>, ic: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vmsbD(a, ia, b, ib, c, ic, out, iOut, UInt(count))
    }
    
    // MARK: vmsa
    
    /// out[i * iOut] = a[i * ia] * b[i * ib] + c, for 0 <= i < count
    public static func vmsa(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            c: Float,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        var c = c
        vDSP_vmsa(a, ia, b, ib, &c, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = a[i * ia] * b[i * ib] + c, for 0 <= i < count
    public static func vmsa(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            c: Double,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        var c = c
        vDSP_vmsaD(a, ia, b, ib, &c, out, iOut, UInt(count))
    }
    
    // MARK: vsma
    
    /// out[i * iOut] = a[i * ia] * b + c[i * ic], for 0 <= i < count
    public static func vsma(a: UnsafePointer<Float>, ia: Int,
                            b: Float,
                            c: UnsafePointer<Float>, ic: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        var b = b
        vDSP_vsma(a, ia, &b, c, ic, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = a[i * ia] * b + c[i * ic], for 0 <= i < count
    public static func vsma(a: UnsafePointer<Double>, ia: Int,
                            b: Double,
                            c: UnsafePointer<Double>, ic: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        var b = b
        vDSP_vsmaD(a, ia, &b, c, ic, out, iOut, UInt(count))
    }
    
    // MARK: vsmsb
    
    /// out[i * iOut] = a[i * ia] * b - c[i * ic], for 0 <= i < count
    public static func vsmsb(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             c: UnsafePointer<Float>, ic: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsmsb(a, ia, &b, c, ic, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = a[i * ia] * b - c[i * ic], for 0 <= i < count
    public static func vsmsb(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             c: UnsafePointer<Double>, ic: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsmsbD(a, ia, &b, c, ic, out, iOut, UInt(count))
    }
    
    // MARK: vsmsa
    
    /// out[i * iOut] = a[i * ia] * b + c, for 0 <= i < count
    public static func vsmsa(a: UnsafePointer<Float>, ia: Int,
                             b: Float, c: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        var (b, c) = (b, c)
        vDSP_vsmsa(a, ia, &b, &c, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = a[i * ia] * b + c, for 0 <= i < count
    public static func vsmsa(a: UnsafePointer<Double>, ia: Int,
                             b: Double, c: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        var (b, c) = (b, c)
        vDSP_vsmsaD(a, ia, &b, &c, out, iOut, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: vma
    
    /// out[i * iOut] = a[i * ia] * b[i * ib] + c[i * ic], for 0 <= i < count
    public static func vma(a: UnsafePointer<Float>, ia: Int,
                           b: UnsafePointer<Float>, ib: Int,
                           c: UnsafePointer<Float>, ic: Int,
                           out: UnsafeMutablePointer<Float>, iOut: Int,
                           count: Int) {
        map3(a: a, ia: ia, b: b, ib: ib, c: c, ic: ic, out: out, iOut: iOut,
             operation: { $0 = $1 * $2 + $3 }, count: count)
    }
    
    /// out[i * iOut] = a[i * ia] * b[i * ib] + c[i * ic], for 0 <= i < count
    public static func vma(a: UnsafePointer<Double>, ia: Int,
                           b: UnsafePointer<Double>, ib: Int,
                           c: UnsafePointer<Double>, ic: Int,
                           out: UnsafeMutablePointer<Double>, iOut: Int,
                           count: Int) {
        map3(a: a, ia: ia, b: b, ib: ib, c: c, ic: ic, out: out, iOut: iOut,
             operation: { $0 = $1 * $2 + $3 }, count: count)
    }
    
    // MARK: vmsb
    
    /// out[i * iOut] = a[i * ia] * b[i * ib] - c[i * ic], for 0 <= i < count
    public static func vmsb(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            c: UnsafePointer<Float>, ic: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map3(a: a, ia: ia, b: b, ib: ib, c: c, ic: ic, out: out, iOut: iOut,
             operation: { $0 = $1 * $2 - $3 }, count: count)
    }
    
    /// out[i * iOut] = a[i * ia] * b[i * ib] - c[i * ic], for 0 <= i < count
    public static func vmsb(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            c: UnsafePointer<Double>, ic: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map3(a: a, ia: ia, b: b, ib: ib, c: c, ic: ic, out: out, iOut: iOut,
             operation: { $0 = $1 * $2 - $3 }, count: count)
    }
    
    // MARK: vmsa
    
    /// out[i * iOut] = a[i * ia] * b[i * ib] + c, for 0 <= i < count
    public static func vmsa(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            c: Float,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map2(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
             operation: { $0 = $1 * $2 + c }, count: count)
    }
    
    /// out[i * iOut] = a[i * ia] * b[i * ib] + c, for 0 <= i < count
    public static func vmsa(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            c: Double,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map2(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
             operation: { $0 = $1 * $2 + c }, count: count)
    }
    
    // MARK: vsma
    
    /// out[i * iOut] = a[i * ia] * b + c[i * ic], for 0 <= i < count
    public static func vsma(a: UnsafePointer<Float>, ia: Int,
                            b: Float,
                            c: UnsafePointer<Float>, ic: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map2(a: a, ia: ia, b: c, ib: ic, out: out, iOut: iOut,
             operation: { $0 = $1 * b + $2 }, count: count)
    }
    
    /// out[i * iOut] = a[i * ia] * b + c[i * ic], for 0 <= i < count
    public static func vsma(a: UnsafePointer<Double>, ia: Int,
                            b: Double,
                            c: UnsafePointer<Double>, ic: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map2(a: a, ia: ia, b: c, ib: ic, out: out, iOut: iOut,
             operation: { $0 = $1 * b + $2 }, count: count)
    }
    
    // MARK: vsmsb
    
    /// out[i * iOut] = a[i * ia] * b - c[i * ic], for 0 <= i < count
    public static func vsmsb(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             c: UnsafePointer<Float>, ic: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map2(a: a, ia: ia, b: c, ib: ic, out: out, iOut: iOut,
             operation: { $0 = $1 * b - $2 }, count: count)
    }
    
    /// out[i * iOut] = a[i * ia] * b - c[i * ic], for 0 <= i < count
    public static func vsmsb(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             c: UnsafePointer<Double>, ic: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map2(a: a, ia: ia, b: c, ib: ic, out: out, iOut: iOut,
             operation: { $0 = $1 * b - $2 }, count: count)
    }
    
    // MARK: vsmsa
    
    /// out[i * iOut] = a[i * ia] * b + c, for 0 <= i < count
    public static func vsmsa(a: UnsafePointer<Float>, ia: Int,
                             b: Float, c: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(x: a, ix: ia, out: out, iOut: iOut,
            operation: { $0 = $1 * b + c }, count: count)
    }
    
    /// out[i * iOut] = a[i * ia] * b + c, for 0 <= i < count
    public static func vsmsa(a: UnsafePointer<Double>, ia: Int,
                             b: Double, c: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(x: a, ix: ia, out: out, iOut: iOut,
            operation: { $0 = $1 * b + c }, count: count)
    }
}
