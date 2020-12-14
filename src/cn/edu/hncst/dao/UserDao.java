package cn.edu.hncst.dao;

import cn.edu.hncst.entity.User;

import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * user用户接口
 */
public interface UserDao {

    /**
     * @return List
     */
    List<User> queryAll();

    public int add(User user);

    public int delete(String id);

    public void update(User user);

    public User queryById(String id);

    public List<User> pageQuery(int start, int size);

    public int total();

    public User queryByUser(String username, String password);

    public int querySearchCount(String keywords);

    public List<User> searchUser(String keywords, int startCount, int pageSize);

}
