package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VideoDto {
	private String id; // video id 
	private String title;
	private String poster;
	private Integer views;
	private String description;
	private Boolean isLiked = false ;
	private Integer totalLike ;
}
