public enum VecOpsNoAccelerate {}

#if !canImport(Accelerete) && !VECTORIZATE_NO_ACCELERATE

public enum VecOps {}

#else

public typealias VecOps = VecOpsNoAccelerate

#endif
