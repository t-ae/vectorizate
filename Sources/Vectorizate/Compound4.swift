#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vmma
    
    /// Vector multiply, multiply and add.
    ///
    /// out[i * iOut] = a[i * ia] * b[i * ib] + c[i * ic] * d[i * id], for 0 <= i < count
    public static func vmma(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            c: UnsafePointer<Float>, ic: Int,
                            d: UnsafePointer<Float>, id: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vmma(a, ia, b, ib, c, ic, d, id, out, iOut, UInt(count))
    }
    
    /// Vector multiply, multiply and add.
    ///
    /// out[i * iOut] = a[i * ia] * b[i * ib] + c[i * ic] * d[i * id], for 0 <= i < count
    public static func vmma(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            c: UnsafePointer<Double>, ic: Int,
                            d: UnsafePointer<Double>, id: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vmmaD(a, ia, b, ib, c, ic, d, id, out, iOut, UInt(count))
    }
    
    // MARK: vmmsb
    
    /// Vector multiply, multiply and subtract.
    ///
    /// out[i * iOut] = a[i * ia] * b[i * ib] - c[i * ic] * d[i * id], for 0 <= i < count
    public static func vmmsb(a: UnsafePointer<Float>, ia: Int,
                             b: UnsafePointer<Float>, ib: Int,
                             c: UnsafePointer<Float>, ic: Int,
                             d: UnsafePointer<Float>, id: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        vDSP_vmmsb(a, ia, b, ib, c, ic, d, id, out, iOut, UInt(count))
    }
    
    /// Vector multiply, multiply and subtract.
    ///
    /// out[i * iOut] = a[i * ia] * b[i * ib] - c[i * ic] * d[i * id], for 0 <= i < count
    public static func vmmsb(a: UnsafePointer<Double>, ia: Int,
                             b: UnsafePointer<Double>, ib: Int,
                             c: UnsafePointer<Double>, ic: Int,
                             d: UnsafePointer<Double>, id: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        vDSP_vmmsbD(a, ia, b, ib, c, ic, d, id, out, iOut, UInt(count))
    }
    
    // MARK: vaam
    
    /// Vector add, add and multiply.
    ///
    /// out[i * iOut] = (a[i * ia] + b[i * ib]) * (c[i * ic] + d[i * id]), for 0 <= i < count
    public static func vaam(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            c: UnsafePointer<Float>, ic: Int,
                            d: UnsafePointer<Float>, id: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vaam(a, ia, b, ib, c, ic, d, id, out, iOut, UInt(count))
    }
    
    /// Vector add, add and multiply.
    ///
    /// out[i * iOut] = (a[i * ia] + b[i * ib]) * (c[i * ic] + d[i * id]), for 0 <= i < count
    public static func vaam(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            c: UnsafePointer<Double>, ic: Int,
                            d: UnsafePointer<Double>, id: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vaamD(a, ia, b, ib, c, ic, d, id, out, iOut, UInt(count))
    }
    
    // MARK: vasbm
    
    /// Vector add, subtract and multiply.
    ///
    /// out[i * iOut] = (a[i * ia] + b[i * ib]) * (c[i * ic] - d[i * id]), for 0 <= i < count
    public static func vasbm(a: UnsafePointer<Float>, ia: Int,
                             b: UnsafePointer<Float>, ib: Int,
                             c: UnsafePointer<Float>, ic: Int,
                             d: UnsafePointer<Float>, id: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        vDSP_vasbm(a, ia, b, ib, c, ic, d, id, out, iOut, UInt(count))
    }
    
    /// Vector add, subtract and multiply.
    ///
    /// out[i * iOut] = (a[i * ia] + b[i * ib]) * (c[i * ic] - d[i * id]), for 0 <= i < count
    public static func vasbm(a: UnsafePointer<Double>, ia: Int,
                             b: UnsafePointer<Double>, ib: Int,
                             c: UnsafePointer<Double>, ic: Int,
                             d: UnsafePointer<Double>, id: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        vDSP_vasbmD(a, ia, b, ib, c, ic, d, id, out, iOut, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: vmma
    
    /// Vector multiply, multiply and add.
    ///
    /// out[i * iOut] = a[i * ia] * b[i * ib] + c[i * ic] * d[i * id], for 0 <= i < count
    public static func vmma(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            c: UnsafePointer<Float>, ic: Int,
                            d: UnsafePointer<Float>, id: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map4(a: a, ia: ia, b: b, ib: ib, c: c, ic: ic, d: d, id: id, out: out, iOut: iOut,
             operation: { $0 = $1*$2 + $3*$4 }, count: count)
    }
    
    /// Vector multiply, multiply and add.
    ///
    /// out[i * iOut] = a[i * ia] * b[i * ib] + c[i * ic] * d[i * id], for 0 <= i < count
    public static func vmma(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            c: UnsafePointer<Double>, ic: Int,
                            d: UnsafePointer<Double>, id: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map4(a: a, ia: ia, b: b, ib: ib, c: c, ic: ic, d: d, id: id, out: out, iOut: iOut,
             operation: { $0 = $1*$2 + $3*$4 }, count: count)
    }
    
    // MARK: vmmsb
    
    /// Vector multiply, multiply and subtract.
    ///
    /// out[i * iOut] = a[i * ia] * b[i * ib] - c[i * ic] * d[i * id], for 0 <= i < count
    public static func vmmsb(a: UnsafePointer<Float>, ia: Int,
                             b: UnsafePointer<Float>, ib: Int,
                             c: UnsafePointer<Float>, ic: Int,
                             d: UnsafePointer<Float>, id: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map4(a: a, ia: ia, b: b, ib: ib, c: c, ic: ic, d: d, id: id, out: out, iOut: iOut,
             operation: { $0 = $1*$2 - $3*$4 }, count: count)
    }
    
    /// Vector multiply, multiply and subtract.
    ///
    /// out[i * iOut] = a[i * ia] * b[i * ib] - c[i * ic] * d[i * id], for 0 <= i < count
    public static func vmmsb(a: UnsafePointer<Double>, ia: Int,
                             b: UnsafePointer<Double>, ib: Int,
                             c: UnsafePointer<Double>, ic: Int,
                             d: UnsafePointer<Double>, id: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map4(a: a, ia: ia, b: b, ib: ib, c: c, ic: ic, d: d, id: id, out: out, iOut: iOut,
             operation: { $0 = $1*$2 - $3*$4 }, count: count)
    }
    
    // MARK: vaam
    
    /// Vector add, add and multiply.
    ///
    /// out[i * iOut] = (a[i * ia] + b[i * ib]) * (c[i * ic] + d[i * id]), for 0 <= i < count
    public static func vaam(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            c: UnsafePointer<Float>, ic: Int,
                            d: UnsafePointer<Float>, id: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map4(a: a, ia: ia, b: b, ib: ib, c: c, ic: ic, d: d, id: id, out: out, iOut: iOut,
             operation: { $0 = ($1+$2) * ($3+$4) }, count: count)
    }
    
    /// Vector add, add and multiply.
    ///
    /// out[i * iOut] = (a[i * ia] + b[i * ib]) * (c[i * ic] + d[i * id]), for 0 <= i < count
    public static func vaam(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            c: UnsafePointer<Double>, ic: Int,
                            d: UnsafePointer<Double>, id: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map4(a: a, ia: ia, b: b, ib: ib, c: c, ic: ic, d: d, id: id, out: out, iOut: iOut,
             operation: { $0 = ($1+$2) * ($3+$4) }, count: count)
    }
    
    // MARK: vasbm
    
    /// Vector add, subtract and multiply.
    ///
    /// out[i * iOut] = (a[i * ia] + b[i * ib]) * (c[i * ic] - d[i * id]), for 0 <= i < count
    public static func vasbm(a: UnsafePointer<Float>, ia: Int,
                             b: UnsafePointer<Float>, ib: Int,
                             c: UnsafePointer<Float>, ic: Int,
                             d: UnsafePointer<Float>, id: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map4(a: a, ia: ia, b: b, ib: ib, c: c, ic: ic, d: d, id: id, out: out, iOut: iOut,
             operation: { $0 = ($1+$2) * ($3-$4) }, count: count)
    }
    
    /// Vector add, subtract and multiply.
    ///
    /// out[i * iOut] = (a[i * ia] + b[i * ib]) * (c[i * ic] - d[i * id]), for 0 <= i < count
    public static func vasbm(a: UnsafePointer<Double>, ia: Int,
                             b: UnsafePointer<Double>, ib: Int,
                             c: UnsafePointer<Double>, ic: Int,
                             d: UnsafePointer<Double>, id: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map4(a: a, ia: ia, b: b, ib: ib, c: c, ic: ic, d: d, id: id, out: out, iOut: iOut,
             operation: { $0 = ($1+$2) * ($3-$4) }, count: count)
    }
}
