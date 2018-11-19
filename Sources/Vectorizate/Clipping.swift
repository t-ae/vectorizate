import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: vclip
    
    /// Vector clip.
    ///
    /// out[i * iOut] = max(min(x[i * ix], high), low), for 0 <= i < count
    public static func vclip(x: UnsafePointer<Float>, ix: Int,
                             low: Float, high: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        var low = low
        var high = high
        vDSP_vclip(x, ix, &low, &high, out, iOut, UInt(count))
    }
    
    /// Vector clip.
    ///
    /// out[i * iOut] = max(min(x[i * ix], high), low), for 0 <= i < count
    public static func vclip(x: UnsafePointer<Double>, ix: Int,
                             low: Double, high: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        var low = low
        var high = high
        vDSP_vclipD(x, ix, &low, &high, out, iOut, UInt(count))
    }
    
    // MARK: viclip
    
    /// Vector inverted clip.
    ///
    /// out[i * iOut] = max(min(x[i * ix], high), low), for 0 <= i < count
    public static func viclip(x: UnsafePointer<Float>, ix: Int,
                              low: Float, high: Float,
                              out: UnsafeMutablePointer<Float>, iOut: Int,
                              count: Int) {
        var low = low
        var high = high
        vDSP_viclip(x, ix, &low, &high, out, iOut, UInt(count))
    }
    
    /// Vector inverted clip.
    ///
    /// out[i * iOut] = max(min(x[i * ix], high), low), for 0 <= i < count
    public static func viclip(x: UnsafePointer<Double>, ix: Int,
                              low: Double, high: Double,
                              out: UnsafeMutablePointer<Double>, iOut: Int,
                              count: Int) {
        var low = low
        var high = high
        vDSP_viclipD(x, ix, &low, &high, out, iOut, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    private static func _viclip<T: BinaryFloatingPoint>(x: UnsafePointer<T>, ix: Int,
                                                        low: T, high: T,
                                                        out: UnsafeMutablePointer<T>, iOut: Int,
                                                        count: Int) {
        var x = x
        var out = out
        for _ in 0..<count {
            if x.pointee <= low || x.pointee >= high{
                out.pointee = x.pointee
            } else if x.pointee < 0 {
                out.pointee = low
            } else {
                out.pointee = high
            }
            x += ix
            out += iOut
        }
    }
    
    // MARK: vclip
    
    /// Vector clip.
    ///
    /// out[i * iOut] = max(min(x[i * ix], high), low), for 0 <= i < count
    public static func vclip(x: UnsafePointer<Float>, ix: Int,
                             low: Float, high: Float,
                             out: UnsafeMutablePointer<Float>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = min(max($1, low), high) }, count: count)
    }
    
    /// Vector clip.
    ///
    /// out[i * iOut] = max(min(x[i * ix], high), low), for 0 <= i < count
    public static func vclip(x: UnsafePointer<Double>, ix: Int,
                             low: Double, high: Double,
                             out: UnsafeMutablePointer<Double>, iOut: Int,
                             count: Int) {
        map(x: x, ix: ix, out: out, iOut: iOut,
            operation: { $0 = min(max($1, low), high) }, count: count)
    }
    
    // MARK: viclip
    
    /// Vector inverted clip.
    ///
    /// out[i * iOut] = max(min(x[i * ix], high), low), for 0 <= i < count
    public static func viclip(x: UnsafePointer<Float>, ix: Int,
                              low: Float, high: Float,
                              out: UnsafeMutablePointer<Float>, iOut: Int,
                              count: Int) {
        _viclip(x: x, ix: ix, low: low, high: high, out: out, iOut: iOut, count: count)
    }
    
    /// Vector inverted clip.
    ///
    /// out[i * iOut] = max(min(x[i * ix], high), low), for 0 <= i < count
    public static func viclip(x: UnsafePointer<Double>, ix: Int,
                              low: Double, high: Double,
                              out: UnsafeMutablePointer<Double>, iOut: Int,
                              count: Int) {
        _viclip(x: x, ix: ix, low: low, high: high, out: out, iOut: iOut, count: count)
    }
}
