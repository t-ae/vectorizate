import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vexp
    
    /// out[i * iOut] = vexp(x[i * ix]), for 0 <= i < count
    public static func vexp(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexpf(out, x, &count)
    }
    
    /// out[i * iOut] = vexp(x[i * ix]), for 0 <= i < count
    public static func vexp(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexp(out, x, &count)
    }
    
    // MARK: vexp2
    
    /// out[i * iOut] = vexp2(x[i * ix]), for 0 <= i < count
    public static func vexp2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexp2f(out, x, &count)
    }
    
    /// out[i * iOut] = vexp2(x[i * ix]), for 0 <= i < count
    public static func vexp2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexp2(out, x, &count)
    }
    
    // MARK: vexpm1
    
    /// out[i * iOut] = vexp(x[i * ix]) - 1, for 0 <= i < count
    public static func vexpm1(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexpm1f(out, x, &count)
    }
    
    /// out[i * iOut] = vexp(x[i * ix]) - 1, for 0 <= i < count
    public static func vexpm1(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexpm1(out, x, &count)
    }
    
    // MARK: vlog
    
    /// out[i * iOut] = vlog(x[i * ix]), for 0 <= i < count
    public static func vlog(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlogf(out, x, &count)
    }
    
    /// out[i * iOut] = vlog(x[i * ix]), for 0 <= i < count
    public static func vlog(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog(out, x, &count)
    }
    
    // MARK: vlog1p
    
    /// out[i * iOut] = vlog(x[i * ix] + 1), for 0 <= i < count
    public static func vlog1p(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog1pf(out, x, &count)
    }
    
    /// out[i * iOut] = vlog(x[i * ix] + 1), for 0 <= i < count
    public static func vlog1p(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog1p(out, x, &count)
    }
    
    // MARK: vlog2
    
    /// out[i * iOut] = vlog2(x[i * ix]), for 0 <= i < count
    public static func vlog2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog2f(out, x, &count)
    }
    
    /// out[i * iOut] = vlog2(x[i * ix]), for 0 <= i < count
    public static func vlog2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog2(out, x, &count)
    }
    
    // MARK: vlog10
    
    /// out[i * iOut] = vlog10(x[i * ix]), for 0 <= i < count
    public static func vlog10(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog10f(out, x, &count)
    }
    
    /// out[i * iOut] = vlog10(x[i * ix]), for 0 <= i < count
    public static func vlog10(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog10(out, x, &count)
    }
    
    // MARK: vlogb
    
    /// out[i * iOut] = vlogb(x[i * ix]), for 0 <= i < count
    public static func vlogb(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlogbf(out, x, &count)
    }
    
    /// out[i * iOut] = vlogb(x[i * ix]), for 0 <= i < count
    public static func vlogb(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlogb(out, x, &count)
    }
}

#endif

extension VecOpsNoAccelerate {
    private static func map<T>(x: UnsafePointer<T>, out: UnsafeMutablePointer<T>,
                               operation: (T) -> T,
                               count: Int) {
        var x = x
        var out = out
        for _ in 0..<count {
            out.pointee = operation(x.pointee)
            x += 1
            out += 1
        }
    }
    
    // MARK: vexp
    
    /// out[i * iOut] = vexp(x[i * ix]), for 0 <= i < count
    public static func vexp(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.exp, count: count)
    }
    
    /// out[i * iOut] = vexp(x[i * ix]), for 0 <= i < count
    public static func vexp(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.exp, count: count)
    }
    
    // MARK: vexp2
    
    /// out[i * iOut] = vexp2(x[i * ix]), for 0 <= i < count
    public static func vexp2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.exp2, count: count)
    }
    
    /// out[i * iOut] = vexp2(x[i * ix]), for 0 <= i < count
    public static func vexp2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.exp2, count: count)
    }
    
    // MARK: vexpm1
    
    /// out[i * iOut] = vexp(x[i * ix]) - 1, for 0 <= i < count
    public static func vexpm1(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.expm1, count: count)
    }
    
    /// out[i * iOut] = vexp(x[i * ix]) - 1, for 0 <= i < count
    public static func vexpm1(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.expm1, count: count)
    }
    
    // MARK: vlog
    
    /// out[i * iOut] = vlog(x[i * ix]), for 0 <= i < count
    public static func vlog(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.log, count: count)
    }
    
    /// out[i * iOut] = vlog(x[i * ix]), for 0 <= i < count
    public static func vlog(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.log, count: count)
    }
    
    // MARK: vlog1p
    
    /// out[i * iOut] = vlog(x[i * ix] + 1), for 0 <= i < count
    public static func vlog1p(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.log1p, count: count)
    }
    
    /// out[i * iOut] = vlog(x[i * ix] + 1), for 0 <= i < count
    public static func vlog1p(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.log1p, count: count)
    }
    
    // MARK: vlog2
    
    /// out[i * iOut] = vlog2(x[i * ix]), for 0 <= i < count
    public static func vlog2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.log2, count: count)
    }
    
    /// out[i * iOut] = vlog2(x[i * ix]), for 0 <= i < count
    public static func vlog2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.log2, count: count)
    }
    
    // MARK: vlog10
    
    /// out[i * iOut] = vlog10(x[i * ix]), for 0 <= i < count
    public static func vlog10(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.log10, count: count)
    }
    
    /// out[i * iOut] = vlog10(x[i * ix]), for 0 <= i < count
    public static func vlog10(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.log10, count: count)
    }
    
    // MARK: vlogb
    
    /// out[i * iOut] = vlogb(x[i * ix]), for 0 <= i < count
    public static func vlogb(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.logb, count: count)
    }
    
    /// out[i * iOut] = vlogb(x[i * ix]), for 0 <= i < count
    public static func vlogb(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.logb, count: count)
    }
}
