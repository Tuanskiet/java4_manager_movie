package dao.impl;

import java.util.List;
import java.util.Map;

import contants.NamedStored;
import dao.AbstractDao;
import dao.VideoDAO;
import entity.Video;

public class VideoDAOImpl extends AbstractDao<Video> implements VideoDAO{

	@Override
	public Video findById(String Id) {
		// TODO Auto-generated method stub
		return super.findById(Video.class, Id);
	}

	@Override
	public Video findByHref(String href) {
		// TODO Auto-generated method stub
		String sql = "SELECT v FROM Video v WHERE v.href = ?0";
		return super.findOne(Video.class, sql, href);
	}

	@Override
	public List<Video> findAll() {
		// TODO Auto-generated method stub
		return super.findAll(Video.class, true);
	}

	@Override
	public List<Video> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(Video.class, true, pageNumber , pageSize);
	}
	
	@Override
	public List<Video> findAllWithActiveAndNot(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(Video.class, false, pageNumber , pageSize);
	}

	@Override
	public Video create(Video entity) {
		// TODO Auto-generated method stub
		return super.create(entity);
	}

	@Override
	public Video update(Video entity) {
		// TODO Auto-generated method stub
		return super.update(entity);
	}

	@Override
	public Video delete(Video video) {
		return super.delete(video);
	}

	@Override
	public Integer getTotalLike(String videoId) {
		String sql = "SELECT COUNT(f.favourite_id) FROM Videos v JOIN Favourite f ON v.video_id = f.video_id WHERE v.video_id = ?0";
//		return super.findOne(Video.class, sql, href);
		return  super.getTotalLike(Video.class, sql,  videoId);
	}

	@Override
	public List<Video> getVideoByUserIdAndVideoId(Map<String, Object> params) {
		return super.callStored(NamedStored.FIND_VIDEO_BY_USER_ID_AND_VIDEO_ID, params);
	}

	@Override
	public List<Video> findByUserAndIsLiked(String userID) {
		String sql = "SELECT f.video FROM Favourite f WHERE f.user.id = ?0";
		return super.findMany(Video.class, sql, userID);
	}

	@Override
	public List<Video> findVideoIsWatchedByUserId(String userID) {
		String sql = "SELECT h.video FROM History h WHERE h.user.id = ?0";
		return super.findMany(Video.class, sql, userID);
	}

	@Override
	public int countTotalVideo() {
		String sql = "SELECT o FROM Video o";
		List<Video> list = super.findMany(Video.class, sql);
		return list.size();
	}


}
