package service.impl;

import java.util.List;
import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.MyUser;
import service.UserService;

public class UserServiceImpl implements UserService {
	private UserDao dao;

	public UserServiceImpl() {
		dao = new UserDaoImpl();
	}

	@Override
	public MyUser findById(Integer Id) {
		// TODO Auto-generated method stub
		return dao.findById(Id);
	}

	@Override
	public MyUser findByEmail(String email) {
		// TODO Auto-generated method stub
		return dao.findByEmail(email);
	}

	@Override
	public MyUser findByUsername(String Username) {
		return dao.findByUsername(Username);
	}

	@Override
	public MyUser login(String Username, String Password) {
		// TODO Auto-generated method stub
		return dao.findByUsernameAndPassword(Username, Password);
	}

	@Override
	public MyUser resestPassword(String email) {
		MyUser existUser = findByEmail(email);
		if (existUser != null) {
			String newpass = String.valueOf((int) (Math.random()) * ((9999 - 1000) + 1) + 1000);
			existUser.setPassword(newpass);
			return dao.update(existUser);
		}
		return null;
	}

	@Override
	public List<MyUser> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public List<MyUser> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return dao.findAll(pageNumber, pageSize);
	}

	@Override
	public MyUser create(MyUser newUser) {
		return dao.create(newUser);
	}

	@Override
	public MyUser update(MyUser entity) {
		return dao.update(entity);
	}

	public MyUser delete(String username) {
		MyUser user = dao.findByUsername(username);
		return dao.delete(user);
	}

	@Override
	public void updatePassword(String newPass, MyUser userUpdate) {
		userUpdate.setPassword(newPass);
		dao.update(userUpdate);
		// TODO Auto-generated method stub
		
	}



//	@Override
//	public List<UserDto> findUsersLikedByVideoHref(String href) {
//		Map<String, Object> params = new HashMap<>();
//		params.put("videoHref",href);
//		List<User> users = dao.findUsersLikedByVideoHref(params);
//		List<UserDto> result = new ArrayList<>();
//		users.forEach(user ->{
//			UserDto dto = new UserDto();
//			dto.setUsername(user.getUsername());
//			dto.setEmail(user.getEmail());
//			result.add(dto);
//		});
//		return result;
//	}

}
