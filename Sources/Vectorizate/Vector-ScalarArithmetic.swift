#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vsadd
    
    /// out[i*iOut] = a[i*ia] + b, for 0 <= i < count
    public static func vsadd(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsadd(a, ia, &b, out, iOut, UInt(count))
    }
    
    /// out[i*iOut] = a[i*ia] + b, for 0 <= i < count
    public static func vsadd(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsaddD(a, ia, &b, out, iOut, UInt(count))
    }
    
    // MARK: vssub
    /// out[i*iOut] = a[i*ia] - b, for 0 <= i < count
    public static func vssub(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        vsadd(a: a, ia: ia, b: -b, out: out, iOut: iOut, count: count)
    }
    
    /// out[i*iOut] = a[i*ia] - b, for 0 <= i < count
    public static func vssub(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        vsadd(a: a, ia: ia, b: -b, out: out, iOut: iOut, count: count)
    }
    
    // MARK: svsub
    
    /// out[i*iOut] = a - b[i*ib], for 0 <= i < count
    public static func svsub(a: Float,
                             b: UnsafePointer<Float>, ib: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        vsmsa(a: b, ia: ib, b: -1, c: a, out: out, iOut: iOut, count: count)
    }
    
    /// out[i*iOut] = a - b[i*ib], for 0 <= i < count
    public static func svsub(a: Double,
                             b: UnsafePointer<Double>, ib: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        vsmsa(a: b, ia: ib, b: -1, c: a, out: out, iOut: iOut, count: count)
    }
    
    // MARK: vsmul
    
    /// out[i*iOut] = a[i*ia] * b, for 0 <= i < count
    public static func vsmul(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsmul(a, ia, &b, out, iOut, UInt(count))
    }
    
    /// out[i*iOut] = a[i*ia] * b, for 0 <= i < count
    public static func vsmul(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsmulD(a, ia, &b, out, iOut, UInt(count))
    }
    
    // MARK: vsdiv
    
    /// out[i*iOut] = a[i*ia] / b, for 0 <= i < count
    public static func vsdiv(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsdiv(a, ia, &b, out, iOut, UInt(count))
    }
    
    /// out[i*iOut] = a[i*ia] / b, for 0 <= i < count
    public static func vsdiv(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsdivD(a, ia, &b, out, iOut, UInt(count))
    }
    
    // MARK: svdiv
    
    /// out[i*iOut] = a / b[i*ib], for 0 <= i < count
    public static func svdiv(a: Float,
                             b: UnsafePointer<Float>, ib: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        var a = a
        vDSP_svdiv(&a, b, ib, out, iOut, UInt(count))
    }
    
    /// out[i*iOut] = a / b[i*ib], for 0 <= i < count
    public static func svdiv(a: Double,
                             b: UnsafePointer<Double>, ib: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        var a = a
        vDSP_svdivD(&a, b, ib, out, iOut, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    private static func map<T>(a: UnsafePointer<T>, ia: Int,
                                              b: T,
                                              out: UnsafeMutablePointer<T>, iOut: Int,
                                              operation: (T, T)->T,
                                              count: Int) {
        var a = a
        var out = out
        for _ in 0..<count {
            out.pointee = operation(a.pointee, b)
            a += ia
            out += iOut
        }
    }
    
    // MARK: vsadd
    
    /// out[i*iOut] = a[i*ia] + b, for 0 <= i < count
    public static func vsadd(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(a: a, ia: ia, b: b, out: out, iOut: iOut,
            operation: +, count:  count)
    }
    
    
    /// out[i*iOut] = a[i*ia] + b, for 0 <= i < count
    public static func vsadd(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(a: a, ia: ia, b: b, out: out, iOut: iOut,
            operation: +, count:  count)
    }
    
    // MARK: vssub
    
    /// out[i*iOut] = a[i*ia] - b, for 0 <= i < count
    public static func vssub(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(a: a, ia: ia, b: b, out: out, iOut: iOut,
            operation: -, count:  count)
    }
    
    /// out[i*iOut] = a[i*ia] - b, for 0 <= i < count
    public static func vssub(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(a: a, ia: ia, b: b, out: out, iOut: iOut,
            operation: -, count:  count)
    }
    
    // MARK: svsub
    
    /// out[i*iOut] = a - b[i*ib], for 0 <= i < count
    public static func svsub(a: Float,
                             b: UnsafePointer<Float>, ib: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(a: b, ia: ib, b: a, out: out, iOut: iOut,
            operation: { $1 - $0 }, count:  count)
    }
    
    /// out[i*iOut] = a - b[i*ib], for 0 <= i < count
    public static func svsub(a: Double,
                             b: UnsafePointer<Double>, ib: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(a: b, ia: ib, b: a, out: out, iOut: iOut,
            operation: { $1 - $0 }, count:  count)
    }
    
    // MARK: vsmul
    
    /// out[i*iOut] = a[i*ia] * b, for 0 <= i < count
    public static func vsmul(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(a: a, ia: ia, b: b, out: out, iOut: iOut,
            operation: *, count:  count)
    }
    
    /// out[i*iOut] = a[i*ia] * b, for 0 <= i < count
    public static func vsmul(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(a: a, ia: ia, b: b, out: out, iOut: iOut,
            operation: *, count:  count)
    }
    
    // MARK: vsdiv
    
    /// out[i*iOut] = a[i*ia] / b, for 0 <= i < count
    public static func vsdiv(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(a: a, ia: ia, b: b, out: out, iOut: iOut,
            operation: /, count:  count)
    }
    
    /// out[i*iOut] = a[i*ia] / b, for 0 <= i < count
    public static func vsdiv(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(a: a, ia: ia, b: b, out: out, iOut: iOut,
            operation: /, count:  count)
    }
    
    // MARK: svdiv
    
    /// out[i*iOut] = a / b[i*ib], for 0 <= i < count
    public static func svdiv(a: Float,
                             b: UnsafePointer<Float>, ib: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(a: b, ia: ib, b: a, out: out, iOut: iOut,
            operation: { $1 / $0 }, count:  count)
    }
    
    /// out[i*iOut] = a / b[i*ib], for 0 <= i < count
    public static func svdiv(a: Double,
                             b: UnsafePointer<Double>, ib: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(a: b, ia: ib, b: a, out: out, iOut: iOut,
            operation: { $1 / $0 }, count:  count)
    }
}
