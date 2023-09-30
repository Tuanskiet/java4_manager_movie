package dao;

import java.util.List;
import java.util.Map;

import entity.History;
import entity.Video;

public interface VideoDAO {

	Video findById (String Id);
	
	Video findByHref (String href);
	
	List<Video> findAll();
	
	List<Video> findAll(int pageNumber, int pageSize);
	
	List<Video> findAllWithActiveAndNot(int pageNumber, int pageSize);
	
	Video create (Video entity);
	
	Video update (Video entity);
	
	Video delete (Video video);

	Integer getTotalLike(String videoId);

	List<Video> getVideoByUserIdAndVideoId(Map<String, Object> params);
	
	List<Video> findByUserAndIsLiked(String userID);

	List<Video> findVideoIsWatchedByUserId(String userID);

	int countTotalVideo();

}
