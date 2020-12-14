package cn.edu.hncst.service;

import cn.edu.hncst.entity.User;

import java.util.List;

public interface UserService {

    // 查询所有用户数据
    public List<User> findAllUsers();

    // 添加用户信息
    public int addUser(User user);

    // 删除用户
    public int deleteUser(String id);

    public User findUser(String id, String username, String password);

    public void updateUser(User user);

    public List<User> pageQuery(int start, int size);

    public int total();

    public List<User> searchUser(String keywords, int startCount, int pageSize);

    public int querySearchCount(String keywords);

}
