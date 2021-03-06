#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vsadd
    
    /// Vector-scalar add.
    ///
    /// out[i * iOut] = a[i * ia] + b, for 0 <= i < count
    public static func vsadd(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsadd(a, ia, &b, out, iOut, UInt(count))
    }
    
    /// Vector-scalar add.
    ///
    /// out[i * iOut] = a[i * ia] + b, for 0 <= i < count
    public static func vsadd(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsaddD(a, ia, &b, out, iOut, UInt(count))
    }
    
    // MARK: vssub
    
    /// Vector-scalar subtract.
    ///
    /// out[i * iOut] = a[i * ia] - b, for 0 <= i < count
    public static func vssub(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        vsadd(a: a, ia: ia, b: -b, out: out, iOut: iOut, count: count)
    }
    
    /// Vector-scalar subtract.
    ///
    /// out[i * iOut] = a[i * ia] - b, for 0 <= i < count
    public static func vssub(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        vsadd(a: a, ia: ia, b: -b, out: out, iOut: iOut, count: count)
    }
    
    // MARK: svsub
    
    /// Scalar-vector subtract.
    ///
    /// out[i * iOut] = a - b[i * ib], for 0 <= i < count
    public static func svsub(a: Float,
                             b: UnsafePointer<Float>, ib: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        vsmsa(a: b, ia: ib, b: -1, c: a, out: out, iOut: iOut, count: count)
    }
    
    /// Scalar-vector subtract
    ///
    /// out[i * iOut] = a - b[i * ib], for 0 <= i < count
    public static func svsub(a: Double,
                             b: UnsafePointer<Double>, ib: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        vsmsa(a: b, ia: ib, b: -1, c: a, out: out, iOut: iOut, count: count)
    }
    
    // MARK: vsmul
    
    /// Vector-scalar multiplication.
    ///
    /// out[i * iOut] = a[i * ia] * b, for 0 <= i < count
    public static func vsmul(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsmul(a, ia, &b, out, iOut, UInt(count))
    }
    
    /// Vector-scalar multiplication.
    ///
    /// out[i * iOut] = a[i * ia] * b, for 0 <= i < count
    public static func vsmul(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsmulD(a, ia, &b, out, iOut, UInt(count))
    }
    
    // MARK: vsdiv
    
    /// Vector-scalar divide.
    ///
    /// out[i * iOut] = a[i * ia] / b, for 0 <= i < count
    public static func vsdiv(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsdiv(a, ia, &b, out, iOut, UInt(count))
    }
    
    /// Vector-scalar divide.
    ///
    /// out[i * iOut] = a[i * ia] / b, for 0 <= i < count
    public static func vsdiv(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        var b = b
        vDSP_vsdivD(a, ia, &b, out, iOut, UInt(count))
    }
    
    // MARK: svdiv
    
    /// Scalar-vector divide.
    ///
    /// out[i * iOut] = a / b[i * ib], for 0 <= i < count
    public static func svdiv(a: Float,
                             b: UnsafePointer<Float>, ib: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        var a = a
        vDSP_svdiv(&a, b, ib, out, iOut, UInt(count))
    }
    
    /// Scalar-vector divide.
    ///
    /// out[i * iOut] = a / b[i * ib], for 0 <= i < count
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
    // MARK: vsadd
    
    /// Vector-scalar add.
    ///
    /// out[i * iOut] = a[i * ia] + b, for 0 <= i < count
    public static func vsadd(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(x: a, ix: ia, out: out, iOut: iOut,
            operation: { $0 = $1 + b }, count:  count)
    }
    
    /// Vector-scalar add.
    ///
    /// out[i * iOut] = a[i * ia] + b, for 0 <= i < count
    public static func vsadd(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(x: a, ix: ia, out: out, iOut: iOut,
            operation: { $0 = $1 + b }, count:  count)
    }
    
    // MARK: vssub
    
    /// Vector-scalar subtract.
    ///
    /// out[i * iOut] = a[i * ia] - b, for 0 <= i < count
    public static func vssub(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(x: a, ix: ia, out: out, iOut: iOut,
            operation: { $0 = $1 - b }, count:  count)
    }
    
    /// Vector-scalar subtract.
    ///
    /// out[i * iOut] = a[i * ia] - b, for 0 <= i < count
    public static func vssub(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(x: a, ix: ia, out: out, iOut: iOut,
            operation: { $0 = $1 - b }, count:  count)
    }
    
    // MARK: svsub
    
    /// Scalar-vector subtract.
    ///
    /// out[i * iOut] = a - b[i * ib], for 0 <= i < count
    public static func svsub(a: Float,
                             b: UnsafePointer<Float>, ib: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(x: b, ix: ib, out: out, iOut: iOut,
            operation: { $0 = a - $1 }, count:  count)
    }
    
    /// Scalar-vector subtract.
    ///
    /// out[i * iOut] = a - b[i * ib], for 0 <= i < count
    public static func svsub(a: Double,
                             b: UnsafePointer<Double>, ib: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(x: b, ix: ib, out: out, iOut: iOut,
            operation: { $0 = a - $1 }, count:  count)
    }
    
    // MARK: vsmul
    
    /// Vector-scalar multiplication.
    ///
    /// out[i * iOut] = a[i * ia] * b, for 0 <= i < count
    public static func vsmul(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(x: a, ix: ia, out: out, iOut: iOut,
            operation: { $0 = $1 * b }, count:  count)
    }
    
    /// Vector-scalar multiplication.
    ///
    /// out[i * iOut] = a[i * ia] * b, for 0 <= i < count
    public static func vsmul(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(x: a, ix: ia, out: out, iOut: iOut,
            operation: { $0 = $1 * b }, count:  count)
    }
    
    // MARK: vsdiv
    
    /// Vector-scalar divide.
    ///
    /// out[i * iOut] = a[i * ia] / b, for 0 <= i < count
    public static func vsdiv(a: UnsafePointer<Float>, ia: Int,
                             b: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(x: a, ix: ia, out: out, iOut: iOut,
            operation: { $0 = $1 / b }, count:  count)
    }
    
    /// Vector-scalar divide.
    ///
    /// out[i * iOut] = a[i * ia] / b, for 0 <= i < count
    public static func vsdiv(a: UnsafePointer<Double>, ia: Int,
                             b: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(x: a, ix: ia, out: out, iOut: iOut,
            operation: { $0 = $1 / b }, count:  count)
    }
    
    // MARK: svdiv
    
    /// Scalar-vector divide.
    ///
    /// out[i * iOut] = a / b[i * ib], for 0 <= i < count
    public static func svdiv(a: Float,
                             b: UnsafePointer<Float>, ib: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(x: b, ix: ib, out: out, iOut: iOut,
            operation: { $0 = a / $1 }, count:  count)
    }
    
    /// Scalar-vector divide.
    ///
    /// out[i * iOut] = a / b[i * ib], for 0 <= i < count
    public static func svdiv(a: Double,
                             b: UnsafePointer<Double>, ib: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(x: b, ix: ib, out: out, iOut: iOut,
            operation: { $0 = a / $1 }, count:  count)
    }
}
