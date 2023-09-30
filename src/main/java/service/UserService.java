package service;

import java.util.List;

import entity.MyUser;

public interface UserService {
	MyUser findById(Integer Id);

	MyUser findByEmail(String email);

	MyUser findByUsername(String Username);

	MyUser login(String Username, String Password);

	MyUser resestPassword(String email);

	List<MyUser> findAll();

	List<MyUser> findAll(int pageNumber, int pageSize);

	MyUser create(MyUser newUser);

	MyUser update(MyUser entity);

	MyUser delete(String username);

	void updatePassword(String newPass, MyUser userUpdate);
}
