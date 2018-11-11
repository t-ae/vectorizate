import Foundation

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

import Accelerate

extension VecOps {
    
    // MARK: mmul
    
    /// Matrix multiplication.
    /// - Parameters:
    ///   - a: Matrix with m rows, p columns
    ///   - b: Matrix with p rows, n columns
    ///   - out: Matrix with m rows, n columns
    public static func mmul(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            m: Int, n: Int, p: Int) {
        vDSP_mmul(a, ia, b, ib, out, iOut, UInt(m), UInt(n), UInt(p))
    }
    
    /// Matrix multiplication.
    /// - Parameters:
    ///   - a: Matrix with m rows, p columns
    ///   - b: Matrix with p rows, n columns
    ///   - out: Matrix with m rows, n columns
    public static func mmul(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            m: Int, n: Int, p: Int) {
        vDSP_mmulD(a, ia, b, ib, out, iOut, UInt(m), UInt(n), UInt(p))
    }
    
    // MARK: mtrans
    
    /// Matrix transposition.
    /// - Parameters:
    ///   - x: Matrix with n rows, m columns
    ///   - out: Matrix with m rows, n columns
    public static func mtrans(x: UnsafePointer<Float>, ix: Int,
                              out: UnsafeMutablePointer<Float>, iOut: Int,
                              m: Int, n: Int) {
        vDSP_mtrans(x, ix, out, iOut, UInt(m), UInt(n))
    }
    
    /// Matrix transposition.
    /// - Parameters:
    ///   - x: Matrix with n rows, m columns
    ///   - out: Matrix with m rows, n columns
    public static func mtrans(x: UnsafePointer<Double>, ix: Int,
                              out: UnsafeMutablePointer<Double>, iOut: Int,
                              m: Int, n: Int) {
        vDSP_mtransD(x, ix, out, iOut, UInt(m), UInt(n))
    }
    
    // MARK: mmov
    
    /// Copy submatrix to another submatrix
    /// - Parameters:
    ///   - x: Submatrix
    ///   - out: Subatrix with n rows, m columns
    ///   - cols: Number of columns of submatrices
    ///   - cols: Number of rows of submatrices
    ///   - tx: Number of columns in the matrix of which x is a submatrix
    ///   - tOut: Number of columns in the matrix of which out is a submatrix
    public static func mmov(x: UnsafePointer<Float>,
                            out: UnsafeMutablePointer<Float>,
                            cols: Int, rows: Int,
                            tx: Int, tOut: Int) {
        vDSP_mmov(x, out, UInt(cols), UInt(rows), UInt(tx), UInt(tOut))
    }
    
    /// Copy submatrix to another submatrix
    /// - Parameters:
    ///   - x: Submatrix
    ///   - out: Subatrix with n rows, m columns
    ///   - cols: Number of columns of submatrices
    ///   - cols: Number of rows of submatrices
    ///   - tx: Number of columns in the matrix of which x is a submatrix
    ///   - tOut: Number of columns in the matrix of which out is a submatrix
    public static func mmov(x: UnsafePointer<Double>,
                            out: UnsafeMutablePointer<Double>,
                            cols: Int, rows: Int,
                            tx: Int, tOut: Int) {
        vDSP_mmovD(x, out, UInt(cols), UInt(rows), UInt(tx), UInt(tOut))
    }
}

#endif

extension VecOpsNoAccelerate {
    
    // MARK: mmul
    
    private static func _mmul<F: BinaryFloatingPoint>(a: UnsafePointer<F>, ia: Int,
                                                      b: UnsafePointer<F>, ib: Int,
                                                      out: UnsafeMutablePointer<F>, iOut: Int,
                                                      m: Int, n: Int, p: Int) {
        var ap = a
        for i in 0..<m {
            var bp = b
            
            for _ in 0..<p {
                var outp = out + i*n*iOut
                for _ in 0..<n {
                    outp.pointee += ap.pointee * bp.pointee
                    bp += ib
                    outp += iOut
                }
                ap += ia
            }
        }
    }
    
