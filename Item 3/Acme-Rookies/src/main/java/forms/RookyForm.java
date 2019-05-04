
package forms;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import domain.Finder;

@Entity
@Access(AccessType.PROPERTY)
public class RookyForm extends ActorForm {

	private Finder	finder;


	@NotNull
	public Finder getFinder() {
		return this.finder;
	}

	public void setFinder(final Finder finder) {
		this.finder = finder;
	}

}
