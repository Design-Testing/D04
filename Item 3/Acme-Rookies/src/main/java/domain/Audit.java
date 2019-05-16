
package domain;

import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
<<<<<<< HEAD
import javax.persistence.ManyToOne;
=======
import javax.persistence.Index;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
>>>>>>> develop
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.hibernate.validator.constraints.SafeHtml;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
<<<<<<< HEAD
=======
@Table(indexes = {
	@Index(columnList = "auditor"), @Index(columnList = "auditor, isDraft"), @Index(columnList = "position, isDraft")
})
>>>>>>> develop
public class Audit extends DomainEntity {

	//Relationships
	private String		text;
	private Integer		score;
	private Date		moment;
<<<<<<< HEAD

	private Position	position;
=======
	private Boolean		isDraft;

	private Position	position;
	private Auditor		auditor;
>>>>>>> develop


	@NotBlank
	@SafeHtml
	public String getText() {
		return this.text;
	}

	public void setText(final String text) {
		this.text = text;
	}

	@NotNull
	@Range(min = 0, max = 10)
	public Integer getScore() {
		return this.score;
	}

	public void setScore(final Integer score) {
		this.score = score;
	}

<<<<<<< HEAD
=======
	@NotNull
>>>>>>> develop
	@Past
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	public Date getMoment() {
		return this.moment;
	}

	public void setMoment(final Date moment) {
		this.moment = moment;
	}

	@Valid
	@ManyToOne(optional = false)
	public Position getPosition() {
		return this.position;
	}

	public void setPosition(final Position position) {
		this.position = position;
	}

<<<<<<< HEAD
=======
	@Valid
	@ManyToOne(optional = false)
	public Auditor getAuditor() {
		return this.auditor;
	}

	public void setAuditor(final Auditor auditor) {
		this.auditor = auditor;
	}

	@NotNull
	public Boolean getIsDraft() {
		return this.isDraft;
	}

	public void setIsDraft(final Boolean isDraft) {
		this.isDraft = isDraft;
	}

>>>>>>> develop
}
