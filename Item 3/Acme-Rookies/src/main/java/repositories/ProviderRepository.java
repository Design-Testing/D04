
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import domain.Provider;

public interface ProviderRepository extends JpaRepository<Provider, Integer> {

	@Query("select h from Provider h where h.userAccount.id=?1")
	Provider findByUserId(Integer providerId);

}
