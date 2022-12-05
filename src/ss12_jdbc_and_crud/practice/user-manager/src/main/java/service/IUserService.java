package service;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    public void insertUser(User user) throws SQLException;

    List<User> sortList();

    public User selectUser(int id);

    void updateUserStore(User user);

    void deleteUserStore(int id);

    public void insertUpdateWithoutTransaction();

    public void insertUpdateUseTransaction();

    User getUserByID(int id);


    List<User> selectUserStore();

    void insertUserStore(User user);

    List<User> selectUserByCountry(String country);

    void addUserTransaction(User user, int[] permision);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
}
