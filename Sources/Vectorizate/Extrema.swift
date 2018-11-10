import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    // MARK: maxv
    public static func maxv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_maxv(x, ix, &out, UInt(count))
    }
    
    public static func maxv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_maxvD(x, ix, &out, UInt(count))
    }
    
    // MARK: maxvi
    public static func maxvi(x: UnsafePointer<Float>, ix: Int,
                             out: inout Float, index: inout UInt,
                             count: Int) {
        vDSP_maxvi(x, ix, &out, &index, UInt(count))
    }
    
    public static func maxvi(x: UnsafePointer<Double>, ix: Int,
                             out: inout Double, index: inout UInt,
                             count: Int) {
        vDSP_maxviD(x, ix, &out, &index, UInt(count))
    }
    
    // MARK: maxmgv
    public static func maxmgv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_maxmgv(x, ix, &out, UInt(count))
    }
    
    public static func maxmgv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_maxmgvD(x, ix, &out, UInt(count))
    }
    
    // MARK: maxmgvi
    public static func maxmgvi(x: UnsafePointer<Float>, ix: Int,
                               out: inout Float, index: inout UInt,
                               count: Int) {
        vDSP_maxmgvi(x, ix, &out, &index, UInt(count))
    }
    public static func maxmgvi(x: UnsafePointer<Double>, ix: Int,
                               out: inout Double, index: inout UInt,
                               count: Int) {
        vDSP_maxmgviD(x, ix, &out, &index, UInt(count))
    }
    
    // MARK: minv
    public static func minv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_minv(x, ix, &out, UInt(count))
    }
    
    public static func minv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_minvD(x, ix, &out, UInt(count))
    }
    
    // MARK: minvi
    public static func minvi(x: UnsafePointer<Float>, ix: Int,
                             out: inout Float, index: inout UInt,
                             count: Int) {
        vDSP_minvi(x, ix, &out, &index, UInt(count))
    }
    public static func minvi(x: UnsafePointer<Double>, ix: Int,
                             out: inout Double, index: inout UInt,
                             count: Int) {
        vDSP_minviD(x, ix, &out, &index, UInt(count))
    }
    
    // MARK: maxmgv
    public static func minmgv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        vDSP_minmgv(x, ix, &out, UInt(count))
    }
    
    public static func minmgv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        vDSP_minmgvD(x, ix, &out, UInt(count))
    }
    
    // MARK: maxmgvi
    public static func minmgvi(x: UnsafePointer<Float>, ix: Int,
                               out: inout Float, index: inout UInt,
                               count: Int) {
        vDSP_minmgvi(x, ix, &out, &index, UInt(count))
    }
    
    public static func minmgvi(x: UnsafePointer<Double>, ix: Int,
                               out: inout Double, index: inout UInt,
                               count: Int) {
        vDSP_minmgviD(x, ix, &out, &index, UInt(count))
    }
}

#endif

extension VecOpsNoAccelerate {
    private static func reduce<T: BinaryFloatingPoint>(x: UnsafePointer<T>, ix: Int, out: inout T,
                                                       operation: (inout T, T)-> Void, count: Int) {
        var x = x
        for _ in 0..<count {
            operation(&out, x.pointee)
            x += ix
        }
    }
    
    private static func reduce<T: BinaryFloatingPoint>(x: UnsafePointer<T>, ix: Int,
                                                       out: inout T, index: inout UInt,
                                                       operation: (inout T, inout UInt, UInt, T)-> Void, count: Int) {
        var x = x
        var i: UInt = 0
        for _ in 0..<UInt(count) {
            operation(&out, &index, i, x.pointee)
            x += ix
            i += UInt(ix)
        }
    }
    
