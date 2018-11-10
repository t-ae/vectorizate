import Foundation

#if canImport(Accelerate)

import Accelerate

extension Vectorizate {
    // MARK: exp
    public static func exp(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexpf(out, x, &count)
    }
    
    public static func exp(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexp(out, x, &count)
    }
    
    // MARK: exp2
    public static func exp2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexp2f(out, x, &count)
    }
    
    public static func exp2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexp2(out, x, &count)
    }
    
    // MARK: expm1
    public static func expm1(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvexpm1f(out, x, &count)
    }
    
    public static func expm1(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvexpm1(out, x, &count)
    }
    
    // MARK: log
    public static func log(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlogf(out, x, &count)
    }
    
    public static func log(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog(out, x, &count)
    }
    
    // MARK: log1p
    public static func log1p(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog1pf(out, x, &count)
    }
    
    public static func log1p(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog1p(out, x, &count)
    }
    
    // MARK: log2
    public static func log2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog2f(out, x, &count)
    }
    
    public static func log2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog2(out, x, &count)
    }
    
    // MARK: log10
    public static func log10(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlog10f(out, x, &count)
    }
    
    public static func log10(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlog10(out, x, &count)
    }
    
    // MARK: logb
    public static func logb(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvlogbf(out, x, &count)
    }
    
    public static func logb(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvlogb(out, x, &count)
    }
}

#endif

extension VectorizateNoAccelerate {
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
    public static func exp(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.exp, count: count)
    }
    
    public static func exp(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.exp, count: count)
    }
    
    // MARK: exp2
    public static func exp2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.exp2, count: count)
    }
    
    public static func exp2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.exp2, count: count)
    }
    
    // MARK: expm1
    public static func expm1(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.expm1, count: count)
    }
    
    public static func expm1(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.expm1, count: count)
    }
    
    // MARK: log
    public static func log(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.log, count: count)
    }
    
    public static func log(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.log, count: count)
    }
    
    // MARK: log1p
    public static func log1p(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.log1p, count: count)
    }
    
    public static func log1p(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.log1p, count: count)
    }
    
    // MARK: log2
    public static func log2(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.log2, count: count)
    }
    
    public static func log2(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.log2, count: count)
    }
    
    // MARK: log10
    public static func log10(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.log10, count: count)
    }
    
    public static func log10(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.log10, count: count)
    }
    
    // MARK: logb
    public static func logb(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.logb, count: count)
    }
    
    public static func logb(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.logb, count: count)
    }
}
