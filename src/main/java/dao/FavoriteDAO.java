package dao;

import java.util.List;

import entity.Favourite;
import entity.MyUser;
import entity.Video;

public interface FavoriteDAO {

	Favourite create(Favourite favourite);

	Favourite findByUserIdAndVideoId(String userId, String videoId);

	Favourite delete(Favourite favourite);
	List<Favourite> getListUserFavouriteByVideo(String videoID);


}
