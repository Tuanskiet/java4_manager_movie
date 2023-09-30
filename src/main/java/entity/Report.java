package entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.ParameterMode;
import javax.persistence.StoredProcedureParameter;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NamedStoredProcedureQueries({
    @NamedStoredProcedureQuery(
        name = "favouriteByVideo",
        procedureName = "favouriteByVideo",
        resultClasses = Report.class
    )
})

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Report {
	@Id
	private String videoTitle;	
	private Long numberOfLikes;
	private Date latestDate;
	private Date oldestDate;
}
