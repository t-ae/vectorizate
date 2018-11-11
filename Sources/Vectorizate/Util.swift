func map<T, R>(x: UnsafePointer<T>, ix: Int,
               out: UnsafeMutablePointer<R>, iOut: Int,
               operation: (_ out: inout R, _ x: T)->Void,
               count: Int) {
    var x = x
    var out = out
    for _ in 0..<count {
        operation(&out.pointee, x.pointee)
        x += ix
        out += iOut
    }
}

func map2<T1, T2, R>(a: UnsafePointer<T1>, ia: Int,
                     b: UnsafePointer<T2>, ib: Int,
                     out: UnsafeMutablePointer<R>, iOut: Int,
                     operation: (_ out: inout R, _ x: T1, _ y: T2)->Void,
                     count: Int) {
    var x = a
    var y = b
    var out = out
    for _ in 0..<count {
        operation(&out.pointee, x.pointee, y.pointee)
        x += ia
        y += ib
        out += iOut
    }
}

func map2<T, R1, R2>(x: UnsafePointer<T>, ix: Int,
                     out1: UnsafeMutablePointer<R1>, iOut1: Int,
                     out2: UnsafeMutablePointer<R2>, iOut2: Int,
                     operation: (_ out1: inout R1, _ out2: inout R2, _ x: T)->Void,
                     count: Int) {
    var x = x
    var out1 = out1
    var out2 = out2
    for _ in 0..<count {
        operation(&out1.pointee, &out2.pointee, x.pointee)
        x += ix
        out1 += iOut1
        out2 += iOut2
    }
}

func map3<T1, T2, T3, R>(a: UnsafePointer<T1>, ia: Int,
                         b: UnsafePointer<T2>, ib: Int,
                         c: UnsafePointer<T3>, ic: Int,
                         out: UnsafeMutablePointer<R>, iOut: Int,
                         operation: (_ out: inout R, _ x: T1, _ y: T2, _ z: T3)->Void,
                         count: Int) {
    var x = a
    var y = b
    var z = c
    var out = out
    for _ in 0..<count {
        operation(&out.pointee, x.pointee, y.pointee, z.pointee)
        x += ia
        y += ib
        z += ic
        out += iOut
    }
}

func reduce<T, R>(x: UnsafePointer<T>, ix: Int,
                  out: inout R,
                  operation: (_ out: inout R, _ x: T)-> Void, count: Int) {
    var x = x
    for _ in 0..<count {
        operation(&out, x.pointee)
        x += ix
    }
}

func reduce2<T, R1, R2>(x: UnsafePointer<T>, ix: Int,
                        out1: inout R1, out2: inout R2,
                        operation: (inout R1, inout R2, T)-> Void, count: Int) {
    var x = x
    for _ in 0..<count {
        operation(&out1, &out2, x.pointee)
        x += ix
    }
}
