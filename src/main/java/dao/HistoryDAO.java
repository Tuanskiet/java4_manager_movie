package dao;

import java.util.List;
import java.util.Map;

import entity.History;


public interface HistoryDAO {
	List<History> findByUser(String username);
	
	List<History> findByUserAndIsLiked(String username);
	
	History findByUserIdAndVideoId(String userId, String videoId);
	
	History create(History enitty);
	
	History update(History enitty);
	
	List<History> findUsersLikedByVideoHref(Map<String, Object> params);
}
