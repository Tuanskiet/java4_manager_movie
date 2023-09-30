package entity;

import java.beans.Transient;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.OneToMany;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NamedStoredProcedureQueries({
    @NamedStoredProcedureQuery(
        name = "getVideoByUserIdAndVideoId",
        procedureName = "getVideoByUserIdAndVideoId",
        resultClasses = Video.class,
        parameters = {
            @StoredProcedureParameter(name = "videoID", type = String.class, mode = ParameterMode.IN),
            @StoredProcedureParameter(name = "userID", type = String.class, mode = ParameterMode.IN)
        }
    )
})
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="[Videos]")
public class Video {
	@Id
	@Column(name="video_id")
	private String id;
	private String title;
	private String poster;
	private Integer views;
	private String description;
	
	@Column(name="active")
	private boolean isActive;
	
	
	@JsonIgnore
	@OneToMany(mappedBy = "video", cascade = CascadeType.ALL)
	private List<Favourite> favourites;
	
	@JsonIgnore
	@OneToMany(mappedBy = "video", cascade = CascadeType.ALL)
	private List<History> histories;
	
	@JsonIgnore
	@OneToMany(mappedBy = "video", cascade = CascadeType.ALL)
	private List<Share> shares;
	
//	@Transient
//	public int getLikes() {
//		return favourites.size();
//	}
	public boolean isActive() {
		return isActive;
	}

	
}
