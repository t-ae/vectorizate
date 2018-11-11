import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vpow
    
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpow(base: UnsafePointer<Float>, exponent: UnsafePointer<Float>,
                            out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvpowf(out, exponent, base, &count)
    }
    
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpow(base: UnsafePointer<Double>, exponent: UnsafePointer<Double>,
                            out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvpow(out, exponent, base, &count)
    }
    
    // MARK: pows
    
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpows(base: UnsafePointer<Float>, exponent: Float,
                            out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        var exponent = exponent
        vvpowsf(out, &exponent, base, &count)
    }
    
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpows(base: UnsafePointer<Double>, exponent: Double,
                             out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        var exponent = exponent
        vvpows(out, &exponent, base, &count)
    }
    
    // MARK: sqrt
    
    /// out[i] = sqrt(base[i]), for 0 <= i < count
    public static func vsqrt(base: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsqrtf(out, base, &count)
    }
    
    /// out[i] = sqrt(base[i]), for 0 <= i < count
    public static func vsqrt(base: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsqrt(out, base, &count)
    }
    
    // MARK: rsqrt
    
    /// out[i] = 1 / sqrt(base[i]), for 0 <= i < count
    public static func vrsqrt(base: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvrsqrtf(out, base, &count)
    }
    
    /// out[i] = sqrt(base[i]), for 0 <= i < count
    public static func vrsqrt(base: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvrsqrt(out, base, &count)
    }
    
    // MARK: cbrt
    
    /// out[i] = cbrt(base[i]), for 0 <= i < count
    public static func vcbrt(base: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvcbrtf(out, base, &count)
    }
    
    /// out[i] = cbrt(base[i]), for 0 <= i < count
    public static func vcbrt(base: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcbrt(out, base, &count)
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: vpow
    
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpow(base: UnsafePointer<Float>, exponent: UnsafePointer<Float>,
                            out: UnsafeMutablePointer<Float>, count: Int) {
        map2(a: base, ia: 1, b: exponent, ib: 1, out: out, iOut: 1, operation: {
            $0 = pow($1, $2)
        }, count: count)
    }
    
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpow(base: UnsafePointer<Double>, exponent: UnsafePointer<Double>,
                            out: UnsafeMutablePointer<Double>, count: Int) {
        map2(a: base, ia: 1, b: exponent, ib: 1, out: out, iOut: 1, operation: {
            $0 = pow($1, $2)
        }, count: count)
    }
    
    // MARK: pows
    
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpows(base: UnsafePointer<Float>, exponent: Float,
                             out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: base, ix: 1, out: out, iOut: 1, operation: {
            $0 = pow($1, exponent)
        }, count: count)
    }
    
    /// out[i] = base[i] ** exponent[i], for 0 <= i < count
    public static func vpows(base: UnsafePointer<Double>, exponent: Double,
                             out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: base, ix: 1, out: out, iOut: 1, operation: {
            $0 = pow($1, exponent)
        }, count: count)
    }
    
    // MARK: sqrt
    
    /// out[i] = sqrt(base[i]), for 0 <= i < count
    public static func vsqrt(base: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: base, ix: 1, out: out, iOut: 1, operation: {
            $0 = sqrt($1)
        }, count: count)
    }
    
    /// out[i] = sqrt(base[i]), for 0 <= i < count
    public static func vsqrt(base: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: base, ix: 1, out: out, iOut: 1, operation: {
            $0 = sqrt($1)
        }, count: count)
    }
    
    // MARK: rsqrt
    
    /// out[i] = 1 / sqrt(base[i]), for 0 <= i < count
    public static func vrsqrt(base: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: base, ix: 1, out: out, iOut: 1, operation: {
            $0 = 1 / sqrt($1)
        }, count: count)
    }
    
    /// out[i] = sqrt(base[i]), for 0 <= i < count
    public static func vrsqrt(base: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: base, ix: 1, out: out, iOut: 1, operation: {
            $0 = 1 / sqrt($1)
        }, count: count)
    }
    
    // MARK: cbrt
    
    /// out[i] = cbrt(base[i]), for 0 <= i < count
    public static func vcbrt(base: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: base, ix: 1, out: out, iOut: 1, operation: {
            $0 = cbrt($1)
        }, count: count)
    }
    
    /// out[i] = cbrt(base[i]), for 0 <= i < count
    public static func vcbrt(base: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: base, ix: 1, out: out, iOut: 1, operation: {
            $0 = cbrt($1)
        }, count: count)
    }
}
