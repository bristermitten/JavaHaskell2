jni-compile: 
	ghc -O2 -no-hs-main -dynamic -shared -fPIC -lHSrts-ghc9.0.1 -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux -o libcalc.so ../Haskell/Calc.hs calc.c