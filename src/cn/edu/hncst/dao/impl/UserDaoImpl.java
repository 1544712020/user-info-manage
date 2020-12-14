package cn.edu.hncst.dao.impl;

import cn.edu.hncst.dao.UserDao;
import cn.edu.hncst.entity.User;
import cn.edu.hncst.util.JDBCUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {

    // 获取数据库连接池资源
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    /**
     * 查询所有数据
     *
     * @param
     * @return List集合
     */
    @Override
    public List<User> queryAll() {
        // 定义SQL语句
        String sql = "SELECT * FROM user";
        // 执行SQL语句
        List<User> users = template.query(sql, new BeanPropertyRowMapper<User>(User.class));
        return users;
    }

    @Override
    public int add(User user) {
        String sql = "insert into user (id, name, gender, age, address, qq, email, username, password) values(NULL, ?, ?, ?, ?, ?, ?, ? ,?)";
        int update = template.update(sql, user.getName(), user.getGender(), user.getAge(), user.getAddress(), user.getQq(), user.getEmail(), "root", "root");
        return update;
    }


    @Override
    public int delete(String id) {
        String sql = "delete from user where id = ?";
        int update = template.update(sql, id);
        return update;
    }

    @Override
    public void update(User user) {
        String sql = "update user set name = ?, gender = ?,  age = ?, address = ?, qq = ?, email = ? where id = ?";
        template.update(sql, user.getName(), user.getGender(), user.getAge(), user.getAddress(), user.getQq(), user.getEmail(), user.getId());
    }

    @Override
    public User queryById(String id) {
        String sql = "select * from user where id = ?";
        User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), id);
        return user;
    }

    @Override
    public List<User> pageQuery(int start, int size) {
        List<User> query = new ArrayList<>();
        String sql = "select * from user limit ?,?";
        query = template.query(sql, new BeanPropertyRowMapper<User>(User.class), start, size);
        return query;
    }

    @Override
    public int total() {
        // 定义SQL语句
        String sql = "SELECT * FROM user";
        // 执行SQL语句
        List<User> users = template.query(sql, new BeanPropertyRowMapper<User>(User.class));
        int total = users.size();
        return total;
    }

    @Override
    public User queryByUser(String username, String password) {
        try {
            String sql = "select * from user where name = ? and password = ?";
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username, password);
            return user;
        } catch (DataAccessException e) {
            return null;
        }
    }

    @Override
    public List<User> searchUser(String keywords, int startCount, int pageSize) {
        String sql = "SELECT * FROM user WHERE id=? or name like ? or gender=? or address like ? or qq=? or email=? LIMIT ?,?";

        try{
            List<User> query = template.query(sql, new Object[]{keywords, "%"+keywords+"%", keywords, "%"+keywords+"%", keywords, keywords,startCount,pageSize}, new BeanPropertyRowMapper<>(User.class));
            return query;
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public int querySearchCount(String keywords) {
        String sql = "SELECT COUNT(*) FROM user WHERE id=? or name like ? or gender=? or address like ?  or qq=? or email=?";
        try{
            Integer integer = template.queryForObject(sql, new Object[]{keywords, "%" + keywords + "%", keywords, "%" + keywords + "%", keywords, keywords}, Integer.class);
            return integer;
        }catch (Exception e){
            return 0;
        }
    }

}
