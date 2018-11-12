import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vexp
    
    /// Calculates e raised to the power of each element in an array.
    ///
    /// out[i * iOut] = exp(x[i]), for 0 <= i < count
    public static func vexp(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexpf(out, x, &count)
    }
    
    /// Calculates e raised to the power of each element in an array.
    ///
    /// out[i * iOut] = exp(x[i]), for 0 <= i < count
    public static func vexp(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexp(out, x, &count)
    }
    
    // MARK: vexp2
    
    /// Calculates 2 raised to the power of each element in an array.
    ///
    /// out[i * iOut] = exp2(x[i]), for 0 <= i < count
    public static func vexp2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexp2f(out, x, &count)
    }
    
    /// Calculates 2 raised to the power of each element in an array.
    ///
    /// out[i * iOut] = exp2(x[i]), for 0 <= i < count
    public static func vexp2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexp2(out, x, &count)
    }
    
    // MARK: vexpm1
    
    /// Calculates e^x - 1 for each element in an array.
    ///
    /// out[i * iOut] = exp(x[i]) - 1, for 0 <= i < count
    public static func vexpm1(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexpm1f(out, x, &count)
    }
    
    /// Calculates e^x - 1 for each element in an array.
    ///
    /// out[i * iOut] = exp(x[i]) - 1, for 0 <= i < count
    public static func vexpm1(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexpm1(out, x, &count)
    }
    
    // MARK: vlog
    
    /// out[i * iOut] = log(x[i]), for 0 <= i < count
    public static func vlog(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlogf(out, x, &count)
    }
    
    /// out[i * iOut] = log(x[i]), for 0 <= i < count
    public static func vlog(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog(out, x, &count)
    }
    
    // MARK: vlog1p
    
    /// out[i * iOut] = log(x[i] + 1), for 0 <= i < count
    public static func vlog1p(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog1pf(out, x, &count)
    }
    
    /// out[i * iOut] = log(x[i] + 1), for 0 <= i < count
    public static func vlog1p(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog1p(out, x, &count)
    }
    
    // MARK: vlog2
    
    /// out[i * iOut] = log2(x[i]), for 0 <= i < count
    public static func vlog2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog2f(out, x, &count)
    }
    
    /// out[i * iOut] = log2(x[i]), for 0 <= i < count
    public static func vlog2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog2(out, x, &count)
    }
    
    // MARK: vlog10
    
    /// out[i * iOut] = log10(x[i]), for 0 <= i < count
    public static func vlog10(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog10f(out, x, &count)
    }
    
    /// out[i * iOut] = log10(x[i]), for 0 <= i < count
    public static func vlog10(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog10(out, x, &count)
    }
    
    // MARK: vlogb
    
    /// out[i * iOut] = logb(x[i]), for 0 <= i < count
    public static func vlogb(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlogbf(out, x, &count)
    }
    
    /// out[i * iOut] = logb(x[i]), for 0 <= i < count
    public static func vlogb(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlogb(out, x, &count)
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: vexp
    
    /// out[i * iOut] = exp(x[i]), for 0 <= i < count
    public static func vexp(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = exp($1) }, count: count)
    }
    
    /// out[i * iOut] = exp(x[i]), for 0 <= i < count
    public static func vexp(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = exp($1) }, count: count)
    }
    
    // MARK: vexp2
    
    /// out[i * iOut] = exp2(x[i]), for 0 <= i < count
    public static func vexp2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = exp2($1) }, count: count)
    }
    
    /// out[i * iOut] = exp2(x[i]), for 0 <= i < count
    public static func vexp2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = exp2($1) }, count: count)
    }
    
    // MARK: vexpm1
    
    /// out[i * iOut] = exp(x[i]) - 1, for 0 <= i < count
    public static func vexpm1(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = expm1($1) }, count: count)
    }
    
    /// out[i * iOut] = exp(x[i]) - 1, for 0 <= i < count
    public static func vexpm1(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = expm1($1) }, count: count)
    }
    
    // MARK: vlog
    
    /// out[i * iOut] = log(x[i]), for 0 <= i < count
    public static func vlog(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = log($1) }, count: count)
    }
    
    /// out[i * iOut] = log(x[i]), for 0 <= i < count
    public static func vlog(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = log($1) }, count: count)
    }
    
    // MARK: vlog1p
    
    /// out[i * iOut] = log(x[i] + 1), for 0 <= i < count
    public static func vlog1p(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = log1p($1) }, count: count)
    }
    
    /// out[i * iOut] = log(x[i] + 1), for 0 <= i < count
    public static func vlog1p(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = log1p($1) }, count: count)
    }
    
    // MARK: vlog2
    
    /// out[i * iOut] = log2(x[i]), for 0 <= i < count
    public static func vlog2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = log2($1) }, count: count)
    }
    
    /// out[i * iOut] = log2(x[i]), for 0 <= i < count
    public static func vlog2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = log2($1) }, count: count)
    }
    
    // MARK: vlog10
    
    /// out[i * iOut] = log10(x[i]), for 0 <= i < count
    public static func vlog10(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = log10($1) }, count: count)
    }
    
    /// out[i * iOut] = log10(x[i]), for 0 <= i < count
    public static func vlog10(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = log10($1) }, count: count)
    }
    
    // MARK: vlogb
    
    /// out[i * iOut] = logb(x[i]), for 0 <= i < count
    public static func vlogb(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = logb($1) }, count: count)
    }
    
    /// out[i * iOut] = logb(x[i]), for 0 <= i < count
    public static func vlogb(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = logb($1) }, count: count)
    }
}
