package zwl.learning.mybatis.domain;

import java.util.Date;

/**
 * Created by zhangwanli on 2017/3/25.
 */
public class Person {
    private int id;
    private String userName;
    private Date birthday;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
}
