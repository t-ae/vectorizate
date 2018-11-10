#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vadd
    public static func vadd(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vadd(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    public static func vadd(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vaddD(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    // MARK: vsub
    public static func vsub(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vsub(b, ib, a, ia, out, iOut, UInt(count))
    }
    
    public static func vsub(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vsubD(b, ib, a, ia, out, iOut, UInt(count))
    }
    
    // MARK: vmul
    public static func vmul(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vmul(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    public static func vmul(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vmulD(a, ia, b, ib, out, iOut, UInt(count))
    }
    
    // MARK: vdiv
    public static func vdiv(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vdiv(b, ib, a, ia, out, iOut, UInt(count))
    }
    
    public static func vdiv(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vdivD(b, ib, a, ia, out, iOut, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    private static func map<T>(a: UnsafePointer<T>, ia: Int,
                               b: UnsafePointer<T>, ib: Int,
                               out: UnsafeMutablePointer<T>, iOut: Int,
                               operation: (T, T) -> T,
                               count: Int) {
        var a = a
        var b = b
        var out = out
        for _ in 0..<count {
            out.pointee = operation(a.pointee, b.pointee)
            a += ia
            b += ib
            out += iOut
        }
    }
    // MARK: vadd
    public static func vadd(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: +, count: count)
    }
    
    public static func vadd(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: +, count: count)
    }
    
    // MARK: vsub
    public static func vsub(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: -, count: count)
    }
    
    public static func vsub(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: -, count: count)
    }
    
    // MARK: vmul
    public static func vmul(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: *, count: count)
    }
    
    public static func vmul(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: *, count: count)
    }
    
    // MARK: vdiv
    public static func vdiv(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: /, count: count)
    }
    
    public static func vdiv(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut,
            operation: /, count: count)
    }
}
