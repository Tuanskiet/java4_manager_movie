package service;

import java.util.List;

import entity.Favourite;
import entity.History;
import entity.MyUser;
import entity.Video;


public interface FavoriteService {
	Favourite likeOrUnlike(MyUser user, String videoId);
	List<Favourite> getListUserFavouriteByVideo(String videoId);
}
