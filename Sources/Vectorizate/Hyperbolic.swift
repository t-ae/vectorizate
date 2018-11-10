import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: sinh
    
    /// out[i*iOut] = sinh(x[i*ix]), for 0 <= i < count
    public static func sinh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsinhf(out, x, &count)
    }
    
    /// out[i*iOut] = sinh(x[i*ix]), for 0 <= i < count
    public static func sinh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsinh(out, x, &count)
    }
    
    // MARK: cosh
    
    /// out[i*iOut] = cosh(x[i*ix]), for 0 <= i < count
    public static func cosh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvcoshf(out, x, &count)
    }
    
    /// out[i*iOut] = cosh(x[i*ix]), for 0 <= i < count
    public static func cosh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcosh(out, x, &count)
    }
    
    // MARK: tanh
    
    /// out[i*iOut] = tanh(x[i*ix]), for 0 <= i < count
    public static func tanh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvtanhf(out, x, &count)
    }
    
    /// out[i*iOut] = tanh(x[i*ix]), for 0 <= i < count
    public static func tanh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvtanh(out, x, &count)
    }
    
    // MARK: asinh
    
    /// out[i*iOut] = asinh(x[i*ix]), for 0 <= i < count
    public static func asinh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvasinhf(out, x, &count)
    }
    
    /// out[i*iOut] = asinh(x[i*ix]), for 0 <= i < count
    public static func asinh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvasinh(out, x, &count)
    }
    
    // MARK: acosh
    
    /// out[i*iOut] = acosh(x[i*ix]), for 0 <= i < count
    public static func acosh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvacoshf(out, x, &count)
    }
    
    /// out[i*iOut] = acosh(x[i*ix]), for 0 <= i < count
    public static func acosh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvacosh(out, x, &count)
    }
    
    // MARK: atanh
    
    /// out[i*iOut] = atanh(x[i*ix]), for 0 <= i < count
    public static func atanh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvatanhf(out, x, &count)
    }
    
    /// out[i*iOut] = atanh(x[i*ix]), for 0 <= i < count
    public static func atanh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvatanh(out, x, &count)
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
    
    // MARK: sinh
    
    /// out[i*iOut] = sinh(x[i*ix]), for 0 <= i < count
    public static func sinh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.sinh, count: count)
    }
    
    /// out[i*iOut] = sinh(x[i*ix]), for 0 <= i < count
    public static func sinh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.sinh, count: count)
    }
    
    // MARK: cosh
    
    /// out[i*iOut] = cosh(x[i*ix]), for 0 <= i < count
    public static func cosh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.cosh, count: count)
    }
    
    /// out[i*iOut] = cosh(x[i*ix]), for 0 <= i < count
    public static func cosh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.cosh, count: count)
    }
    
    // MARK: tanh
    
    /// out[i*iOut] = tanh(x[i*ix]), for 0 <= i < count
    public static func tanh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.tanh, count: count)
    }
    
    /// out[i*iOut] = tanh(x[i*ix]), for 0 <= i < count
    public static func tanh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.tanh, count: count)
    }
    
    // MARK: asinh
    
    /// out[i*iOut] = asinh(x[i*ix]), for 0 <= i < count
    public static func asinh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.asinh, count: count)
    }
    
    /// out[i*iOut] = asinh(x[i*ix]), for 0 <= i < count
    public static func asinh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.asinh, count: count)
    }
    
    // MARK: acosh
    
    /// out[i*iOut] = acosh(x[i*ix]), for 0 <= i < count
    public static func acosh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.acosh, count: count)
    }
    
    /// out[i*iOut] = acosh(x[i*ix]), for 0 <= i < count
    public static func acosh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.acosh, count: count)
    }
    
    // MARK: atanh
    
    /// out[i*iOut] = atanh(x[i*ix]), for 0 <= i < count
    public static func atanh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.atanh, count: count)
    }
    
    /// out[i*iOut] = atanh(x[i*ix]), for 0 <= i < count
    public static func atanh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.atanh, count: count)
    }
}
