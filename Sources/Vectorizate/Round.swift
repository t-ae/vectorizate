import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vceil
    
    /// Calculates the ceiling of each element in an array.
    ///
    /// out[i] = ceil(x[i]), for 0 <= i < count
    public static func vceil(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvceilf(out, x, &count)
    }
    
    /// Calculates the ceiling of each element in an array.
    ///
    /// out[i] = ceil(x[i]), for 0 <= i < count
    public static func vceil(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvceil(out, x, &count)
    }
    
    // MARK: vfloor
    
    /// Calculates the floor of each element in an array.
    ///
    /// out[i] = floor(x[i]), for 0 <= i < count
    public static func vfloor(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvfloorf(out, x, &count)
    }
    
    /// Calculates the floor of each element in an array.
    ///
    /// out[i] = floor(x[i]), for 0 <= i < count
    public static func vfloor(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvfloor(out, x, &count)
    }
    
    // MAKR: vint
    
    /// Rounding towards 0.
    ///
    /// out[i] = trunc(x[i]), for 0 <= i < count
    public static func vint(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvintf(out, x, &count)
    }
    
    /// Rounding towards 0.
    ///
    /// out[i] = trunc(x[i]), for 0 <= i < count
    public static func vint(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvint(out, x, &count)
    }
    
    // MAKR: vnint
    
    /// Calculates the nearest integer for each element in an array.
    ///
    /// out[i] = round(x[i]), for 0 <= i < count
    public static func vnint(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvnintf(out, x, &count)
    }
    
    /// Calculates the nearest integer for each element in an array.
    ///
    /// out[i] = round(x[i]), for 0 <= i < count
    public static func vnint(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvnint(out, x, &count)
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: vceil
    
    /// Calculates the ceiling of each element in an array.
    ///
    /// out[i] = ceil(x[i]), for 0 <= i < count
    public static func vceil(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = ceil($1)
        }, count: count)
    }
    
    /// Calculates the ceiling of each element in an array.
    ///
    /// out[i] = ceil(x[i]), for 0 <= i < count
    public static func vceil(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = ceil($1)
        }, count: count)
    }
    
    // MARK: vfloor
    
    /// Calculates the floor of each element in an array.
    ///
    /// out[i] = floor(x[i]), for 0 <= i < count
    public static func vfloor(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = floor($1)
        }, count: count)
    }
    
    /// Calculates the floor of each element in an array.
    ///
    /// out[i] = floor(x[i]), for 0 <= i < count
    public static func vfloor(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = floor($1)
        }, count: count)
    }
    
    // MAKR: vint
    
    /// Rounding towards 0.
    ///
    /// out[i] = trunc(x[i]), for 0 <= i < count
    public static func vint(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = trunc($1)
        }, count: count)
    }
    
    /// Rounding towards 0.
    ///
    /// out[i] = trunc(x[i]), for 0 <= i < count
    public static func vint(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = trunc($1)
        }, count: count)
    }
    
    // MAKR: vnint
    
    /// Calculates the nearest integer for each element in an array.
    ///
    /// out[i] = round(x[i]), for 0 <= i < count
    public static func vnint(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = round($1)
        }, count: count)
    }
    
    /// Calculates the nearest integer for each element in an array.
    ///
    /// out[i] = round(x[i]), for 0 <= i < count
    public static func vnint(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = round($1)
        }, count: count)
    }
}
