
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import domain.Audit;

public interface AuditRepository extends JpaRepository<Audit, Integer> {

	@Query("select a from Audit a where a.position.id=?1")
	Collection<Audit> findAllByPosition(Integer positionId);

	@Query("select a from Audit a where a.auditor.userAccount.id=?1")
	Collection<Audit> findAllByAuditor(Integer auditorUAId);

}
