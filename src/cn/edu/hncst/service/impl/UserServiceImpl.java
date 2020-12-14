package cn.edu.hncst.service.impl;

import cn.edu.hncst.dao.UserDao;
import cn.edu.hncst.dao.impl.UserDaoImpl;
import cn.edu.hncst.entity.User;
import cn.edu.hncst.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService {

    // 用多态实现调用一个接口
    private UserDao userDao = new UserDaoImpl();

    @Override
    public List<User> findAllUsers() {
        List<User> users = userDao.queryAll();
        return users;
    }

    @Override
    public int addUser(User user) {
        int add = userDao.add(user);
        return add;
    }

    @Override
    public int deleteUser(String id) {
        int delete = userDao.delete(id);
        return delete;
    }

    @Override
    public User findUser(String id, String username, String password) {
        User user = new User();
        if (id != "") {
            user = userDao.queryById(id);
        } else {
            user = userDao.queryByUser(username, password);
        }
        return user;
    }

    @Override
    public void updateUser(User user) {
        userDao.update(user);
    }

    @Override
    public List<User> pageQuery(int start, int size) {
        return userDao.pageQuery(start, size);
    }

    @Override
    public int total() {
        int total = userDao.total();
        return total;
    }

    @Override
    public List<User> searchUser(String keywords, int startCount, int pageSize) {
        List<User> userList = userDao.searchUser(keywords, startCount, pageSize);
        return userList;
    }

    @Override
    public int querySearchCount(String keywords) {
        int i = userDao.querySearchCount(keywords);
        return i;
    }
}
