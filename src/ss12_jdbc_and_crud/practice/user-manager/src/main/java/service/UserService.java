package service;

import model.User;
import repository.IUserRepository;
import repository.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService{
    IUserRepository userRepository = new UserRepository();


    @Override
    public void insertUser(User user) throws SQLException {
        this.userRepository.insertUser(user);
    }

    @Override
    public List<User> sortList() {
        return this.userRepository.sortList();
    }

    @Override
    public User selectUser(int id) {
        return this.userRepository.selectUser(id);
    }

    @Override
    public void updateUserStore(User user) {
        this.userRepository.updateUserStore(user);
    }

    @Override
    public void deleteUserStore(int id) {
         this.userRepository.deleteUserStore(id);
    }

    @Override
    public void insertUpdateWithoutTransaction() {
       this.userRepository.insertUpdateWithoutTransaction();
    }

    @Override
    public void insertUpdateUseTransaction() {
         this.userRepository.insertUpdateUseTransaction();
    }

    @Override
    public User getUserByID(int id) {
        return this.userRepository.getUserByID(id);
    }

    @Override
    public List<User> selectUserStore() {
        return this.userRepository.selectUserStore();
    }

    @Override
    public void insertUserStore(User user) {
        try {
            this.userRepository.insertUser(user);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<User> selectUserByCountry(String country) {
        return this.userRepository.selectUserByCountry(country);
    }

    @Override
    public void addUserTransaction(User user, int[] permision) {
      this.userRepository.addUserTransaction(user,permision);
    }

    @Override
    public List<User> selectAllUsers() {
        return this.userRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return this.userRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return this.userRepository.updateUser(user);
    }
}