    /// Matrix multiplication.
    /// - Parameters:
    ///   - a: Matrix with m rows, p columns
    ///   - b: Matrix with p rows, n columns
    ///   - out: Matrix with m rows, n columns
    public static func mmul(a: UnsafePointer<Float>, ia: Int,
                            b: UnsafePointer<Float>, ib: Int,
                            out: UnsafeMutablePointer<Float>, iOut: Int,
                            m: Int, n: Int, p: Int) {
        _mmul(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut, m: m, n: n, p: p)
    }
    
    /// Matrix multiplication.
    /// - Parameters:
    ///   - a: Matrix with m rows, p columns
    ///   - b: Matrix with p rows, n columns
    ///   - out: Matrix with m rows, n columns
    public static func mmul(a: UnsafePointer<Double>, ia: Int,
                            b: UnsafePointer<Double>, ib: Int,
                            out: UnsafeMutablePointer<Double>, iOut: Int,
                            m: Int, n: Int, p: Int) {
        _mmul(a: a, ia: ia, b: b, ib: ib, out: out, iOut: iOut, m: m, n: n, p: p)
    }
    
    // MARK: mtrans
    
    private static func _mtrans<T>(x: UnsafePointer<T>, ix: Int,
                                   out: UnsafeMutablePointer<T>, iOut: Int,
                                   m: Int, n: Int) {
        var x = x
        for i in 0..<n {
            var out = out + i*iOut
            for _ in 0..<m {
                out.pointee = x.pointee
                x += ix
                out += n*iOut
            }
        }
    }
    
    /// Matrix transposition.
    /// - Parameters:
    ///   - x: Matrix with n rows, m columns
    ///   - out: Matrix with m rows, n columns
    public static func mtrans(x: UnsafePointer<Float>, ix: Int,
                              out: UnsafeMutablePointer<Float>, iOut: Int,
                              m: Int, n: Int) {
        _mtrans(x: x, ix: ix, out: out, iOut: iOut, m: m, n: n)
    }
    
    /// Matrix transposition.
    /// - Parameters:
    ///   - x: Matrix with n rows, m columns
    ///   - out: Matrix with m rows, n columns
    public static func mtrans(x: UnsafePointer<Double>, ix: Int,
                              out: UnsafeMutablePointer<Double>, iOut: Int,
                              m: Int, n: Int) {
        _mtrans(x: x, ix: ix, out: out, iOut: iOut, m: m, n: n)
    }
    
    // MARK: mmov
    
    private static func _mmov<T>(x: UnsafePointer<T>,
                                 out: UnsafeMutablePointer<T>,
                                 cols: Int, rows: Int,
                                 tx: Int, tOut: Int) {
        var x = x
        var out = out
        for _ in 0..<rows {
            memcpy(out, x, cols*MemoryLayout<T>.size)
            x += tx
            out += tOut
        }
    }
    
    /// Copy submatrix to another submatrix
    /// - Parameters:
    ///   - x: Submatrix
    ///   - out: Subatrix with n rows, m columns
    ///   - cols: Number of columns of submatrices
    ///   - cols: Number of rows of submatrices
    ///   - tx: Number of columns in the matrix of which x is a submatrix
    ///   - tOut: Number of columns in the matrix of which out is a submatrix
    public static func mmov(x: UnsafePointer<Float>,
                            out: UnsafeMutablePointer<Float>,
                            cols: Int, rows: Int,
                            tx: Int, tOut: Int) {
        _mmov(x: x, out: out, cols: cols, rows: rows, tx: tx, tOut: tOut)
    }
    
    /// Copy submatrix to another submatrix
    /// - Parameters:
    ///   - x: Submatrix
    ///   - out: Subatrix with n rows, m columns
    ///   - cols: Number of columns of submatrices
    ///   - cols: Number of rows of submatrices
    ///   - tx: Number of columns in the matrix of which x is a submatrix
    ///   - tOut: Number of columns in the matrix of which out is a submatrix
    public static func mmov(x: UnsafePointer<Double>,
                            out: UnsafeMutablePointer<Double>,
                            cols: Int, rows: Int,
                            tx: Int, tOut: Int) {
        _mmov(x: x, out: out, cols: cols, rows: rows, tx: tx, tOut: tOut)
    }
}
