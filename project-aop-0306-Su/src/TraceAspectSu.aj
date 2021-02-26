
public aspect TraceAspectSu {

	pointcut classToTrace(): within(*App);
	
	pointcut TraceMethod(): classToTrace() && execution(* getName());
	
	before():TraceMethod(){
		System.out.print("Signature: " + thisJoinPointStaticPart.getSignature() + "\nLine Number: " + thisJoinPointStaticPart.getSourceLocation().getLine());
	}
	
	after():TraceMethod(){
		System.out.println(String.format("\nFile Name : %s\n", thisJoinPointStaticPart.getSourceLocation().getFileName()));
	}
}
