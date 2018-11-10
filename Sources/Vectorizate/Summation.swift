import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: sve
    public static func sve(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_sve(x, ix, &out, UInt(count))
    }
    
    public static func sve(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_sveD(x, ix, &out, UInt(count))
    }
    
    // MARK: svemg
    public static func svemg(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_svemg(x, ix, &out, UInt(count))
    }
    
    public static func svemg(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_svemgD(x, ix, &out, UInt(count))
    }
    
    // MARK: svesq
    public static func svesq(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_svesq(x, ix, &out, UInt(count))
    }
    
    public static func svesq(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_svesqD(x, ix, &out, UInt(count))
    }
    
    // MARK: sve_svesq
    public static func sve_svesq(x: UnsafePointer<Float>, ix: Int,
                   sum: inout Float, sum2: inout Float,
                   count: Int) {
        vDSP_sve_svesq(x, ix, &sum, &sum2, UInt(count))
    }
    
    public static func sve_svesq(x: UnsafePointer<Double>, ix: Int,
                   sum: inout Double, sum2: inout Double,
                   count: Int) {
        vDSP_sve_svesqD(x, ix, &sum, &sum2, UInt(count))
    }
    
    // MARK: svs
    public static func svs(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_svs(x, ix, &out, UInt(count))
    }
    
    public static func svs(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_svsD(x, ix, &out, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    private static func reduce<T: BinaryFloatingPoint>(x: UnsafePointer<T>, ix: Int, out: inout T,
                                                       operation: (inout T, T)-> Void, count: Int) {
        var x = x
        out = 0
        for _ in 0..<count {
            operation(&out, x.pointee)
            x += ix
        }
    }
    
    // MARK: sve
    public static func sve(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: +=, count: count)
    }
    
    public static func sve(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: +=, count: count)
    }
    
    // MARK: svemg
    public static func svemg(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: { $0 += abs($1) }, count: count)
    }
    
    public static func svemg(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: { $0 += abs($1) }, count: count)
    }
    
    // MARK: svesq
    public static func svesq(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: { $0 += $1*$1 }, count: count)
    }
    
    public static func svesq(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: { $0 += $1*$1 }, count: count)
    }
    
    // MARK: sve_svesq
    public static func sve_svesq(x: UnsafePointer<Float>, ix: Int,
                                 sum: inout Float, sum2: inout Float,
                                 count: Int) {
        var x = x
        sum = 0
        sum2 = 0
        for _ in 0..<count {
            sum += x.pointee
            sum2 += x.pointee*x.pointee
            x += ix
        }
    }
    
    public static func sve_svesq(x: UnsafePointer<Double>, ix: Int,
                                 sum: inout Double, sum2: inout Double,
                                 count: Int) {
        var x = x
        sum = 0
        sum2 = 0
        for _ in 0..<count {
            sum += x.pointee
            sum2 += x.pointee*x.pointee
            x += ix
        }
    }
    
    // MARK: sve
    public static func svs(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: { $0 += abs($1)*$1 }, count: count)
    }
    
    public static func svs(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        reduce(x: x, ix: ix, out: &out, operation: { $0 += abs($1)*$1 }, count: count)
    }
}
