
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Audit;

@Repository
public interface AuditRepository extends JpaRepository<Audit, Integer> {

	@Query("select a from Audit a where a.auditor.id=?1")
	Collection<Audit> findAllByAuditor(int auditorId);

	@Query("select a from Audit a where a.auditor.id=?1 and a.isDraft = TRUE")
	Collection<Audit> findAllDraftByAuditor(int auditorId);

	@Query("select a from Audit a where a.auditor.id=?1 and a.isDraft = FALSE")
	Collection<Audit> findAllFinalByAuditor(int auditorId);

	@Query("select a from Audit a where a.position.id=?1 and a.isDraft = FALSE")
	Collection<Audit> findAllByPosition(int positionId);

	@Query("select a from Audit a join a.position p where p.company.id=?1")
	Collection<Audit> findAllByCompany(int companyId);

	@Query("select count(a) from Audit a join a.position p where p.company.id=?1")
	Integer countAllByCompany(int companyId);

	/** The average, minimum, maximum and standard deviation of the audit score of the positions stored in the system */
	@Query("select avg(1.0+ (select au.score from Audit au where au.position.id=pos.id) -1.0), min(1.0+ (select au.score from Audit au where au.position.id=pos.id) -1.0), max(1.0+ (select au.score from Audit au where au.position.id=pos.id) -1.0), stddev(1.0+ (select au.score from Audit au where au.position.id=pos.id) -1.0) from Position pos")
	Double[] getStatisticsOfAAuditScoreOfPositions();

	@Query("select avg(1.0+ (select au.score from Audit au where au.position.company.id=c.id) -1.0), min(1.0+ (select au.score from Audit au where au.position.company.id=c.id) -1.0), max(1.0+ (select au.score from Audit au where au.position.company.id=c.id) -1.0), stddev(1.0+ (select au.score from Audit au where au.position.company.id=c.id) -1.0) from Company c")
	Double[] getStatisticsOfAAuditScoreOfCompanies();
}
