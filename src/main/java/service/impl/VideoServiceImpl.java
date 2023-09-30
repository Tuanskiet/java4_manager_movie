package service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.VideoDAO;
import dao.impl.VideoDAOImpl;
import entity.MyUser;
import entity.Video;
import service.VideoService;

public class VideoServiceImpl implements VideoService{
	
	private VideoDAO dao;
	
	public VideoServiceImpl() {
		dao = new VideoDAOImpl();
	}
	
	@Override
	public Video findById(String Id) {
		// TODO Auto-generated method stub
		return dao.findById(Id);
	}

	@Override
	public Video findByHref(String href) {
		// TODO Auto-generated method stub
		return dao.findByHref(href);
	}

	@Override
	public List<Video> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public List<Video> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return dao.findAll(pageNumber, pageSize);
	}
	
	@Override
	public List<Video> findAllWithActiveAndNot(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return dao.findAllWithActiveAndNot(pageNumber, pageSize);
	}

	@Override
	public Video create(Video entity) {
		return dao.create(entity);
	}

	@Override
	public Video update(Video entity) {
		return dao.update(entity);
	}

	@Override
	public Video delete(String videoId) {
		Video entity = findById(videoId);
		return dao.delete(entity);
	}

	@Override
	public Integer getTotalLike(String videoId) {
		// TODO Auto-generated method stub
		return dao.getTotalLike(videoId);
	}

	@Override
	public Boolean checkIsLiked(String userID, String videoID) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userID", userID);
		params.put("videoID", videoID);
		List<Video> video =  dao.getVideoByUserIdAndVideoId(params);
		System.out.println("video" + video);
		if(video.size() != 0) {
			return true;
		}
		return false;
	}

	@Override
	public List<Video> findVideoIsLikedByUserId(String userID) {
		// TODO Auto-generated method stub
		return dao.findByUserAndIsLiked(userID);
	}

	@Override
	public List<Video> findVideoIsWatchedByUserId(String userID) {
		// TODO Auto-generated method stub
		return dao.findVideoIsWatchedByUserId(userID);
	}

	@Override
	public Map<String, String> getListVideoTitle() {
		Map<String, String> listVideoTitle = new HashMap<String, String>();
		List<Video> listVideos = findAll();
		for (Video video : listVideos) {
			listVideoTitle.put(video.getId(), video.getTitle());
		}
		return listVideoTitle;
	}

	@Override
	public int countTotalVideo() {
		return dao.countTotalVideo();
	}


}
