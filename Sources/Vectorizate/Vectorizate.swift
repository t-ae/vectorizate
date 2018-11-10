public enum VectorizateNoAccelerate{}

#if !canImport(Accelerete)

public enum Vectorizate{}

#else

public typealias Vectorize = VectorizateNoAccelerate

#endif
