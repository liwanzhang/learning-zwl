package zwl.learning.log4j2.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import zwl.learning.log4j2.util.LogUtils;

public class Log4j2Main {
	private static final Logger logger = LoggerFactory.getLogger(Log4j2Main.class);
	public static void main(String[] args) {
		logger.trace("main run");

		LogUtils l1 = new LogUtils();
		l1.log();

	}

}
