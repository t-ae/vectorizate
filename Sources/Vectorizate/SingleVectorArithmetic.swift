#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vabs
    
    /// Vector absolute values.
    ///
    /// out[i * iOut] = abs(x[i * ix]), for 0 <= i < count
    public static func vabs(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vabs(x, ix, out, iOut, UInt(count))
    }
    
    /// Vector absolute values.
    ///
    /// out[i * iOut] = abs(x[i * ix]), for 0 <= i < count
    public static func vabs(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vabsD(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: vnabs
    
    /// Vector negative absolute values.
    ///
    /// out[i * iOut] = -abs(x[i * ix]), for 0 <= i < count
    public static func vnabs(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        vDSP_vnabs(x, ix, out, iOut, UInt(count))
    }
    
    /// Vector negative absolute values.
    ///
    /// out[i * iOut] = -abs(x[i * ix]), for 0 <= i < count
    public static func vnabs(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        vDSP_vnabsD(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: vneg
    
    /// Vector negative values.
    ///
    /// out[i * iOut] = -x[i * ix], for 0 <= i < count
    public static func vneg(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vneg(x, ix, out, iOut, UInt(count))
    }
    
    /// Vector negative values.
    ///
    /// out[i * iOut] = -x[i * ix], for 0 <= i < count
    public static func vneg(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vnegD(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: vsq
    
    /// Compute square values of vector.
    ///
    /// out[i * iOut] = x[i * ix]**2, for 0 <= i < count
    public static func vsq(x: UnsafePointer<Float>, ix: Int,
                           out: UnsafeMutablePointer<Float>, iOut: Int,
                           count: Int) {
        vDSP_vsq(x, ix, out, iOut, UInt(count))
    }
    
    /// Compute square values of vector.
    ///
    /// out[i * iOut] = x[i * ix]**2, for 0 <= i < count
    public static func vsq(x: UnsafePointer<Double>, ix: Int,
                           out: UnsafeMutablePointer<Double>, iOut: Int,
                           count: Int) {
        vDSP_vsqD(x, ix, out, iOut, UInt(count))
    }
    
    // MARK: vssq
    
    /// Compute signed square values of vector.
    ///
    /// out[i * iOut] = x[i * ix]*abs(x[i * ix]), for 0 <= i < count
    public static func vssq(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        vDSP_vssq(x, ix, out, iOut, UInt(count))
    }
    
    /// Compute signed square values of vector.
    ///
    /// out[i * iOut] = x[i * ix]*abs(x[i * ix]), for 0 <= i < count
    public static func vssq(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        vDSP_vssqD(x, ix, out, iOut, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    // MARK: vabs
    
    /// Vector absolute values.
    ///
    /// out[i * iOut] = abs(x[i * ix]), for 0 <= i < count
    public static func vabs(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = abs($1) }, count: count)
    }
    
    /// Vector absolute values.
    ///
    /// out[i * iOut] = abs(x[i * ix]), for 0 <= i < count
    public static func vabs(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = abs($1) }, count: count)
    }
    
    // MARK: vnabs
    
    /// Vector negative absolute values.
    ///
    /// out[i * iOut] = -abs(x[i * ix]), for 0 <= i < count
    public static func vnabs(x: UnsafePointer<Float>, ix: Int,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = -abs($1) }, count: count)
    }
    
    /// Vector negative absolute values.
    ///
    /// out[i * iOut] = -abs(x[i * ix]), for 0 <= i < count
    public static func vnabs(x: UnsafePointer<Double>, ix: Int,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = -abs($1) }, count: count)
    }
    
    // MARK: vneg
    
    /// Vector neagtive values.
    ///
    /// out[i * iOut] = -x[i * ix], for 0 <= i < count
    public static func vneg(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = -$1 }, count: count)
    }
    
    /// Vector negative values.
    ///
    /// out[i * iOut] = -x[i * ix], for 0 <= i < count
    public static func vneg(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = -$1 }, count: count)
    }
    
    // MARK: vsq
    
    /// Compute square values of vector.
    ///
    /// out[i * iOut] = x[i * ix]**2, for 0 <= i < count
    public static func vsq(x: UnsafePointer<Float>, ix: Int,
                           out: UnsafeMutablePointer<Float>, iOut: Int,
                           count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = $1*$1 }, count: count)
    }
    
    /// Compute square values of vector.
    ///
    /// out[i * iOut] = x[i * ix]**2, for 0 <= i < count
    public static func vsq(x: UnsafePointer<Double>, ix: Int,
                           out: UnsafeMutablePointer<Double>, iOut: Int,
                           count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = $1*$1 }, count: count)
    }
    
    // MARK: vssq
    
    /// Compute signed square values of vector.
    ///
    /// out[i * iOut] = x[i * ix]*abs(x[i * ix]), for 0 <= i < count
    public static func vssq(x: UnsafePointer<Float>, ix: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = abs($1)*$1 }, count: count)
    }
    
    /// Compute signed square values of vector.
    ///
    /// out[i * iOut] = x[i * ix]*abs(x[i * ix]), for 0 <= i < count
    public static func vssq(x: UnsafePointer<Double>, ix: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = abs($1)*$1 }, count: count)
    }
}
