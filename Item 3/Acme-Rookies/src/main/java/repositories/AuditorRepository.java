
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import domain.Auditor;

public interface AuditorRepository extends JpaRepository<Auditor, Integer> {

	@Query("select h from Auditor h where h.userAccount.id=?1")
	Auditor findByUserId(Integer auditorId);
}
