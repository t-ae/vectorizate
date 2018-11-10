#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vabs
    /// out[i*iOut] = abs(x[i*ix]), for 0 <= i < count
    public static func vabs(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vabs(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i*iOut] = abs(x[i*ix]), for 0 <= i < count
    public static func vabs(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vabsD(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: vnabs
    
    /// out[i*iOut] = -abs(x[i*ix]), for 0 <= i < count
    public static func vnabs(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        vDSP_vnabs(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i*iOut] = -abs(x[i*ix]), for 0 <= i < count
    public static func vnabs(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        vDSP_vnabsD(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: vneg
    
    /// out[i*iOut] = -x[i*ix], for 0 <= i < count
    public static func vneg(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vneg(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i*iOut] = -x[i*ix], for 0 <= i < count
    public static func vneg(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vnegD(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: vsq
    /// out[i*iOut] = x[i*ix]**2, for 0 <= i < count
    public static func vsq(x: UnsafePointer<Float>, ix: Int,
                           out: UnsafeMutablePointer<Float>, iOut: Int,
                           count: Int) {
        vDSP_vsq(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i*iOut] = x[i*ix]**2, for 0 <= i < count
    public static func vsq(x: UnsafePointer<Double>, ix: Int,
                           out: UnsafeMutablePointer<Double>, iOut: Int,
                           count: Int) {
        vDSP_vsqD(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: vssq
    
    /// out[i*iOut] = x[i*ix]*abs(x[i*ix]), for 0 <= i < count
    public static func vssq(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vssq(x, ix, out, iOut, UInt(count))
    }
    
    /// out[i*iOut] = x[i*ix]*abs(x[i*ix]), for 0 <= i < count
    public static func vssq(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vssqD(x, ix, out, iOut, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    private static func map<T>(x: UnsafePointer<T>, ix: Int,
                               out: UnsafeMutablePointer<T>, iOut: Int,
                               operation: (T) -> T,
                               count: Int) {
        var x = x
        var out = out
        for _ in 0..<count {
            out.pointee = operation(x.pointee)
            x += ix
            out += iOut
        }
    }
    
    // MARK: vabs
    
    /// out[i*iOut] = abs(x[i*ix]), for 0 <= i < count
    public static func vabs(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: abs, count: count)
    }
    
    /// out[i*iOut] = abs(x[i*ix]), for 0 <= i < count
    public static func vabs(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: abs, count: count)
    }
    
    // MARK: vnabs
    
    /// out[i*iOut] = -abs(x[i*ix]), for 0 <= i < count
    public static func vnabs(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { -abs($0) }, count: count)
    }
    
    /// out[i*iOut] = -abs(x[i*ix]), for 0 <= i < count
    public static func vnabs(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { -abs($0) }, count: count)
    }
    
    // MARK: vneg
    
    /// out[i*iOut] = -x[i*ix], for 0 <= i < count
    public static func vneg(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: -, count: count)
    }
    
    /// out[i*iOut] = -x[i*ix], for 0 <= i < count
    public static func vneg(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: -, count: count)
    }
    
    // MARK: vsq
    
    /// out[i*iOut] = x[i*ix]**2, for 0 <= i < count
    public static func vsq(x: UnsafePointer<Float>, ix: Int,
                           out: UnsafeMutablePointer<Float>, iOut: Int,
                           count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0*$0 }, count: count)
    }
    
    /// out[i*iOut] = x[i*ix]**2, for 0 <= i < count
    public static func vsq(x: UnsafePointer<Double>, ix: Int,
                           out: UnsafeMutablePointer<Double>, iOut: Int,
                           count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0*$0 }, count: count)
    }
    
    // MARK: vssq
    
    /// out[i*iOut] = x[i*ix]*abs(x[i*ix]), for 0 <= i < count
    public static func vssq(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0*abs($0) }, count: count)
    }
    
    /// out[i*iOut] = x[i*ix]*abs(x[i*ix]), for 0 <= i < count
    public static func vssq(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0*abs($0) }, count: count)
    }
}
