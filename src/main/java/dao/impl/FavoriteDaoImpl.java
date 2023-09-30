package dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import contants.NamedStored;
import dao.AbstractDao;
import dao.FavoriteDAO;
import entity.Favourite;
import entity.MyUser;
import entity.Video;

public class FavoriteDaoImpl extends AbstractDao<Favourite> implements FavoriteDAO{
	
	
	@Override
	public Favourite create(Favourite favourite) {
		return super.create(favourite);
	}

	@Override
	public Favourite findByUserIdAndVideoId(String userId, String videoId) {
		String sql = "SELECT o FROM Favourite o WHERE o.user.id = ?0 And o.video.id = ?1 "
				+" AND o.video.isActive = 1";
		return super.findOne(Favourite.class, sql, userId, videoId);
	}

	@Override
	public Favourite delete(Favourite entity) {
		return super.delete(entity);
	}

	@Override
	public List<Favourite> getListUserFavouriteByVideo(String videoID) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("videoID", videoID);
		return super.callStored(NamedStored.FILTER_USER_FAVOURITE_BY_VIDEOID, params);
	}

}
