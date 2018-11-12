import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vsin
    
    /// Calculates the sine of each element in an array.
    ///
    /// out[i * iOut] = sin(x[i * ix]), for 0 <= i < count
    public static func vsin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsinf(out, x, &count)
    }
    
    /// Calculates the sine of each element in an array.
    ///
    /// out[i * iOut] = sin(x[i * ix]), for 0 <= i < count
    public static func vsin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsin(out, x, &count)
    }
    
    /// Calculates the sine of pi multiplied by each element in an array.
    ///
    /// out[i * iOut] = sin(x[i * ix] * pi), for 0 <= i < count
    public static func vsinpi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsinpif(out, x, &count)
    }
    
    /// Calculates the sine of pi multiplied by each element in an array.
    ///
    /// out[i * iOut] = sin(x[i * ix] * pi), for 0 <= i < count
    public static func vsinpi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsinpi(out, x, &count)
    }
    
    // MARK: vcos
    
    /// Calculates the cosine of each element in an array.
    ///
    /// out[i * iOut] = cos(x[i * ix]), for 0 <= i < count
    public static func vcos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvcosf(out, x, &count)
    }
    
    /// Calculates the cosine of each element in an array.
    ///
    /// out[i * iOut] = cos(x[i * ix]), for 0 <= i < count
    public static func vcos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcos(out, x, &count)
    }
    
    /// Calculates the cosine of pi multiplied by each element in an array.
    ///
    /// out[i * iOut] = cos(x[i * ix] * pi), for 0 <= i < count
    public static func vcospi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvcospif(out, x, &count)
    }
    
    /// Calculates the cosine of pi multiplied by each element in an array.
    ///
    /// out[i * iOut] = cos(x[i * ix] * pi), for 0 <= i < count
    public static func vcospi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcospi(out, x, &count)
    }
    
    // MARK: vsincos
    
    /// Calculates the sine and cosine of each element in an array.
    ///
    /// sin[i * iOut] = cos(x[i * ix] * pi),
    /// cos[i * iOut] = cos(x[i * ix] * pi), for 0 <= i < count
    public static func vsincos(x: UnsafePointer<Float>,
                               sin: UnsafeMutablePointer<Float>,
                               cos: UnsafeMutablePointer<Float>,
                               count: Int) {
        var count = Int32(count)
        vvsincosf(sin, cos, x, &count)
    }
    
    /// Calculates the sine and cosine of each element in an array.
    ///
    /// sin[i * iOut] = cos(x[i * ix] * pi),
    /// cos[i * iOut] = cos(x[i * ix] * pi), for 0 <= i < count
    public static func vsincos(x: UnsafePointer<Double>,
                               sin: UnsafeMutablePointer<Double>,
                               cos: UnsafeMutablePointer<Double>,
                               count: Int) {
        var count = Int32(count)
        vvsincos(sin, cos, x, &count)
    }
    
    // MARK: vtan
    
    /// Calculates the tangent of each element in an array.
    ///
    /// out[i * iOut] = tan(x[i * ix]), for 0 <= i < count
    public static func vtan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvtanf(out, x, &count)
    }
    
    /// Calculates the tangent of each element in an array.
    ///
    /// out[i * iOut] = tan(x[i * ix]), for 0 <= i < count
    public static func vtan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvtan(out, x, &count)
    }
    
    /// Calculates the tangent of pi multiplied by each element in an array.
    ///
    /// out[i * iOut] = tan(x[i * ix] * pi), for 0 <= i < count
    public static func vtanpi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvtanpif(out, x, &count)
    }
    
    /// Calculates the tangent of pi multiplied by each element in an array.
    ///
    /// out[i * iOut] = tan(x[i * ix] * pi), for 0 <= i < count
    public static func vtanpi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvtanpi(out, x, &count)
    }
    
    // MARK: vasin
    
    /// Calculates the arcsine of each element in an array.
    ///
    /// out[i * iOut] = asin(x[i * ix]), for 0 <= i < count
    public static func vasin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvasinf(out, x, &count)
    }
    
    /// Calculates the arcsine of each element in an array.
    ///
    /// out[i * iOut] = asin(x[i * ix]), for 0 <= i < count
    public static func vasin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvasin(out, x, &count)
    }
    
    // MARK: vacos
    
    /// Calculates the arccosine of each element in an array.
    ///
    /// out[i * iOut] = acos(x[i * ix]), for 0 <= i < count
    public static func vacos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvacosf(out, x, &count)
    }
    
    /// Calculates the arccosine of each element in an array.
    ///
    /// out[i * iOut] = acos(x[i * ix]), for 0 <= i < count
    public static func vacos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvacos(out, x, &count)
    }
    
    // MARK: vatan
    
    /// Calculates the arctangent of each element in an array.
    ///
    /// out[i * iOut] = atan(x[i * ix]), for 0 <= i < count
    public static func vatan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvatanf(out, x, &count)
    }
    
    /// Calculates the arctangent of each element in an array.
    ///
    /// out[i * iOut] = atan(x[i * ix]), for 0 <= i < count
    public static func vatan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvatan(out, x, &count)
    }
    
    // MARK: vatan2
    
    /// Calculates the arctangent of each pair of elements in two arrays.
    ///
    /// out[i * iOut] = atan2(y[i * iy], x[i * ix]), for 0 <= i < count
    public static func vatan2(y: UnsafePointer<Float>, x: UnsafePointer<Float>,
                             out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvatan2f(out, y, x, &count)
    }
    
    /// Calculates the arctangent of each pair of elements in two arrays.
    ///
    /// out[i * iOut] = atan2(y[i * iy], x[i * ix]), for 0 <= i < count
    public static func vatan2(y: UnsafePointer<Double>, x: UnsafePointer<Double>,
                             out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvatan2(out, y, x, &count)
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: vsin
    
    /// Calculates the sine of each element in an array.
    ///
    /// out[i * iOut] = sin(x[i * ix]), for 0 <= i < count
    public static func vsin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = sin($1) }, count: count)
    }
    
    /// Calculates the sine of each element in an array.
    ///
    /// out[i * iOut] = sin(x[i * ix]), for 0 <= i < count
    public static func vsin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = sin($1) }, count: count)
    }
    
    /// Calculates the sine of pi multiplied by each element in an array.
    ///
    /// out[i * iOut] = sin(x[i * ix] * pi), for 0 <= i < count
    public static func vsinpi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = sin($1 * .pi) }, count: count)
    }
    
    /// Calculates the sine of pi multiplied by each element in an array.
    ///
    /// out[i * iOut] = sin(x[i * ix] * pi), for 0 <= i < count
    public static func vsinpi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = sin($1 * .pi) }, count: count)
    }
    
    // MARK: vcos
    
    /// Calculates the cosine of each element in an array.
    ///
    /// out[i * iOut] = cos(x[i * ix]), for 0 <= i < count
    public static func vcos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = cos($1) }, count: count)
    }
    
    /// Calculates the cosine of each element in an array.
    ///
    /// out[i * iOut] = cos(x[i * ix]), for 0 <= i < count
    public static func vcos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = cos($1) }, count: count)
    }
    
    /// Calculates the cosine of pi multiplied by each element in an array.
    ///
    /// out[i * iOut] = cos(x[i * ix] * pi), for 0 <= i < count
    public static func vcospi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = cos($1 * .pi) }, count: count)
    }
    
    /// Calculates the cosine of pi multiplied by each element in an array.
    ///
    /// out[i * iOut] = cos(x[i * ix] * pi), for 0 <= i < count
    public static func vcospi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = cos($1 * .pi) }, count: count)
    }
    
    /// Calculates the sine and cosine of each element in an array.
    ///
    /// sin[i * iOut] = cos(x[i * ix] * pi),
    /// cos[i * iOut] = cos(x[i * ix] * pi), for 0 <= i < count
    public static func vsincos(x: UnsafePointer<Float>,
                               sin: UnsafeMutablePointer<Float>,
                               cos: UnsafeMutablePointer<Float>,
                               count: Int) {
        map2(x: x, ix: 1, out1: sin, iOut1: 1, out2: cos, iOut2: 1, operation: {
            $0 = Foundation.sin($2)
            $1 = Foundation.cos($2)
        }, count: count)
    }
    
    /// Calculates the sine and cosine of each element in an array.
    ///
    /// sin[i * iOut] = cos(x[i * ix] * pi),
    /// cos[i * iOut] = cos(x[i * ix] * pi), for 0 <= i < count
    public static func vsincos(x: UnsafePointer<Double>,
                               sin: UnsafeMutablePointer<Double>,
                               cos: UnsafeMutablePointer<Double>,
                               count: Int) {
        map2(x: x, ix: 1, out1: sin, iOut1: 1, out2: cos, iOut2: 1, operation: {
            $0 = Foundation.sin($2)
            $1 = Foundation.cos($2)
        }, count: count)
    }
    
    // MARK: vtan
    
    /// Calculates the tangent of each element in an array.
    ///
    /// out[i * iOut] = tan(x[i * ix]), for 0 <= i < count
    public static func vtan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = tan($1) }, count: count)
    }
    
    /// Calculates the tangent of each element in an array.
    ///
    /// out[i * iOut] = tan(x[i * ix]), for 0 <= i < count
    public static func vtan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = tan($1) }, count: count)
    }
    
    /// Calculates the tangent of pi multiplied by each element in an array.
    ///
    /// out[i * iOut] = tan(x[i * ix] * pi), for 0 <= i < count
    public static func vtanpi(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = tan($1 * .pi) }, count: count)
    }
    
    /// Calculates the tangent of pi multiplied by each element in an array.
    ///
    /// out[i * iOut] = tan(x[i * ix] * pi), for 0 <= i < count
    public static func vtanpi(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = tan($1 * .pi) }, count: count)
    }
    
    // MARK: vasin
    
    /// Calculates the arcsine of each element in an array.
    ///
    /// out[i * iOut] = asin(x[i * ix]), for 0 <= i < count
    public static func vasin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = asin($1) }, count: count)
    }
    
    /// Calculates the arcsine of each element in an array.
    ///
    /// out[i * iOut] = asin(x[i * ix]), for 0 <= i < count
    public static func vasin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = asin($1) }, count: count)
    }
    
    // MARK: vacos
    
    /// Calculates the arccosine of each element in an array.
    ///
    /// out[i * iOut] = acos(x[i * ix]), for 0 <= i < count
    public static func vacos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = acos($1) }, count: count)
    }
    
    /// Calculates the arccosine of each element in an array.
    ///
    /// out[i * iOut] = acos(x[i * ix]), for 0 <= i < count
    public static func vacos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = acos($1) }, count: count)
    }
    
    // MARK: vatan
    
    /// Calculates the arctangent of each element in an array.
    ///
    /// out[i * iOut] = atan(x[i * ix]), for 0 <= i < count
    public static func vatan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = atan($1) }, count: count)
    }
    
    /// Calculates the arctangent of each element in an array.
    ///
    /// out[i * iOut] = atan(x[i * ix]), for 0 <= i < count
    public static func vatan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1,
            operation: { $0 = atan($1) }, count: count)
    }
    
    // MARK: vatan2
    
    /// Calculates the arctangent of each pair of elements in two arrays.
    ///
    /// out[i * iOut] = atan2(y[i * iy], x[i * ix]), for 0 <= i < count
    public static func vatan2(y: UnsafePointer<Float>, x: UnsafePointer<Float>,
                             out: UnsafeMutablePointer<Float>, count: Int) {
        map2(a: x, ia: 1, b: y, ib: 1, out: out, iOut: 1,
             operation: { $0 = atan2($2, $1) }, count: count)
    }
    
    /// Calculates the arctangent of each pair of elements in two arrays.
    ///
    /// out[i * iOut] = atan2(y[i * iy], x[i * ix]), for 0 <= i < count
    public static func vatan2(y: UnsafePointer<Double>, x: UnsafePointer<Double>,
                             out: UnsafeMutablePointer<Double>, count: Int) {
        map2(a: x, ia: 1, b: y, ib: 1, out: out, iOut: 1,
             operation: { $0 = atan2($2, $1) }, count: count)
    }
}
