package dao;

import java.util.List;
import java.util.Map;

import entity.MyUser;

public interface UserDao {
	MyUser findById(Integer Id);

	MyUser findByEmail(String email);

	MyUser findByUsername(String Username);

	MyUser findByUsernameAndPassword(String Username, String Password);

	List<MyUser> findAll();

	List<MyUser> findAll(int pageNumber, int pageSize);

	MyUser create(MyUser entity);

	MyUser update(MyUser entity);

	MyUser delete(MyUser entity);

	List<MyUser> findUsersLikedByVideoHref(Map<String, Object> params);


}
