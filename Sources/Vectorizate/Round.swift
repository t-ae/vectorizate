import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vceil
    
    /// out[i] = ceil(x[i]), for 0 <= i < count
    public static func vceil(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvceilf(out, x, &count)
    }
    
    /// out[i] = ceil(x[i]), for 0 <= i < count
    public static func vceil(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvceil(out, x, &count)
    }
    
    // MARK: vfloor
    
    /// out[i] = floor(x[i]), for 0 <= i < count
    public static func vfloor(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvfloorf(out, x, &count)
    }
    
    /// out[i] = floor(x[i]), for 0 <= i < count
    public static func vfloor(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvfloor(out, x, &count)
    }
    
    // MAKR: vint
    
    /// Rounding towards 0.
    /// out[i] = Float(Int(x[i])), for 0 <= i < count
    public static func vint(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvintf(out, x, &count)
    }
    
    /// Rounding towards 0.
    /// out[i] = Double(Int(x[i])), for 0 <= i < count
    public static func vint(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvint(out, x, &count)
    }
    
    // MAKR: vnint
    
    /// out[i] = round(x[i]), for 0 <= i < count
    public static func vnint(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvnintf(out, x, &count)
    }
    
    /// out[i] = round(x[i]), for 0 <= i < count
    public static func vnint(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvnint(out, x, &count)
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: vceil
    
    /// out[i] = ceil(x[i]), for 0 <= i < count
    public static func vceil(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = ceil($1)
        }, count: count)
    }
    
    /// out[i] = ceil(x[i]), for 0 <= i < count
    public static func vceil(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = ceil($1)
        }, count: count)
    }
    
    // MARK: vfloor
    
    /// out[i] = floor(x[i]), for 0 <= i < count
    public static func vfloor(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = floor($1)
        }, count: count)
    }
    
    /// out[i] = floor(x[i]), for 0 <= i < count
    public static func vfloor(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = floor($1)
        }, count: count)
    }
    
    // MAKR: vint
    
    /// Rounding towards 0.
    /// out[i] = Float(Int(x[i])), for 0 <= i < count
    public static func vint(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = Float(Int($1))
        }, count: count)
    }
    
    /// Rounding towards 0.
    /// out[i] = Double(Int(x[i])), for 0 <= i < count
    public static func vint(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = Double(Int($1))
        }, count: count)
    }
    
    // MAKR: vnint
    
    /// out[i] = round(x[i]), for 0 <= i < count
    public static func vnint(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = round($1)
        }, count: count)
    }
    
    /// out[i] = round(x[i]), for 0 <= i < count
    public static func vnint(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, ix: 1, out: out, iOut: 1, operation: {
            $0 = round($1)
        }, count: count)
    }
}
