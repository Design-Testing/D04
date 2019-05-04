
package forms;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import domain.Sponsorship;

@Entity
@Access(AccessType.PROPERTY)
public class ProviderForm extends ActorForm {

	private Sponsorship	sponsorship;


	@NotNull
	public Sponsorship getSponsorship() {
		return this.sponsorship;
	}

	public void setSponsorship(final Sponsorship sponsorship) {
		this.sponsorship = sponsorship;
	}

}
