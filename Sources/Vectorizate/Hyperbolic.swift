#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vsinh
    
    /// out[i * iOut] = vsinh(x[i * ix]), for 0 <= i < count
    public static func vsinh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsinhf(out, x, &count)
    }
    
    /// out[i * iOut] = vsinh(x[i * ix]), for 0 <= i < count
    public static func vsinh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsinh(out, x, &count)
    }
    
    // MARK: vcosh
    
    /// out[i * iOut] = vcosh(x[i * ix]), for 0 <= i < count
    public static func vcosh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvcoshf(out, x, &count)
    }
    
    /// out[i * iOut] = vcosh(x[i * ix]), for 0 <= i < count
    public static func vcosh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcosh(out, x, &count)
    }
    
    // MARK: vtanh
    
    /// out[i * iOut] = vtanh(x[i * ix]), for 0 <= i < count
    public static func vtanh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvtanhf(out, x, &count)
    }
    
    /// out[i * iOut] = vtanh(x[i * ix]), for 0 <= i < count
    public static func vtanh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvtanh(out, x, &count)
    }
    
    // MARK: vasinh
    
    /// out[i * iOut] = vasinh(x[i * ix]), for 0 <= i < count
    public static func vasinh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvasinhf(out, x, &count)
    }
    
    /// out[i * iOut] = vasinh(x[i * ix]), for 0 <= i < count
    public static func vasinh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvasinh(out, x, &count)
    }
    
    // MARK: vacosh
    
    /// out[i * iOut] = vacosh(x[i * ix]), for 0 <= i < count
    public static func vacosh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvacoshf(out, x, &count)
    }
    
    /// out[i * iOut] = vacosh(x[i * ix]), for 0 <= i < count
    public static func vacosh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvacosh(out, x, &count)
    }
    
    // MARK: vatanh
    
    /// out[i * iOut] = vatanh(x[i * ix]), for 0 <= i < count
    public static func vatanh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvatanhf(out, x, &count)
    }
    
    /// out[i * iOut] = vatanh(x[i * ix]), for 0 <= i < count
    public static func vatanh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
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
    
    // MARK: vsinh
    
    /// out[i * iOut] = vsinh(x[i * ix]), for 0 <= i < count
    public static func vsinh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: sinh, count: count)
    }
    
    /// out[i * iOut] = vsinh(x[i * ix]), for 0 <= i < count
    public static func vsinh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: sinh, count: count)
    }
    
    // MARK: vcosh
    
    /// out[i * iOut] = vcosh(x[i * ix]), for 0 <= i < count
    public static func vcosh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: cosh, count: count)
    }
    
    /// out[i * iOut] = vcosh(x[i * ix]), for 0 <= i < count
    public static func vcosh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: cosh, count: count)
    }
    
    // MARK: vtanh
    
    /// out[i * iOut] = vtanh(x[i * ix]), for 0 <= i < count
    public static func vtanh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: tanh, count: count)
    }
    
    /// out[i * iOut] = vtanh(x[i * ix]), for 0 <= i < count
    public static func vtanh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: tanh, count: count)
    }
    
    // MARK: vasinh
    
    /// out[i * iOut] = vasinh(x[i * ix]), for 0 <= i < count
    public static func vasinh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: asinh, count: count)
    }
    
    /// out[i * iOut] = vasinh(x[i * ix]), for 0 <= i < count
    public static func vasinh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: asinh, count: count)
    }
    
    // MARK: vacosh
    
    /// out[i * iOut] = vacosh(x[i * ix]), for 0 <= i < count
    public static func vacosh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: acosh, count: count)
    }
    
    /// out[i * iOut] = vacosh(x[i * ix]), for 0 <= i < count
    public static func vacosh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: acosh, count: count)
    }
    
    // MARK: vatanh
    
    /// out[i * iOut] = vatanh(x[i * ix]), for 0 <= i < count
    public static func vatanh(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: atanh, count: count)
    }
    
    /// out[i * iOut] = vatanh(x[i * ix]), for 0 <= i < count
    public static func vatanh(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: atanh, count: count)
    }
}
