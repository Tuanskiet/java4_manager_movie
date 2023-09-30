package entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NamedStoredProcedureQueries({
    @NamedStoredProcedureQuery(
        name = "filterUserFavouriteByVideoId",
        procedureName = "filterUserFavouriteByVideoId",
        resultClasses = Favourite.class,
        parameters = {
            @StoredProcedureParameter(name = "videoID", type = String.class, mode = ParameterMode.IN)
        }
    )
})
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="[Favourite]")
public class Favourite implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="favourite_id")
	private Integer id;
	
	@JsonIgnoreProperties("hibernateLazyInitializer")
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
	@JoinColumn(name = "user_id", referencedColumnName = "user_id")
	private MyUser user;
	
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name = "video_id", referencedColumnName = "video_id")
	private Video video;

	@Column(name="like_date")
	private Date likeDate;

	public Favourite(MyUser user, Video video,  Date likeDate) {
		super();
		this.user = user;
		this.video = video;
		this.likeDate = likeDate;
	}
	
	
}
