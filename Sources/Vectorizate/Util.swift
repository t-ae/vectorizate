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

func map2<T1, T2, R>(x: UnsafePointer<T1>, ix: Int,
                     y: UnsafePointer<T2>, iy: Int,
                     out: UnsafeMutablePointer<R>, iOut: Int,
                     operation: (_ out: inout R, _ x: T1, _ y: T2)->Void,
                     count: Int) {
    var x = x
    var y = y
    var out = out
    for _ in 0..<count {
        operation(&out.pointee, x.pointee, y.pointee)
        x += ix
        y += iy
        out += iOut
    }
}

func map3<T1, T2, T3, R>(x: UnsafePointer<T1>, ix: Int,
                         y: UnsafePointer<T2>, iy: Int,
                         z: UnsafePointer<T3>, iz: Int,
                         out: UnsafeMutablePointer<R>, iOut: Int,
                         operation: (_ out: inout R, _ x: T1, _ y: T2, _ z: T3)->Void,
                         count: Int) {
    var x = x
    var y = y
    var z = z
    var out = out
    for _ in 0..<count {
        operation(&out.pointee, x.pointee, y.pointee, z.pointee)
        x += ix
        y += iy
        z += iz
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
