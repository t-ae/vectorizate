import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vsinh
    
    /// Calculates the hyperbolic sine and cosine of each element in an array.
    ///
    /// out[i * iOut] = sinh(x[i]), for 0 <= i < count
    public static func vsinh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsinhf(out, x, &count)
    }
    
    /// Calculates the hyperbolic sine and cosine of each element in an array.
    ///
    /// out[i * iOut] = sinh(x[i]), for 0 <= i < count
    public static func vsinh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsinh(out, x, &count)
    }
    
    // MARK: vcosh
    
    /// Calculates the hyperbolic cosine and cosine of each element in an array.
    ///
    /// out[i * iOut] = cosh(x[i]), for 0 <= i < count
    public static func vcosh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvcoshf(out, x, &count)
    }
    
    /// Calculates the hyperbolic cosine and cosine of each element in an array.
    ///
    /// out[i * iOut] = cosh(x[i]), for 0 <= i < count
    public static func vcosh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcosh(out, x, &count)
    }
    
    // MARK: vtanh
    
    /// Calculates the hyperbolic tangent and cosine of each element in an array.
    ///
    /// out[i * iOut] = tanh(x[i]), for 0 <= i < count
    public static func vtanh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvtanhf(out, x, &count)
    }
    
    /// Calculates the hyperbolic tangent and cosine of each element in an array.
    ///
    /// out[i * iOut] = tanh(x[i]), for 0 <= i < count
    public static func vtanh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvtanh(out, x, &count)
    }
    
    // MARK: vasinh
    
    /// Calculates the inverse hyperbolic sine and cosine of each element in an array.
    ///
    /// out[i * iOut] = asinh(x[i]), for 0 <= i < count
    public static func vasinh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvasinhf(out, x, &count)
    }
    
    /// Calculates the inverse hyperbolic sine and cosine of each element in an array.
    ///
    /// out[i * iOut] = asinh(x[i]), for 0 <= i < count
    public static func vasinh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvasinh(out, x, &count)
    }
    
    // MARK: vacosh
    
    /// Calculates the inverse hyperbolic cosine and cosine of each element in an array.
    ///
    /// out[i * iOut] = acosh(x[i]), for 0 <= i < count
    public static func vacosh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvacoshf(out, x, &count)
    }
    
    /// Calculates the inverse hyperbolic cosine and cosine of each element in an array.
    ///
    /// out[i * iOut] = acosh(x[i]), for 0 <= i < count
    public static func vacosh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvacosh(out, x, &count)
    }
    
    // MARK: vatanh
    
    /// Calculates the inverse hyperbolic tangent and cosine of each element in an array.
    ///
    /// out[i * iOut] = atanh(x[i]), for 0 <= i < count
    public static func vatanh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvatanhf(out, x, &count)
    }
    
    /// Calculates the inverse hyperbolic tangent and cosine of each element in an array.
    ///
    /// out[i * iOut] = atanh(x[i]), for 0 <= i < count
    public static func vatanh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvatanh(out, x, &count)
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: vsinh
    
    /// Calculates the hyperbolic sine and cosine of each element in an array.
    ///
    /// out[i * iOut] = sinh(x[i]), for 0 <= i < count
    public static func vsinh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = sinh($1) }, count: count)
    }
    
    /// Calculates the hyperbolic sine and cosine of each element in an array.
    ///
    /// out[i * iOut] = sinh(x[i]), for 0 <= i < count
    public static func vsinh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = sinh($1) }, count: count)
    }
    
    // MARK: vcosh
    
    /// Calculates the hyperbolic cosine and cosine of each element in an array.
    ///
    /// out[i * iOut] = cosh(x[i]), for 0 <= i < count
    public static func vcosh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = cosh($1) }, count: count)
    }
    
    /// Calculates the hyperbolic cosine and cosine of each element in an array.
    ///
    /// out[i * iOut] = cosh(x[i]), for 0 <= i < count
    public static func vcosh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = cosh($1) }, count: count)
    }
    
    // MARK: vtanh
    
    /// Calculates the hyperbolic tangent and cosine of each element in an array.
    ///
    /// out[i * iOut] = tanh(x[i]), for 0 <= i < count
    public static func vtanh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = tanh($1) }, count: count)
    }
    
    /// Calculates the hyperbolic tangent and cosine of each element in an array.
    ///
    /// out[i * iOut] = tanh(x[i]), for 0 <= i < count
    public static func vtanh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = tanh($1) }, count: count)
    }
    
    // MARK: vasinh
    
    /// Calculates the inverse hyperbolic sine and cosine of each element in an array.
    ///
    /// out[i * iOut] = asinh(x[i]), for 0 <= i < count
    public static func vasinh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = asinh($1) }, count: count)
    }
    
    /// Calculates the inverse hyperbolic sine and cosine of each element in an array.
    ///
    /// out[i * iOut] = asinh(x[i]), for 0 <= i < count
    public static func vasinh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = asinh($1) }, count: count)
    }
    
    // MARK: vacosh
    
    /// Calculates the inverse hyperbolic cosine and cosine of each element in an array.
    ///
    /// out[i * iOut] = acosh(x[i]), for 0 <= i < count
    public static func vacosh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = acosh($1) }, count: count)
    }
    
    /// Calculates the inverse hyperbolic cosine and cosine of each element in an array.
    ///
    /// out[i * iOut] = acosh(x[i]), for 0 <= i < count
    public static func vacosh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = acosh($1) }, count: count)
    }
    
    // MARK: vatanh
    
    /// Calculates the inverse hyperbolic tangent and cosine of each element in an array.
    ///
    /// out[i * iOut] = atanh(x[i]), for 0 <= i < count
    public static func vatanh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = atanh($1) }, count: count)
    }
    
    /// Calculates the inverse hyperbolic tangent and cosine of each element in an array.
    ///
    /// out[i * iOut] = atanh(x[i]), for 0 <= i < count
    public static func vatanh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = atanh($1) }, count: count)
    }
}
