import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: meanv
    
    /// out = sum(x[i * ix]) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func meanv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_meanv(x, ix, &out, UInt(count))
    }
    
    /// out = sum(x[i * ix]) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func meanv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_meanvD(x, ix, &out, UInt(count))
    }
    
    // MARK: meamgv
    
    /// out = sum(abs(x[i * ix])) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func meamgv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_meamgv(x, ix, &out, UInt(count))
    }
    
    /// out = sum(abs(x[i * ix])) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func meamgv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_meamgvD(x, ix, &out, UInt(count))
    }
    
    // MARK: measqv
    
    /// out = sum(x[i * ix] ** 2) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func measqv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_measqv(x, ix, &out, UInt(count))
    }
    
    /// out = sum(x[i * ix] ** 2) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func measqv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_measqvD(x, ix, &out, UInt(count))
    }
    
    // MARK: mvessq
    
    /// out = sum(x[i * ix] * abs(x[i * ix])) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func mvessq(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_mvessq(x, ix, &out, UInt(count))
    }
    
    /// out = sum(x[i * ix] * abs(x[i * ix])) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func mvessq(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_mvessqD(x, ix, &out, UInt(count))
    }
    
    // MARK: rmsqv
    
    /// out = sqrt(sum(x[i * ix] * abs(x[i * ix]))) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func rmsqv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_rmsqv(x, ix, &out, UInt(count))
    }
    
    /// out = sqrt(sum(x[i * ix] * abs(x[i * ix]))) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func rmsqv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_rmsqvD(x, ix, &out, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: meanv
    
    /// out = sum(x[i * ix]) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func meanv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        if count > 0 {
            sve(x: x, ix: ix, out: &out, count: count)
            out /= .init(count)
        } else {
            out = .nan
        }
    }
    
    /// out = sum(x[i * ix]) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func meanv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        if count > 0 {
            sve(x: x, ix: ix, out: &out, count: count)
            out /= .init(count)
        } else {
            out = .nan
        }
    }
    
    // MARK: meamgv
    
    /// out = sum(abs(x[i * ix])) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func meamgv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        if count > 0 {
            svemg(x: x, ix: ix, out: &out, count: count)
            out /= .init(count)
        } else {
            out = .nan
        }
    }
    
    /// out = sum(abs(x[i * ix])) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func meamgv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        if count > 0 {
            svemg(x: x, ix: ix, out: &out, count: count)
            out /= .init(count)
        } else {
            out = .nan
        }
    }
    
    // MARK: measqv
    
    /// out = sum(x[i * ix] ** 2) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func measqv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        if count > 0 {
            svesq(x: x, ix: ix, out: &out, count: count)
            out /= .init(count)
        } else {
            out = .nan
        }
    }
    
    /// out = sum(x[i * ix] ** 2) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func measqv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        if count > 0 {
            svesq(x: x, ix: ix, out: &out, count: count)
            out /= .init(count)
        } else {
            out = .nan
        }
    }
    
    // MARK: mvessq
    
    /// out = sum(x[i * ix] * abs(x[i * ix])) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func mvessq(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        if count > 0 {
            svs(x: x, ix: ix, out: &out, count: count)
            out /= .init(count)
        } else {
            out = .nan
        }
    }
    
    /// out = sum(x[i * ix] * abs(x[i * ix])) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func mvessq(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        if count > 0 {
            svs(x: x, ix: ix, out: &out, count: count)
            out /= .init(count)
        } else {
            out = .nan
        }
    }
    
    // MARK: rmsqv
    
    /// out = sqrt(sum(x[i * ix] * abs(x[i * ix]))) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func rmsqv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        measqv(x: x, ix: ix, out: &out, count: count)
        out = sqrt(out)
    }
    
    /// out = sqrt(sum(x[i * ix] * abs(x[i * ix]))) / count, for 0 <= i < count
    /// out = NaN if count == 0
    public static func rmsqv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        measqv(x: x, ix: ix, out: &out, count: count)
        out = sqrt(out)
    }
}