    // MARK: maxv
    public static func maxv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        out = -Float.infinity
        reduce(x: x, ix: ix, out: &out, operation: { $0 = max($0, $1) }, count: count)
    }
    
    public static func maxv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        out = -Double.infinity
        reduce(x: x, ix: ix, out: &out, operation: { $0 = max($0, $1) }, count: count)
    }
    
    // MARK: maxvi
    public static func maxvi(x: UnsafePointer<Float>, ix: Int,
                             out: inout Float, index: inout UInt,
                             count: Int) {
        out = -Float.infinity
        index = 0
        reduce(x: x, ix: ix, out: &out, index: &index, operation: { acc, index, i, v in
            if acc < v {
                acc = v
                index = i
            }
        }, count: count)
    }
    
    public static func maxvi(x: UnsafePointer<Double>, ix: Int,
                             out: inout Double, index: inout UInt,
                             count: Int) {
        out = -Double.infinity
        index = 0
        reduce(x: x, ix: ix, out: &out, index: &index, operation: { acc, index, i, v in
            if acc < v {
                acc = v
                index = i
            }
        }, count: count)
    }
    
    // MARK: maxmgv
    public static func maxmgv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        out = 0
        reduce(x: x, ix: ix, out: &out, operation: { $0 = max($0, abs($1)) }, count: count)
    }
    
    public static func maxmgv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        out = 0
        reduce(x: x, ix: ix, out: &out, operation: { $0 = max($0, abs($1)) }, count: count)
    }
    
    // MARK: maxmgvi
    public static func maxmgvi(x: UnsafePointer<Float>, ix: Int,
                               out: inout Float, index: inout UInt,
                               count: Int) {
        out = 0
        index = 0
        reduce(x: x, ix: ix, out: &out, index: &index, operation: { acc, index, i, v in
            let absv = abs(v)
            if acc < absv {
                acc = absv
                index = i
            }
        }, count: count)
    }
    
    public static func maxmgvi(x: UnsafePointer<Double>, ix: Int,
                               out: inout Double, index: inout UInt,
                               count: Int) {
        out = 0
        index = 0
        reduce(x: x, ix: ix, out: &out, index: &index, operation: { acc, index, i, v in
            let absv = abs(v)
            if acc < absv {
                acc = absv
                index = i
            }
        }, count: count)
    }
    
    // MARK: minv
    public static func minv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        out = Float.infinity
        reduce(x: x, ix: ix, out: &out, operation: { $0 = min($0, $1) }, count: count)
    }
    
    public static func minv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        out = Double.infinity
        reduce(x: x, ix: ix, out: &out, operation: { $0 = min($0, $1) }, count: count)
    }
    
    // MARK: minvi
    public static func minvi(x: UnsafePointer<Float>, ix: Int,
                             out: inout Float, index: inout UInt,
                             count: Int) {
        out = Float.infinity
        index = 0
        reduce(x: x, ix: ix, out: &out, index: &index, operation: { acc, index, i, v in
            if acc > v {
                acc = v
                index = i
            }
        }, count: count)
    }
    
    public static func minvi(x: UnsafePointer<Double>, ix: Int,
                             out: inout Double, index: inout UInt,
                             count: Int) {
        out = Double.infinity
        index = 0
        reduce(x: x, ix: ix, out: &out, index: &index, operation: { acc, index, i, v in
            if acc > v {
                acc = v
                index = i
            }
        }, count: count)
    }
    
    // MARK: maxmgv
    public static func minmgv(x: UnsafePointer<Float>, ix: Int, out: inout Float, count: Int) {
        out = Float.infinity
        reduce(x: x, ix: ix, out: &out, operation: { $0 = min($0, abs($1)) }, count: count)
    }
    
    public static func minmgv(x: UnsafePointer<Double>, ix: Int, out: inout Double, count: Int) {
        out = Double.infinity
        reduce(x: x, ix: ix, out: &out, operation: { $0 = min($0, abs($1)) }, count: count)
    }
    
    // MARK: maxmgvi
    public static func minmgvi(x: UnsafePointer<Float>, ix: Int,
                               out: inout Float, index: inout UInt,
                               count: Int) {
        out = Float.infinity
        index = 0
        reduce(x: x, ix: ix, out: &out, index: &index, operation: { acc, index, i, v in
            let absv = abs(v)
            if acc > absv {
                acc = absv
                index = i
            }
        }, count: count)
    }
    
    public static func minmgvi(x: UnsafePointer<Double>, ix: Int,
                               out: inout Double, index: inout UInt,
                               count: Int) {
        out = Double.infinity
        index = 0
        reduce(x: x, ix: ix, out: &out, index: &index, operation: { acc, index, i, v in
            let absv = abs(v)
            if acc > absv {
                acc = absv
                index = i
            }
        }, count: count)
    }
}
