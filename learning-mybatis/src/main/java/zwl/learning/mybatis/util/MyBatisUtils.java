package zwl.learning.mybatis.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by zhangwanli on 2017/3/25.
 */
public abstract class MyBatisUtils {
    private static volatile SqlSessionFactory sqlSessionFactory;

    public static final String MyBatisConfigLocation = "configuration.xml";

    public static SqlSessionFactory getSqlSessionFactory() throws IOException {
        if (sqlSessionFactory == null) {
            synchronized (MyBatisUtils.class) {
                if (sqlSessionFactory == null) {
                    InputStream input = Resources.getResourceAsStream(MyBatisConfigLocation);
                    sqlSessionFactory = new SqlSessionFactoryBuilder().build(input);
                    input.close();
                }
            }
        }
        return sqlSessionFactory;
    }
}
