import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vpow
    
    /// Raises each element in an array to the power of the corresponding element in a second array.
    ///
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpow(base: UnsafePointer<Float>, exponent: UnsafePointer<Float>,
                            out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvpowf(out, exponent, base, &count)
    }
    
    /// Raises each element in an array to the power of the corresponding element in a second array.
    ///
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpow(base: UnsafePointer<Double>, exponent: UnsafePointer<Double>,
                            out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvpow(out, exponent, base, &count)
    }
    
    // MARK: pows
    
    /// Calculates, elementwise, x**y for a vector x and a scalar y.
    ///
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpows(base: UnsafePointer<Float>, exponent: Float,
                            out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        var exponent = exponent
        vvpowsf(out, &exponent, base, &count)
    }
    
    /// Calculates, elementwise, x**y for a vector x and a scalar y.
    ///
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpows(base: UnsafePointer<Double>, exponent: Double,
                             out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        var exponent = exponent
        vvpows(out, &exponent, base, &count)
    }
    
    // MARK: sqrt
    
    /// Calculates the square root of each element in an array.
    ///
    /// out[i] = sqrt(x[i]), for 0 <= i < count
    public static func vsqrt(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsqrtf(out, x, &count)
    }
    
    /// Calculates the square root of each element in an array.
    ///
    /// out[i] = sqrt(x[i]), for 0 <= i < count
    public static func vsqrt(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsqrt(out, x, &count)
    }
    
    // MARK: rsqrt
    
    /// Calculates the reciprocal square root of each element in an array.
    ///
    /// out[i] = 1 / sqrt(x[i]), for 0 <= i < count
    public static func vrsqrt(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvrsqrtf(out, x, &count)
    }
    
    /// Calculates the reciprocal square root of each element in an array.
    ///
    /// out[i] = 1 / sqrt(x[i]), for 0 <= i < count
    public static func vrsqrt(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvrsqrt(out, x, &count)
    }
    
    // MARK: cbrt
    
    /// Calculates the cube root for each element of a vector.
    ///
    /// out[i] = cbrt(x[i]), for 0 <= i < count
    public static func vcbrt(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvcbrtf(out, x, &count)
    }
    
    /// Calculates the cube root for each element of a vector.
    ///
    /// out[i] = cbrt(x[i]), for 0 <= i < count
    public static func vcbrt(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcbrt(out, x, &count)
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: vpow
    
    /// Raises each element in an array to the power of the corresponding element in a second array.
    ///
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpow(base: UnsafePointer<Float>, exponent: UnsafePointer<Float>,
                            out: UnsafeMutablePointer<Float>, count: Int) {
        map2(a: base, ia: 1, b: exponent, ib: 1, out: out, iOut: 1, operation: {
            $0 = pow($1, $2)
        }, count: count)
    }
    
    /// Raises each element in an array to the power of the corresponding element in a second array.
    ///
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpow(base: UnsafePointer<Double>, exponent: UnsafePointer<Double>,
                            out: UnsafeMutablePointer<Double>, count: Int) {
        map2(a: base, ia: 1, b: exponent, ib: 1, out: out, iOut: 1, operation: {
            $0 = pow($1, $2)
        }, count: count)
    }
    
    // MARK: pows
    
    /// Calculates, elementwise, x**y for a vector x and a scalar y.
    ///
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpows(base: UnsafePointer<Float>, exponent: Float,
                             out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: base, ix: 1, out: out, iOut: 1, operation: {
            $0 = pow($1, exponent)
        }, count: count)
    }
    
    /// Calculates, elementwise, x**y for a vector x and a scalar y.
    ///
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpows(base: UnsafePointer<Double>, exponent: Double,
                             out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: base, ix: 1, out: out, iOut: 1, operation: {
            $0 = pow($1, exponent)
        }, count: count)
    }
    
    // MARK: sqrt
    
    /// Calculates the square root of each element in an array.
    ///
    /// out[i] = sqrt(x[i]), for 0 <= i < count
    public static func vsqrt(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = sqrt($1)
        }, count: count)
    }
    
    /// Calculates the square root of each element in an array.
    ///
    /// out[i] = sqrt(x[i]), for 0 <= i < count
    public static func vsqrt(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = sqrt($1)
        }, count: count)
    }
    
    // MARK: rsqrt
    
    /// Calculates the reciprocal square root of each element in an array.
    ///
    /// out[i] = 1 / sqrt(x[i]), for 0 <= i < count
    public static func vrsqrt(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = 1 / sqrt($1)
        }, count: count)
    }
    
    /// Calculates the reciprocal square root of each element in an array.
    ///
    /// out[i] = 1 / sqrt(x[i]), for 0 <= i < count
    public static func vrsqrt(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = 1 / sqrt($1)
        }, count: count)
    }
    
    // MARK: cbrt
    
    /// Calculates the cube root for each element of a vector.
    ///
    /// out[i] = cbrt(x[i]), for 0 <= i < count
    public static func vcbrt(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = cbrt($1)
        }, count: count)
    }
    
    /// Calculates the cube root for each element of a vector.
    ///
    /// out[i] = cbrt(x[i]), for 0 <= i < count
    public static func vcbrt(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = cbrt($1)
        }, count: count)
    }
}
