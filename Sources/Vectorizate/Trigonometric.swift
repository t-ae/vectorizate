import Foundation

#if canImport(Accelerate)

import Accelerate

extension Vectorizate {
    // MARK: sin
    public static func sin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvsinf(out, x, &count)
    }
    
    public static func sin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvsin(out, x, &count)
    }
    
    // MARK: cos
    public static func cos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvcosf(out, x, &count)
    }
    
    public static func cos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvcos(out, x, &count)
    }
    
    // MARK: tan
    public static func tan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvtanf(out, x, &count)
    }
    
    public static func tan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvtan(out, x, &count)
    }
    
    // MARK: asin
    public static func asin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvasinf(out, x, &count)
    }
    
    public static func asin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvasin(out, x, &count)
    }
    
    // MARK: acos
    public static func acos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvacosf(out, x, &count)
    }
    
    public static func acos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvacos(out, x, &count)
    }
    
    // MARK: atan
    public static func atan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvatanf(out, x, &count)
    }
    
    public static func atan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvatan(out, x, &count)
    }
    
    // MARK: atan2
    public static func atan2(y: UnsafePointer<Float>, x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        var count = Int32(count)
        vvatan2f(out, y, x, &count)
    }
    
    public static func atan2(y: UnsafePointer<Double>, x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        var count = Int32(count)
        vvatan2(out, y, x, &count)
    }
}

#endif

extension VectorizateNoAccelerate {
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
    public static func sin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.sin, count: count)
    }
    
    public static func sin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.sin, count: count)
    }
    
    // MARK: cos
    public static func cos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.cos, count: count)
    }
    
    public static func cos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.cos, count: count)
    }
    
    // MARK: tan
    public static func tan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.tan, count: count)
    }
    
    public static func tan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.tan, count: count)
    }
    
    // MARK: asin
    public static func asin(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.asin, count: count)
    }
    
    public static func asin(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.asin, count: count)
    }
    
    // MARK: acos
    public static func acos(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.acos, count: count)
    }
    
    public static func acos(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.acos, count: count)
    }
    
    // MARK: atan
    public static func atan(x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
        map(x: x, out: out, operation: Foundation.atan, count: count)
    }
    
    public static func atan(x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
        map(x: x, out: out, operation: Foundation.atan, count: count)
    }
    
    // MARK: atan2
    public static func atan2(y: UnsafePointer<Float>, x: UnsafePointer<Float>, out: UnsafeMutablePointer<Float>, count: Int) {
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
    
    public static func atan2(y: UnsafePointer<Double>, x: UnsafePointer<Double>, out: UnsafeMutablePointer<Double>, count: Int) {
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
