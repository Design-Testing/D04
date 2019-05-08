
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import domain.Sponsorship;

public interface SponsorshipRepository extends JpaRepository<Sponsorship, Integer> {

	/** The average, the minimum, the maximum, and the standard deviation of the number of sponsorships per provider. */
	@Query("select avg(1.0+(select count(sp) from Sponsorship sp where sp.provider.id=pro.id)-1.0), min(1.0+(select count(sp) from Sponsorship sp where sp.provider.id=pro.id)-1.0), max(1.0+(select count(sp) from Sponsorship sp where sp.provider.id=pro.id)-1.0),stddev(1.0+(select count(sp) from Sponsorship sp where sp.provider.id=pro.id)-1.0) from Provider pro")
	Double[] getStatisticsOfSponsorshipPerProvider();

	/** The average, the minimum, the maximum, and the standard deviation of the number of sponsorships per position. */
	@Query("select avg(1.0+(select count(sp) from Sponsorship sp where sp.position.id=pos.id)-1.0), min(1.0+(select count(sp) from Sponsorship sp where sp.position.id=pos.id)-1.0), max(1.0+(select count(sp) from Sponsorship sp where sp.position.id=pos.id)-1.0),stddev(1.0+(select count(sp) from Sponsorship sp where sp.position.id=pos.id)-1.0) from Position pos")
	Double[] getStatisticsOfSponsorshipPerPosition();

}
