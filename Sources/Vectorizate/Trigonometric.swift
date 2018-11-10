import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: sin
    
    /// out[i * iOut] = sin(x[i * ix]), for 0 <= i < count
    public static func sin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsinf(out, x, &count)
    }
    
    /// out[i * iOut] = sin(x[i * ix]), for 0 <= i < count
    public static func sin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsin(out, x, &count)
    }
    
    /// out[i * iOut] = sin(x[i * ix] * pi), for 0 <= i < count
    public static func sinpi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsinpif(out, x, &count)
    }
    
    /// out[i * iOut] = sin(x[i * ix] * pi), for 0 <= i < count
    public static func sinpi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsinpi(out, x, &count)
    }
    
    // MARK: cos
    
    /// out[i * iOut] = cos(x[i * ix]), for 0 <= i < count
    public static func cos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvcosf(out, x, &count)
    }
    
    /// out[i * iOut] = cos(x[i * ix]), for 0 <= i < count
    public static func cos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcos(out, x, &count)
    }
    
    /// out[i * iOut] = cos(x[i * ix] * pi), for 0 <= i < count
    public static func cospi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvcospif(out, x, &count)
    }
    
    /// out[i * iOut] = cos(x[i * ix] * pi), for 0 <= i < count
    public static func cospi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcospi(out, x, &count)
    }
    
    // MARK: tan
    
    /// out[i * iOut] = tan(x[i * ix]), for 0 <= i < count
    public static func tan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvtanf(out, x, &count)
    }
    
    /// out[i * iOut] = tan(x[i * ix]), for 0 <= i < count
    public static func tan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvtan(out, x, &count)
    }
    
    /// out[i * iOut] = tan(x[i * ix] * pi), for 0 <= i < count
    public static func tanpi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvtanpif(out, x, &count)
    }
    
    /// out[i * iOut] = tan(x[i * ix] * pi), for 0 <= i < count
    public static func tanpi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvtanpi(out, x, &count)
    }
    
    // MARK: asin
    
    /// out[i * iOut] = asin(x[i * ix]), for 0 <= i < count
    public static func asin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvasinf(out, x, &count)
    }
    
    /// out[i * iOut] = asin(x[i * ix]), for 0 <= i < count
    public static func asin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvasin(out, x, &count)
    }
    
    // MARK: acos
    
    /// out[i * iOut] = acos(x[i * ix]), for 0 <= i < count
    public static func acos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvacosf(out, x, &count)
    }
    
    /// out[i * iOut] = acos(x[i * ix]), for 0 <= i < count
    public static func acos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvacos(out, x, &count)
    }
    
    // MARK: atan
    
    /// out[i * iOut] = atan(x[i * ix]), for 0 <= i < count
    public static func atan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvatanf(out, x, &count)
    }
    
    /// out[i * iOut] = atan(x[i * ix]), for 0 <= i < count
    public static func atan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvatan(out, x, &count)
    }
    
    // MARK: atan2
    
    /// out[i * iOut] = atan2(y[i * iy], x[i * ix]), for 0 <= i < count
    public static func atan2(y: UnsafePointer<Float>, x: UnsafePointer<Float>,
                             out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvatan2f(out, y, x, &count)
    }
    
    /// out[i * iOut] = atan2(y[i * iy], x[i * ix]), for 0 <= i < count
    public static func atan2(y: UnsafePointer<Double>, x: UnsafePointer<Double>,
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
    
    
    // MARK: sin
    
    /// out[i * iOut] = sin(x[i * ix]), for 0 <= i < count
    public static func sin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.sin, count: count)
    }
    
    /// out[i * iOut] = sin(x[i * ix]), for 0 <= i < count
    public static func sin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.sin, count: count)
    }
    
    /// out[i * iOut] = sin(x[i * ix] * pi), for 0 <= i < count
    public static func sinpi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: { Foundation.sin($0 * .pi) }, count: count)
    }
    
    /// out[i * iOut] = sin(x[i * ix] * pi), for 0 <= i < count
    public static func sinpi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: { Foundation.sin($0 * .pi) }, count: count)
    }
    
    // MARK: cos
    
    /// out[i * iOut] = cos(x[i * ix]), for 0 <= i < count
    public static func cos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.cos, count: count)
    }
    
    /// out[i * iOut] = cos(x[i * ix]), for 0 <= i < count
    public static func cos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.cos, count: count)
    }
    
    /// out[i * iOut] = cos(x[i * ix] * pi), for 0 <= i < count
    public static func cospi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: { Foundation.cos($0 * .pi) }, count: count)
    }
    
    /// out[i * iOut] = cos(x[i * ix] * pi), for 0 <= i < count
    public static func cospi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: { Foundation.cos($0 * .pi) }, count: count)
    }
    
    // MARK: tan
    
    /// out[i * iOut] = tan(x[i * ix]), for 0 <= i < count
    public static func tan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.tan, count: count)
    }
    
    /// out[i * iOut] = tan(x[i * ix]), for 0 <= i < count
    public static func tan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.tan, count: count)
    }
    
    /// out[i * iOut] = tan(x[i * ix] * pi), for 0 <= i < count
    public static func tanpi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: { Foundation.tan($0 * .pi) }, count: count)
    }
    
    /// out[i * iOut] = tan(x[i * ix] * pi), for 0 <= i < count
    public static func tanpi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: { Foundation.tan($0 * .pi) }, count: count)
    }
    
    // MARK: asin
    
    /// out[i * iOut] = asin(x[i * ix]), for 0 <= i < count
    public static func asin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.asin, count: count)
    }
    
    /// out[i * iOut] = asin(x[i * ix]), for 0 <= i < count
    public static func asin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.asin, count: count)
    }
    
    // MARK: acos
    
    /// out[i * iOut] = acos(x[i * ix]), for 0 <= i < count
    public static func acos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.acos, count: count)
    }
    
    /// out[i * iOut] = acos(x[i * ix]), for 0 <= i < count
    public static func acos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.acos, count: count)
    }
    
    // MARK: atan
    
    /// out[i * iOut] = atan(x[i * ix]), for 0 <= i < count
    public static func atan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.atan, count: count)
    }
    
    /// out[i * iOut] = atan(x[i * ix]), for 0 <= i < count
    public static func atan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.atan, count: count)
    }
    
    // MARK: atan2
    
    /// out[i * iOut] = atan2(y[i * iy], x[i * ix]), for 0 <= i < count
    public static func atan2(y: UnsafePointer<Float>, x: UnsafePointer<Float>,
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
    
    /// out[i * iOut] = atan2(y[i * iy], x[i * ix]), for 0 <= i < count
    public static func atan2(y: UnsafePointer<Double>, x: UnsafePointer<Double>,
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
