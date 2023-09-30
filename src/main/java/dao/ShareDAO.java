package dao;

import java.util.List;

import entity.Share;

public interface ShareDAO {

	Share create(Share share);

	List<Share> findByVideo(String videoId);


}
