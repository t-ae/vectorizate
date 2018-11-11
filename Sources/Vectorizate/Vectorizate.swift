public enum VecOpsNoAccelerate {}

#if canImport(Accelerate) && !VECTORIZATE_NO_ACCELERATE

public enum VecOps {}

#else

public typealias VecOps = VecOpsNoAccelerate

#endif
