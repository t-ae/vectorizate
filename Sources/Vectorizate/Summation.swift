import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: sve
    
    /// out = sum(x[i * ix]), for 0 <= i < count
    public static func sve(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_sve(x, ix, &out, UInt(count))
    }
    
    /// out = sum(x[i * ix]), for 0 <= i < count
    public static func sve(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_sveD(x, ix, &out, UInt(count))
    }
    
    // MARK: svemg
    
    /// out = sum(abs(x[i * ix])), for 0 <= i < count
    public static func svemg(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_svemg(x, ix, &out, UInt(count))
    }
    
    /// out = sum(abs(x[i * ix])), for 0 <= i < count
    public static func svemg(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_svemgD(x, ix, &out, UInt(count))
    }
    
    // MARK: svesq
    
    /// out = sum(x[i * ix] ** 2), for 0 <= i < count
    public static func svesq(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_svesq(x, ix, &out, UInt(count))
    }
    
    /// out = sum(x[i * ix] ** 2), for 0 <= i < count
    public static func svesq(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_svesqD(x, ix, &out, UInt(count))
    }
    
    // MARK: sve_svesq
    
    /// sum = sum(x[i * ix]), for 0 <= i < count
    /// sum2 = sum(x[i * ix] ** 2), for 0 <= i < count
    public static func sve_svesq(x: UnsafePointer<Float>, ix: Int,
                   sum: inout Float, sum2: inout Float,
                   count: Int) {
        vDSP_sve_svesq(x, ix, &sum, &sum2, UInt(count))
    }
    
    /// sum = sum(x[i * ix]), for 0 <= i < count
    /// sum2 = sum(x[i * ix] ** 2), for 0 <= i < count
    public static func sve_svesq(x: UnsafePointer<Double>, ix: Int,
                   sum: inout Double, sum2: inout Double,
                   count: Int) {
        vDSP_sve_svesqD(x, ix, &sum, &sum2, UInt(count))
    }
    
    // MARK: svs
    
    /// out = sum(x[i * ix] * abs(x[i * ix])), for 0 <= i < count
    public static func svs(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_svs(x, ix, &out, UInt(count))
    }
    
    /// out = sum(x[i * ix] * abs(x[i * ix])), for 0 <= i < count
    public static func svs(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_svsD(x, ix, &out, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: sve
    
    /// out = sum(x[i * ix]), for 0 <= i < count
    public static func sve(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: +=, count: count)
    }
    
    /// out = sum(x[i * ix]), for 0 <= i < count
    public static func sve(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: +=, count: count)
    }
    
    // MARK: svemg
    
    /// out = sum(abs(x[i * ix])), for 0 <= i < count
    public static func svemg(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: { $0 += abs($1) }, count: count)
    }
    
    /// out = sum(abs(x[i * ix])), for 0 <= i < count
    public static func svemg(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: { $0 += abs($1) }, count: count)
    }
    
    // MARK: svesq
    
    /// out = sum(x[i * ix] ** 2), for 0 <= i < count
    public static func svesq(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: { $0 += $1*$1 }, count: count)
    }
    
    /// out = sum(x[i * ix] ** 2), for 0 <= i < count
    public static func svesq(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: { $0 += $1*$1 }, count: count)
    }
    
    // MARK: sve_svesq
    
    /// sum = sum(x[i * ix]), for 0 <= i < count
    /// sum2 = sum(x[i * ix] ** 2), for 0 <= i < count
    public static func sve_svesq(x: UnsafePointer<Float>, ix: Int,
                                 sum: inout Float, sum2: inout Float,
                                 count: Int) {
        reduce2(x: x, ix: ix, out1: &sum, out2: &sum2, operation: {
            $0 += $2
            $1 += $2*$2
        }, count: count)
    }
    
    /// sum = sum(x[i * ix]), for 0 <= i < count
    /// sum2 = sum(x[i * ix] ** 2), for 0 <= i < count
    public static func sve_svesq(x: UnsafePointer<Double>, ix: Int,
                                 sum: inout Double, sum2: inout Double,
                                 count: Int) {
        reduce2(x: x, ix: ix, out1: &sum, out2: &sum2, operation: {
            $0 += $2
            $1 += $2*$2
        }, count: count)
    }
    
    // MARK: svs
    
    /// out = sum(x[i * ix] * abs(x[i * ix])), for 0 <= i < count
    public static func svs(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: { $0 += abs($1)*$1 }, count: count)
    }
    
    /// out = sum(x[i * ix] * abs(x[i * ix])), for 0 <= i < count
    public static func svs(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: { $0 += abs($1)*$1 }, count: count)
    }
}
