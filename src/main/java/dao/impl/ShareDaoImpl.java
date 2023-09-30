package dao.impl;

import java.util.List;

import dao.AbstractDao;
import dao.ShareDAO;
import entity.Favourite;
import entity.Share;


public class ShareDaoImpl extends AbstractDao<Share> implements ShareDAO{

	@Override
	public Share create(Share share) {
		return super.create(share);
	}

	@Override
	public List<Share> findByVideo(String videoId) {
		String sql = "SELECT o FROM Share o WHERE o.video.id = ?0";
		return super.findMany(Share.class, sql, videoId);
	}

}
