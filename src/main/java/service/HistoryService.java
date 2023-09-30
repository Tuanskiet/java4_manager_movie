package service;

import java.util.List;

import entity.History;
import entity.MyUser;
import entity.Video;


public interface HistoryService {
//	List<History> findByUser(String username);
//	
//	List<History> findByUserAndIsLiked(String username);
//	
	History findByUserIdAndVideoId(String userId, String videoId);
//	
//	History create(MyUser user, Video video);
//	
//	boolean updateLikeOrUnlike(MyUser user, String videoHref);
//	
//	List<History> findUsersLikedByVideoHref(String href);

	History createViewForUser(MyUser user, Video video);
}
