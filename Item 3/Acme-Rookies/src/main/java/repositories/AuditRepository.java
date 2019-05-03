
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import domain.Audit;

public interface AuditRepository extends JpaRepository<Audit, Integer> {

}
