import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: - From integer
    
    // MARK: From UInt8
    public static func vflt(x: UnsafePointer<UInt8>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vfltu8(x, ix, out, iOut, UInt(count))
    }
    
    public static func vflt(x: UnsafePointer<UInt8>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vfltu8D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: From UInt16
    public static func vflt(x: UnsafePointer<UInt16>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vfltu16(x, ix, out, iOut, UInt(count))
    }
    
    public static func vflt(x: UnsafePointer<UInt16>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vfltu16D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: From UInt32
    public static func vflt(x: UnsafePointer<UInt32>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vfltu32(x, ix, out, iOut, UInt(count))
    }
    
    public static func vflt(x: UnsafePointer<UInt32>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vfltu32D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: From Int8
    public static func vflt(x: UnsafePointer<Int8>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vflt8(x, ix, out, iOut, UInt(count))
    }
    
    public static func vflt(x: UnsafePointer<Int8>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vflt8D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: From Int16
    public static func vflt(x: UnsafePointer<Int16>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vflt16(x, ix, out, iOut, UInt(count))
    }
    
    public static func vflt(x: UnsafePointer<Int16>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vflt16D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: From Int32
    public static func vflt(x: UnsafePointer<Int32>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vflt32(x, ix, out, iOut, UInt(count))
    }
    
    public static func vflt(x: UnsafePointer<Int32>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vflt32D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: - To integer, rounding towards zero.
    
    // MARK: To UInt8
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<UInt8>, iOut: Int,
                            count: Int) {
        vDSP_vfixu8(x, ix, out, iOut, UInt(count))
    }
    
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<UInt8>, iOut: Int,
                            count: Int) {
        vDSP_vfixu8D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To UInt16
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<UInt16>, iOut: Int,
                            count: Int) {
        vDSP_vfixu16(x, ix, out, iOut, UInt(count))
    }
    
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<UInt16>, iOut: Int,
                            count: Int) {
        vDSP_vfixu16D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To UInt32
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<UInt32>, iOut: Int,
                            count: Int) {
        vDSP_vfixu32(x, ix, out, iOut, UInt(count))
    }
    
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<UInt32>, iOut: Int,
                            count: Int) {
        vDSP_vfixu32D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To Int8
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Int8>, iOut: Int,
                            count: Int) {
        vDSP_vfix8(x, ix, out, iOut, UInt(count))
    }
    
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Int8>, iOut: Int,
                            count: Int) {
        vDSP_vfix8D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To Int16
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Int16>, iOut: Int,
                            count: Int) {
        vDSP_vfix16(x, ix, out, iOut, UInt(count))
    }
    
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Int16>, iOut: Int,
                            count: Int) {
        vDSP_vfix16D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To Int32
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Int32>, iOut: Int,
                            count: Int) {
        vDSP_vfix32(x, ix, out, iOut, UInt(count))
    }
    
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Int32>, iOut: Int,
                            count: Int) {
        vDSP_vfix32D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: - To integer, rounding
    
    // MARK: To UInt8
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<UInt8>, iOut: Int,
                             count: Int) {
        vDSP_vfixru8(x, ix, out, iOut, UInt(count))
    }
    
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<UInt8>, iOut: Int,
                             count: Int) {
        vDSP_vfixru8D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To UInt16
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<UInt16>, iOut: Int,
                             count: Int) {
        vDSP_vfixru16(x, ix, out, iOut, UInt(count))
    }
    
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<UInt16>, iOut: Int,
                             count: Int) {
        vDSP_vfixru16D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To UInt32
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<UInt32>, iOut: Int,
                             count: Int) {
        vDSP_vfixru32(x, ix, out, iOut, UInt(count))
    }
    
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<UInt32>, iOut: Int,
                             count: Int) {
        vDSP_vfixru32D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To Int8
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Int8>, iOut: Int,
                             count: Int) {
        vDSP_vfixr8(x, ix, out, iOut, UInt(count))
    }
    
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Int8>, iOut: Int,
                             count: Int) {
        vDSP_vfixr8D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To Int16
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Int16>, iOut: Int,
                             count: Int) {
        vDSP_vfixr16(x, ix, out, iOut, UInt(count))
    }
    
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Int16>, iOut: Int,
                             count: Int) {
        vDSP_vfixr16D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To Int32
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Int32>, iOut: Int,
                             count: Int) {
        vDSP_vfixr32(x, ix, out, iOut, UInt(count))
    }
    
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Int32>, iOut: Int,
                             count: Int) {
        vDSP_vfixr32D(x, ix, out, iOut, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    private static func map<From, To>(x: UnsafePointer<From>, ix: Int,
                              out: UnsafeMutablePointer<To>, iOut: Int,
                              operation: (From)->To,
                              count: Int) {
        var x = x
        var out = out
        for _ in 0..<count {
            out.pointee = operation(x.pointee)
            x += ix
            out += iOut
        }
    }
    
    // MARK: - From integer
    
    // MARK: From UInt8
    public static func vflt(x: UnsafePointer<UInt8>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Float.init, count: count)
    }
    
    public static func vflt(x: UnsafePointer<UInt8>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Double.init, count: count)
    }
    
    // MARK: From UInt16
    public static func vflt(x: UnsafePointer<UInt16>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Float.init, count: count)
    }
    
    public static func vflt(x: UnsafePointer<UInt16>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Double.init, count: count)
    }
    
    // MARK: From UInt32
    public static func vflt(x: UnsafePointer<UInt32>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: { Float($0) }, count: count)
    }
    
    public static func vflt(x: UnsafePointer<UInt32>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Double.init, count: count)
    }
    
    // MARK: From Int8
    public static func vflt(x: UnsafePointer<Int8>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Float.init, count: count)
    }
    
    public static func vflt(x: UnsafePointer<Int8>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Double.init, count: count)
    }
    
    // MARK: From Int16
    public static func vflt(x: UnsafePointer<Int16>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Float.init, count: count)
    }
    
    public static func vflt(x: UnsafePointer<Int16>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Double.init, count: count)
    }
    
    // MARK: From Int32
    public static func vflt(x: UnsafePointer<Int32>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Float.init, count: count)
    }
    
    public static func vflt(x: UnsafePointer<Int32>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Double.init, count: count)
    }
    
    // MARK: - To integer, rounding towards zero.
    
    // MARK: To UInt8
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<UInt8>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: UInt8.init, count: count)
    }
    
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<UInt8>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: UInt8.init, count: count)
    }
    
    // MARK: To UInt16
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<UInt16>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: UInt16.init, count: count)
    }
    
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<UInt16>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: UInt16.init, count: count)
    }
    
    // MARK: To UInt32
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<UInt32>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: UInt32.init, count: count)
    }
    
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<UInt32>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: UInt32.init, count: count)
    }
    
    // MARK: To Int8
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Int8>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Int8.init, count: count)
    }
    
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Int8>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Int8.init, count: count)
    }
    
    // MARK: To Int16
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Int16>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Int16.init, count: count)
    }
    
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Int16>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Int16.init, count: count)
    }
    
    // MARK: To Int32
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Int32>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Int32.init, count: count)
    }
    
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Int32>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: Int32.init, count: count)
    }
    
    // MARK: - To integer, rounding
    
    // MARK: To UInt8
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<UInt8>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: { UInt8(round($0))}, count: count)
    }
    
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<UInt8>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: { UInt8(round($0))}, count: count)
    }
    
    // MARK: To UInt16
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<UInt16>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: { UInt16(round($0))}, count: count)
    }
    
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<UInt16>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: { UInt16(round($0))}, count: count)
    }
    
    // MARK: To UInt32
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<UInt32>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: { UInt32(round($0))}, count: count)
    }
    
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<UInt32>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: { UInt32(round($0))}, count: count)
    }
    
    // MARK: To Int8
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Int8>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: { Int8(round($0))}, count: count)
    }
    
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Int8>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: { Int8(round($0))}, count: count)
    }
    
    // MARK: To Int16
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Int16>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: { Int16(round($0))}, count: count)
    }
    
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Int16>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: { Int16(round($0))}, count: count)
    }
    
    // MARK: To Int32
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Int32>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: { Int32(round($0))}, count: count)
    }
    
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Int32>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut, operation: { Int32(round($0))}, count: count)
    }
}
