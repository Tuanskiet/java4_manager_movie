package dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import contants.NamedStored;
import dao.AbstractDao;
import dao.UserDao;
import entity.MyUser;

public class UserDaoImpl extends AbstractDao<MyUser> implements UserDao{
	@Override
	public MyUser findById(Integer Id) {
		// TODO Auto-generated method stub
		return super.findById(MyUser.class, Id);
	}

	@Override
	public MyUser findByEmail(String email) {
		// TODO Auto-generated method stub
		String sql = "SELECT o  FROM MyUser o WHERE o.email = ?0 ";
		return super.findOne(MyUser.class, sql, email);
	}

	@Override
	public MyUser findByUsername(String Username) {
		// TODO Auto-generated method stub
		String sql = "SELECT o  FROM MyUser o WHERE o.id = ?0 ";
		return super.findOne(MyUser.class, sql, Username);
	}

	@Override
	public MyUser findByUsernameAndPassword(String Username, String Password) {
		String sql = "SELECT o FROM MyUser o WHERE o.id = ?0 AND o.password = ?1";
		return super.findOne(MyUser.class, sql, Username , Password);
	}

	@Override
	public List<MyUser> findAll() {
		return super.findAll(MyUser.class, true);
	}

	@Override
	public MyUser create(MyUser entity) {
		return super.create(entity);
	}

	@Override
	public MyUser update(MyUser entity) {
		return super.update(entity);
	}

	@Override
	public MyUser delete(MyUser entity) {
		return super.delete(entity);
	}

	@Override
	public List<MyUser> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(MyUser.class, true, pageNumber, pageSize);
	}

	@Override
	public List<MyUser> findUsersLikedByVideoHref(Map<String, Object> params) {
		return super.callStored("", params);
	}


}
