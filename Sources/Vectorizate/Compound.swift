#if canImport(Accelerate)

import Accelerate

extension Vectorizate {
    public static func vma(a: UnsafePointer<Float>, ia: Int,
                             b: UnsafePointer<Float>, ib: Int,
                             c: UnsafePointer<Float>, ic: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        vDSP_vma(a, ia, b, ib, c, ic, out, iOut, UInt(count))
    }
    
    public static func vma(a: UnsafePointer<Double>, ia: Int,
                           b: UnsafePointer<Double>, ib: Int,
                           c: UnsafePointer<Double>, ic: Int,
                           out: UnsafeMutablePointer<Double>, iOut: Int,
                           count: Int) {
        vDSP_vmaD(a, ia, b, ib, c, ic, out, iOut, UInt(count))
    }
    
    public static func vmsa(a: UnsafePointer<Float>, ia: Int,
                           b: UnsafePointer<Float>, ib: Int,
                           c: Float,
                           out: UnsafeMutablePointer<Float>, iOut: Int,
                           count: Int) {
        var c = c
        vDSP_vmsa(a, ia, b, ib, &c, out, iOut, UInt(count))
    }
    
    public static func vmsa(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            c: Double,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        var c = c
        vDSP_vmsaD(a, ia, b, ib, &c, out, iOut, UInt(count))
    }
    
    public static func vsma(a: UnsafePointer<Float>, ia: Int,
                            b: Float,
                            c: UnsafePointer<Float>, ic: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        var b = b
        vDSP_vsma(a, ia, &b, c, ic, out, iOut, UInt(count))
    }
    
    public static func vsmsa(a: UnsafePointer<Float>, ia: Int,
                             b: Float, c: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        var (b, c) = (b, c)
        vDSP_vsmsa(a, ia, &b, &c, out, iOut, UInt(count))
    }
    
    public static func vsmsa(a: UnsafePointer<Double>, ia: Int,
                             b: Double, c: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        var (b, c) = (b, c)
        vDSP_vsmsaD(a, ia, &b, &c, out, iOut, UInt(count))
    }
}

#endif
