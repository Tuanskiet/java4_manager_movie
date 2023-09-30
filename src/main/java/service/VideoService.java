package service;

import java.util.List;
import java.util.Map;

import entity.MyUser;
import entity.Video;

public interface VideoService {
	entity.Video findById (String Id);
	
	Video findByHref (String href);
	
	List<Video> findAll();
	
	List<Video> findAll(int pageNumber, int pageSize);
	List<Video> findAllWithActiveAndNot(int pageNumber, int pageSize);
	
	Video create (Video entity);
	
	Video update (Video entity);
	
	Video delete (String href);

	Integer getTotalLike(String videoId);

	Boolean checkIsLiked(String userID, String videoID);
	
	List<Video> findVideoIsLikedByUserId(String userID);

	List<Video> findVideoIsWatchedByUserId(String id);

	Map<String, String> getListVideoTitle();

	int countTotalVideo();




}
