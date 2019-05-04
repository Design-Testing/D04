
package repositories;

import java.util.Collection;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Position;

@Repository
public interface PositionRepository extends JpaRepository<Position, Integer> {

	@Query("select p from Position p where p.ticker = ?1")
	Collection<Position> getPositionWithTicker(String ticker);

	@Query("select p from Position p where p.company.userAccount.id=?1")
	Collection<Position> findAllPositionByCompanyId(int id);

	@Query("select p from Position p where p.mode = 'FINAL'")
	Collection<Position> findAllFinalMode();

	@Query("select p from Position p where p.mode='FINAL' AND p.company.id=?1")
	Collection<Position> findAllFinalModeByCompany(int id);

	@Query("select p from Position p where (p.mode='FINAL' OR p.mode='CANCELLED') AND p.company.id=?1")
	Collection<Position> findAllByCompany(int companyId);

	/** The average, minimum, maximum and standard deviation of the salary offered */
	@Query("select avg(p.salary), min(p.salary), max(p.salary), stddev(p.salary) from Position p")
	Double[] getStatisticsOfSalary();

	/** The best position in terms of salary. */
	@Query("select p from Position p where p.salary=(select max(po.salary) from Position po)")
	Position[] getBestPosition();

	/** The worst position in terms of salary. */
	@Query("select p from Position p where p.salary=(select min(po.salary) from Position po)")
	Position[] getWorstPosition();

	@Query("select distinct p from Position p join p.skills s join p.technologies tec where ((p.mode='FINAL') OR (p.mode='CANCELLED')) AND (?1='' OR p.description LIKE CONCAT('%',?1,'%') OR p.title LIKE CONCAT('%',?1,'%') OR p.ticker LIKE CONCAT('%',?1,'%') OR s LIKE CONCAT('%',?1,'%') OR tec LIKE CONCAT('%',?1,'%')) AND ((p.salary>=?2) OR ?2=NULL) AND ((p.salary<=?3) OR ?3=NULL) AND ((p.deadline>=?4) OR ?4=NULL) AND ((p.deadline<=?5) OR ?5=NULL)")
	Collection<Position> findPositions(String keyword, Double minSalary, Double maxSalary, Date minDeadline, Date maxDeadline);

	@Query("select distinct p from Position p join p.skills s join p.technologies tec join p.company cn where ((p.mode='FINAL') OR (p.mode='CANCELLED')) AND (?1='' OR p.description LIKE CONCAT('%',?1,'%') OR p.title LIKE CONCAT('%',?1,'%') OR p.ticker LIKE CONCAT('%',?1,'%') OR s LIKE CONCAT('%',?1,'%') OR tec LIKE CONCAT('%',?1,'%') OR cn.commercialName LIKE CONCAT('%',?1,'%'))")
	Collection<Position> findByKeyword(String keyword);

	@Query("select distinct p from Application ap join ap.position p join ap.rooky h where h.id=?1")
	Collection<Position> findAppliedByRooky(int id);

	@Query("select p from Audit a join a.position p")
	Collection<Position> findAuditedPositionsByAuditor(int auditorId);
}
