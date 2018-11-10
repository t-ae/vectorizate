import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: exp
    
    /// out[i * iOut] = exp(x[i * ix]), for 0 <= i < count
    public static func exp(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexpf(out, x, &count)
    }
    
    /// out[i * iOut] = exp(x[i * ix]), for 0 <= i < count
    public static func exp(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexp(out, x, &count)
    }
    
    // MARK: exp2
    
    /// out[i * iOut] = exp2(x[i * ix]), for 0 <= i < count
    public static func exp2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexp2f(out, x, &count)
    }
    
    /// out[i * iOut] = exp2(x[i * ix]), for 0 <= i < count
    public static func exp2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexp2(out, x, &count)
    }
    
    // MARK: expm1
    
    /// out[i * iOut] = exp(x[i * ix]) - 1, for 0 <= i < count
    public static func expm1(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexpm1f(out, x, &count)
    }
    
    /// out[i * iOut] = exp(x[i * ix]) - 1, for 0 <= i < count
    public static func expm1(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexpm1(out, x, &count)
    }
    
    // MARK: log
    
    /// out[i * iOut] = log(x[i * ix]), for 0 <= i < count
    public static func log(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlogf(out, x, &count)
    }
    
    /// out[i * iOut] = log(x[i * ix]), for 0 <= i < count
    public static func log(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog(out, x, &count)
    }
    
    // MARK: log1p
    
    /// out[i * iOut] = log(x[i * ix] + 1), for 0 <= i < count
    public static func log1p(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog1pf(out, x, &count)
    }
    
    /// out[i * iOut] = log(x[i * ix] + 1), for 0 <= i < count
    public static func log1p(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog1p(out, x, &count)
    }
    
    // MARK: log2
    
    /// out[i * iOut] = log2(x[i * ix]), for 0 <= i < count
    public static func log2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog2f(out, x, &count)
    }
    
    /// out[i * iOut] = log2(x[i * ix]), for 0 <= i < count
    public static func log2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog2(out, x, &count)
    }
    
    // MARK: log10
    
    /// out[i * iOut] = log10(x[i * ix]), for 0 <= i < count
    public static func log10(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog10f(out, x, &count)
    }
    
    /// out[i * iOut] = log10(x[i * ix]), for 0 <= i < count
    public static func log10(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog10(out, x, &count)
    }
    
    // MARK: logb
    
    /// out[i * iOut] = logb(x[i * ix]), for 0 <= i < count
    public static func logb(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlogbf(out, x, &count)
    }
    
    /// out[i * iOut] = logb(x[i * ix]), for 0 <= i < count
    public static func logb(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
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
    
    // MARK: exp
    
    /// out[i * iOut] = exp(x[i * ix]), for 0 <= i < count
    public static func exp(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.exp, count: count)
    }
    
    /// out[i * iOut] = exp(x[i * ix]), for 0 <= i < count
    public static func exp(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.exp, count: count)
    }
    
    // MARK: exp2
    
    /// out[i * iOut] = exp2(x[i * ix]), for 0 <= i < count
    public static func exp2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.exp2, count: count)
    }
    
    /// out[i * iOut] = exp2(x[i * ix]), for 0 <= i < count
    public static func exp2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.exp2, count: count)
    }
    
    // MARK: expm1
    
    /// out[i * iOut] = exp(x[i * ix]) - 1, for 0 <= i < count
    public static func expm1(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.expm1, count: count)
    }
    
    /// out[i * iOut] = exp(x[i * ix]) - 1, for 0 <= i < count
    public static func expm1(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.expm1, count: count)
    }
    
    // MARK: log
    
    /// out[i * iOut] = log(x[i * ix]), for 0 <= i < count
    public static func log(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.log, count: count)
    }
    
    /// out[i * iOut] = log(x[i * ix]), for 0 <= i < count
    public static func log(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.log, count: count)
    }
    
    // MARK: log1p
    
    /// out[i * iOut] = log(x[i * ix] + 1), for 0 <= i < count
    public static func log1p(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.log1p, count: count)
    }
    
    /// out[i * iOut] = log(x[i * ix] + 1), for 0 <= i < count
    public static func log1p(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.log1p, count: count)
    }
    
    // MARK: log2
    
    /// out[i * iOut] = log2(x[i * ix]), for 0 <= i < count
    public static func log2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.log2, count: count)
    }
    
    /// out[i * iOut] = log2(x[i * ix]), for 0 <= i < count
    public static func log2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.log2, count: count)
    }
    
    // MARK: log10
    
    /// out[i * iOut] = log10(x[i * ix]), for 0 <= i < count
    public static func log10(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.log10, count: count)
    }
    
    /// out[i * iOut] = log10(x[i * ix]), for 0 <= i < count
    public static func log10(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.log10, count: count)
    }
    
    // MARK: logb
    
    /// out[i * iOut] = logb(x[i * ix]), for 0 <= i < count
    public static func logb(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.logb, count: count)
    }
    
    /// out[i * iOut] = logb(x[i * ix]), for 0 <= i < count
    public static func logb(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.logb, count: count)
    }
}
