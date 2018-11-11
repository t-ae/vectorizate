import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vsin
    
    /// out[i * iOut] = vsin(x[i * ix]), for 0 <= i < count
    public static func vsin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsinf(out, x, &count)
    }
    
    /// out[i * iOut] = vsin(x[i * ix]), for 0 <= i < count
    public static func vsin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsin(out, x, &count)
    }
    
    /// out[i * iOut] = vsin(x[i * ix] * pi), for 0 <= i < count
    public static func vsinpi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsinpif(out, x, &count)
    }
    
    /// out[i * iOut] = vsin(x[i * ix] * pi), for 0 <= i < count
    public static func vsinpi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsinpi(out, x, &count)
    }
    
    // MARK: vcos
    
    /// out[i * iOut] = vcos(x[i * ix]), for 0 <= i < count
    public static func vcos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvcosf(out, x, &count)
    }
    
    /// out[i * iOut] = vcos(x[i * ix]), for 0 <= i < count
    public static func vcos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcos(out, x, &count)
    }
    
    /// out[i * iOut] = vcos(x[i * ix] * pi), for 0 <= i < count
    public static func vcospi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvcospif(out, x, &count)
    }
    
    /// out[i * iOut] = vcos(x[i * ix] * pi), for 0 <= i < count
    public static func vcospi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcospi(out, x, &count)
    }
    
    // MARK: vtan
    
    /// out[i * iOut] = vtan(x[i * ix]), for 0 <= i < count
    public static func vtan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvtanf(out, x, &count)
    }
    
    /// out[i * iOut] = vtan(x[i * ix]), for 0 <= i < count
    public static func vtan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvtan(out, x, &count)
    }
    
    /// out[i * iOut] = vtan(x[i * ix] * pi), for 0 <= i < count
    public static func vtanpi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvtanpif(out, x, &count)
    }
    
    /// out[i * iOut] = vtan(x[i * ix] * pi), for 0 <= i < count
    public static func vtanpi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvtanpi(out, x, &count)
    }
    
    // MARK: vasin
    
    /// out[i * iOut] = vasin(x[i * ix]), for 0 <= i < count
    public static func vasin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvasinf(out, x, &count)
    }
    
    /// out[i * iOut] = vasin(x[i * ix]), for 0 <= i < count
    public static func vasin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvasin(out, x, &count)
    }
    
    // MARK: vacos
    
    /// out[i * iOut] = vacos(x[i * ix]), for 0 <= i < count
    public static func vacos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvacosf(out, x, &count)
    }
    
    /// out[i * iOut] = vacos(x[i * ix]), for 0 <= i < count
    public static func vacos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvacos(out, x, &count)
    }
    
    // MARK: vatan
    
    /// out[i * iOut] = vatan(x[i * ix]), for 0 <= i < count
    public static func vatan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvatanf(out, x, &count)
    }
    
    /// out[i * iOut] = vatan(x[i * ix]), for 0 <= i < count
    public static func vatan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvatan(out, x, &count)
    }
    
    // MARK: vatan2
    
    /// out[i * iOut] = vatan2(y[i * iy], x[i * ix]), for 0 <= i < count
    public static func vatan2(y: UnsafePointer<Float>, x: UnsafePointer<Float>,
                             out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvatan2f(out, y, x, &count)
    }
    
    /// out[i * iOut] = vatan2(y[i * iy], x[i * ix]), for 0 <= i < count
    public static func vatan2(y: UnsafePointer<Double>, x: UnsafePointer<Double>,
                             out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvatan2(out, y, x, &count)
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
    
    
    // MARK: vsin
    
    /// out[i * iOut] = vsin(x[i * ix]), for 0 <= i < count
    public static func vsin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.sin, count: count)
    }
    
    /// out[i * iOut] = vsin(x[i * ix]), for 0 <= i < count
    public static func vsin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.sin, count: count)
    }
    
    /// out[i * iOut] = vsin(x[i * ix] * pi), for 0 <= i < count
    public static func vsinpi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: { Foundation.sin($0 * .pi) }, count: count)
    }
    
    /// out[i * iOut] = vsin(x[i * ix] * pi), for 0 <= i < count
    public static func vsinpi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: { Foundation.sin($0 * .pi) }, count: count)
    }
    
    // MARK: vcos
    
    /// out[i * iOut] = vcos(x[i * ix]), for 0 <= i < count
    public static func vcos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.cos, count: count)
    }
    
    /// out[i * iOut] = vcos(x[i * ix]), for 0 <= i < count
    public static func vcos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.cos, count: count)
    }
    
    /// out[i * iOut] = vcos(x[i * ix] * pi), for 0 <= i < count
    public static func vcospi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: { Foundation.cos($0 * .pi) }, count: count)
    }
    
    /// out[i * iOut] = vcos(x[i * ix] * pi), for 0 <= i < count
    public static func vcospi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: { Foundation.cos($0 * .pi) }, count: count)
    }
    
    // MARK: vtan
    
    /// out[i * iOut] = vtan(x[i * ix]), for 0 <= i < count
    public static func vtan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.tan, count: count)
    }
    
    /// out[i * iOut] = vtan(x[i * ix]), for 0 <= i < count
    public static func vtan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.tan, count: count)
    }
    
    /// out[i * iOut] = vtan(x[i * ix] * pi), for 0 <= i < count
    public static func vtanpi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: { Foundation.tan($0 * .pi) }, count: count)
    }
    
    /// out[i * iOut] = vtan(x[i * ix] * pi), for 0 <= i < count
    public static func vtanpi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: { Foundation.tan($0 * .pi) }, count: count)
    }
    
    // MARK: vasin
    
    /// out[i * iOut] = vasin(x[i * ix]), for 0 <= i < count
    public static func vasin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.asin, count: count)
    }
    
    /// out[i * iOut] = vasin(x[i * ix]), for 0 <= i < count
    public static func vasin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.asin, count: count)
    }
    
    // MARK: vacos
    
    /// out[i * iOut] = vacos(x[i * ix]), for 0 <= i < count
    public static func vacos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.acos, count: count)
    }
    
    /// out[i * iOut] = vacos(x[i * ix]), for 0 <= i < count
    public static func vacos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.acos, count: count)
    }
    
    // MARK: vatan
    
    /// out[i * iOut] = vatan(x[i * ix]), for 0 <= i < count
    public static func vatan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.atan, count: count)
    }
    
    /// out[i * iOut] = vatan(x[i * ix]), for 0 <= i < count
    public static func vatan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.atan, count: count)
    }
    
    // MARK: vatan2
    
    /// out[i * iOut] = vatan2(y[i * iy], x[i * ix]), for 0 <= i < count
    public static func vatan2(y: UnsafePointer<Float>, x: UnsafePointer<Float>,
                             out: UnsafeMutablePointer<Float>, count: Int) {
        var y = y
        var x = x
        var out = out
        for _ in 0..<count {
            out.pointee = Foundation.atan2(y.pointee, x.pointee)
            y += 1
            x += 1
            out += 1
        }
    }
    
    /// out[i * iOut] = vatan2(y[i * iy], x[i * ix]), for 0 <= i < count
    public static func vatan2(y: UnsafePointer<Double>, x: UnsafePointer<Double>,
                             out: UnsafeMutablePointer<Double>, count: Int) {
        var y = y
        var x = x
        var out = out
        for _ in 0..<count {
            out.pointee = Foundation.atan2(y.pointee, x.pointee)
            y += 1
            x += 1
            out += 1
        }
    }
}
