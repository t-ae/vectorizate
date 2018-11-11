import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: - From integer
    
    // MARK: From UInt8
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<UInt8>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vfltu8(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<UInt8>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vfltu8D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: From UInt16
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<UInt16>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vfltu16(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<UInt16>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vfltu16D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: From UInt32
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<UInt32>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vfltu32(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<UInt32>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vfltu32D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: From Int8
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<Int8>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vflt8(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<Int8>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vflt8D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: From Int16
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<Int16>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vflt16(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<Int16>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vflt16D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: From Int32
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<Int32>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vflt32(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<Int32>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vflt32D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: - To integer, rounding towards zero.
    
    // MARK: To UInt8
    
    /// out[i * iOut] = UInt8(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<UInt8>, iOut: Int,
                            count: Int) {
        vDSP_vfixu8(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = UInt8(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<UInt8>, iOut: Int,
                            count: Int) {
        vDSP_vfixu8D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To UInt16
    
    /// out[i * iOut] = UInt16(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<UInt16>, iOut: Int,
                            count: Int) {
        vDSP_vfixu16(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = UInt16(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<UInt16>, iOut: Int,
                            count: Int) {
        vDSP_vfixu16D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To UInt32
    
    /// out[i * iOut] = UInt32(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<UInt32>, iOut: Int,
                            count: Int) {
        vDSP_vfixu32(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = UInt32(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<UInt32>, iOut: Int,
                            count: Int) {
        vDSP_vfixu32D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To Int8
    
    /// out[i * iOut] = Int8(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Int8>, iOut: Int,
                            count: Int) {
        vDSP_vfix8(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = Int8(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Int8>, iOut: Int,
                            count: Int) {
        vDSP_vfix8D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To Int16
    
    /// out[i * iOut] = Int16(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Int16>, iOut: Int,
                            count: Int) {
        vDSP_vfix16(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = Int16(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Int16>, iOut: Int,
                            count: Int) {
        vDSP_vfix16D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To Int32
    
    /// out[i * iOut] = Int32(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Int32>, iOut: Int,
                            count: Int) {
        vDSP_vfix32(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = Int32(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Int32>, iOut: Int,
                            count: Int) {
        vDSP_vfix32D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: - To integer, rounding
    
    // MARK: To UInt8
    
    /// out[i * iOut] = UInt8(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<UInt8>, iOut: Int,
                             count: Int) {
        vDSP_vfixru8(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = UInt8(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<UInt8>, iOut: Int,
                             count: Int) {
        vDSP_vfixru8D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To UInt16
    
    /// out[i * iOut] = UInt16(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<UInt16>, iOut: Int,
                             count: Int) {
        vDSP_vfixru16(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = UInt16(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<UInt16>, iOut: Int,
                             count: Int) {
        vDSP_vfixru16D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To UInt32
    
    /// out[i * iOut] = UInt32(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<UInt32>, iOut: Int,
                             count: Int) {
        vDSP_vfixru32(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = UInt32(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<UInt32>, iOut: Int,
                             count: Int) {
        vDSP_vfixru32D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To Int8
    
    /// out[i * iOut] = Int8(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Int8>, iOut: Int,
                             count: Int) {
        vDSP_vfixr8(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = Int8(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Int8>, iOut: Int,
                             count: Int) {
        vDSP_vfixr8D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To Int16
    
    /// out[i * iOut] = Int16(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Int16>, iOut: Int,
                             count: Int) {
        vDSP_vfixr16(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = Int16(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Int16>, iOut: Int,
                             count: Int) {
        vDSP_vfixr16D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: To Int32
    
    /// out[i * iOut] = Int32(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Int32>, iOut: Int,
                             count: Int) {
        vDSP_vfixr32(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = Int32(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Int32>, iOut: Int,
                             count: Int) {
        vDSP_vfixr32D(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: Float <-> Double
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vspdp(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        vDSP_vspdp(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vdpsp(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        vDSP_vdpsp(x, ix, out, iOut, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: - From integer
    
    // MARK: From UInt8
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<UInt8>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Float($1) }, count: count)
    }
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<UInt8>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Double($1) }, count: count)
    }
    
    // MARK: From UInt16
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<UInt16>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Float($1) }, count: count)
    }
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<UInt16>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Double($1) }, count: count)
    }
    
    // MARK: From UInt32
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<UInt32>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Float($1) }, count: count)
    }
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<UInt32>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Double($1) }, count: count)
    }
    
    // MARK: From Int8
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<Int8>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Float($1) }, count: count)
    }
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<Int8>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Double($1) }, count: count)
    }
    
    // MARK: From Int16
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<Int16>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Float($1) }, count: count)
    }
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<Int16>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Double($1) }, count: count)
    }
    
    // MARK: From Int32
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<Int32>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Float($1) }, count: count)
    }
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vflt(x: UnsafePointer<Int32>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Double($1) }, count: count)
    }
    
    // MARK: - To integer, rounding towards zero.
    
    // MARK: To UInt8
    
    /// out[i * iOut] = UInt8(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<UInt8>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = UInt8($1) }, count: count)
    }
    
    /// out[i * iOut] = UInt8(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<UInt8>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = UInt8($1) }, count: count)
    }
    
    // MARK: To UInt16
    
    /// out[i * iOut] = UInt16(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<UInt16>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = UInt16($1) }, count: count)
    }
    
    /// out[i * iOut] = UInt16(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<UInt16>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = UInt16($1) }, count: count)
    }
    
    // MARK: To UInt32
    
    /// out[i * iOut] = UInt32(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<UInt32>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = UInt32($1) }, count: count)
    }
    
    /// out[i * iOut] = UInt32(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<UInt32>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = UInt32($1) }, count: count)
    }
    
    // MARK: To Int8
    
    /// out[i * iOut] = Int8(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Int8>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Int8($1) }, count: count)
    }
    
    /// out[i * iOut] = Int8(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Int8>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Int8($1) }, count: count)
    }
    
    // MARK: To Int16
    
    /// out[i * iOut] = Int16(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Int16>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Int16($1) }, count: count)
    }
    
    /// out[i * iOut] = Int16(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Int16>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Int16($1) }, count: count)
    }
    
    // MARK: To Int32
    
    /// out[i * iOut] = Int32(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Int32>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Int32($1) }, count: count)
    }
    
    /// out[i * iOut] = Int32(x[i * ix]), for 0 <= i < count
    public static func vfix(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Int32>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Int32($1) }, count: count)
    }
    
    // MARK: - To integer, rounding
    
    // MARK: To UInt8
    
    /// out[i * iOut] = UInt8(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<UInt8>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = UInt8(round($1)) }, count: count)
    }
    
    /// out[i * iOut] = UInt8(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<UInt8>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = UInt8(round($1)) }, count: count)
    }
    
    // MARK: To UInt16
    
    /// out[i * iOut] = UInt16(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<UInt16>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = UInt16(round($1)) }, count: count)
    }
    
    /// out[i * iOut] = UInt16(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<UInt16>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = UInt16(round($1)) }, count: count)
    }
    
    // MARK: To UInt32
    
    /// out[i * iOut] = UInt32(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<UInt32>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = UInt32(round($1)) }, count: count)
    }
    
    /// out[i * iOut] = UInt32(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<UInt32>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = UInt32(round($1)) }, count: count)
    }
    
    // MARK: To Int8
    
    /// out[i * iOut] = Int8(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Int8>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Int8(round($1)) }, count: count)
    }
    
    /// out[i * iOut] = Int8(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Int8>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Int8(round($1)) }, count: count)
    }
    
    // MARK: To Int16
    
    /// out[i * iOut] = Int16(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Int16>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Int16(round($1)) }, count: count)
    }
    
    /// out[i * iOut] = Int16(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Int16>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Int16(round($1)) }, count: count)
    }
    
    // MARK: To Int32
    
    /// out[i * iOut] = Int32(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Int32>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Int32(round($1)) }, count: count)
    }
    
    /// out[i * iOut] = Int32(round(x[i * ix])), for 0 <= i < count
    public static func vfixr(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Int32>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Int32(round($1)) }, count: count)
    }
    
    // MARK: Float <-> Double
    
    /// out[i * iOut] = Double(x[i * ix]), for 0 <= i < count
    public static func vspdp(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Double($1) }, count: count)
    }
    
    /// out[i * iOut] = Float(x[i * ix]), for 0 <= i < count
    public static func vdpsp(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = Float($1) }, count: count)
    }
}
