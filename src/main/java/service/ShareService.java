package service;

import java.util.List;

import entity.MyUser;
import entity.Share;
import entity.Video;

public interface ShareService {

	Share insert(MyUser curentUser, Video video, String emails);

	List<Share> findByVideo(String videoId);

}
