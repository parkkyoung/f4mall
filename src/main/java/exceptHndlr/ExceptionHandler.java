package exceptHndlr;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;

public class ExceptionHandler {
	public void process(JoinPoint thisJoinPoint, Exception exception) throws Exception {
		//System.out.println("---MyException process()--- : " + exception.getMessage());
		Signature sign = thisJoinPoint.getSignature();
		System.out.println("---[Exception]" + sign.getDeclaringTypeName() +":"+sign.getName() + "---");
		//System.out.println("          --[³»¿ë]:" + exception.getMessage());
		
	}
}
