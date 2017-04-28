package zwl.learning.log4j2.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by zhangwanli on 2017/4/28.
 */
public class LogUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(LogUtils.class);

    public void log(){
        LOGGER.trace("LogUtils");
    }
}
