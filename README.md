# Vectorizate

Simple wrapper of Accelerate Framework & complementation for Linux.

It's especially useful when you are creating cross-platform libraries/applications with tons of vectorizable operations.

## Usage

All functions are defined under the empty enum `VecOps`.

```swift
import Vectorizate

let x = (0..<100).map { _ in Float.random(in: 0..<1) }
var minimum: Float = 0
VecOps.minv(x: x, ix: 1, out: &minimum, count: 100)
```

Also there is `VecOpsNoAccelerate` which is equivalent to `VecOps` but doesn't use Accelerate Framework.
If Accelerate Framework is not available, `VecOps` becomes typealias of `VecOpsNoAccelerate`.

## Supported operations

### From vDSP(https://developer.apple.com/documentation/accelerate/vdsp)
vma, vmsb, vmsa, vsma, vsmsb, vsmsb,  
vadd, vsub, vmul, vdiv,  
vsadd, vssub, svsub, vsmul, vsdiv, svdiv,  
vabs, vnabs, vneg, vsq, vssq,  
vflt, vfix, vfixr, vspdp, vdpsp,  
sve, svesq, sve_svesq, svs,
vmax, vmagmg, vmin, vminmg,  
vclip, viclip,  
minv, minvi, minmgvi, maxv, maxvi, maxmgv, maxmgvi,  
mmul, mtrans, mmov,  
vgathr,

### From [vForce](https://developer.apple.com/documentation/accelerate/veclib/vforce)
sin, cos, tan, asin, acos, atan, atan2,  
sinh, cosh, tanh, asinh, acoish, atanh,  
exp, exp2, exp1m, log, log1p, log2, log10, logb,  

## Lisence
[The MIT License](https://github.com/t-ae/vectorizate/blob/master/LICENSE)