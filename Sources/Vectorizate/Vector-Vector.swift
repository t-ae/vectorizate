#if canImport(Accelerate)

import Accelerate

extension Vectorizate {
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
    
    public static func vdiv(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vdiv(b, ib, a, ia, out, iOut, UInt(count))
    }
}

#endif
