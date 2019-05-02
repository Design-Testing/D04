
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import domain.Rooky;

public interface RookyRepository extends JpaRepository<Rooky, Integer> {

	@Query("select h from Hacker h where h.userAccount.id=?1")
	Rooky findByUserId(Integer hackerId);

	/** The average, minimum, maximum and standard deviation of the number of applications per hacker */
	@Query("select avg(1.0+ (select count(p) from Application p where p.hacker.id=c.id) -1.0), min(1.0+ (select count(p) from Application p where p.hacker.id=c.id) -1.0), max(1.0+ (select count(p) from Application p where p.hacker.id=c.id) -1.0), stddev(1.0+ (select count(p) from Application p where p.hacker.id=c.id) -1.0) from Hacker c")
	Double[] getStatisticsOfApplicationsPerHacker();

	/** Hackers who have made more applications **/
	@Query("select g from Hacker g where (1.0 + (select count(e) from Application e where e.hacker.id=g.id) - 1.0)=(select max(1.0 + (select count(en) from Application en where en.hacker.id=b.id) - 1.0) from Hacker b)")
	Collection<Rooky> getHackersMoreApplications();

	@Query("select c.hacker from Curricula c where c.id=?1")
	Rooky findHackerByCurricula(int id);

	@Query("select c.hacker from Curricula c where c.personalRecord.id=?1")
	Rooky findHackerByPersonalData(int id);

	@Query("select c.hacker from Curricula c join c.miscellaneous m where m.id=?1")
	Rooky findHackerByMiscellaneous(int id);

	@Query("select c.hacker from Curricula c join c.positions m where m.id=?1")
	Rooky findHackerByPositionDatas(int id);

	@Query("select c.hacker from Curricula c join c.educations m where m.id=?1")
	Rooky findHackerByEducationDatas(int id);

	@Query("select case when (count(c) > 0) then true else false end from Curricula c join c.educations e where e.id=?2 and c.hacker.id=?1")
	Boolean hasEducationData(int hackerId, int dataId);

	@Query("select case when (count(c) > 0) then true else false end from Curricula c join c.positions e where e.id=?2 and c.hacker.id=?1")
	Boolean hasPositionData(int hackerId, int dataId);

	@Query("select case when (count(c) > 0) then true else false end from Curricula c join c.miscellaneous e where e.id=?2 and c.hacker.id=?1")
	Boolean hasMiscellaneousData(int hackerId, int dataId);

	@Query("select case when (count(c) > 0) then true else false end from Curricula c where c.id=?2 and c.hacker.id=?1")
	Boolean hasCurricula(int hackerId, int dataId);

	@Query("select case when (count(c) > 0) then true else false end from Curricula c  where c.personalRecord.id=?2 and c.hacker.id=?1")
	Boolean hasPersonalData(int hackerId, int dataId);

	@Query("select a.hacker from Application a where a.curricula.id=?1")
	Rooky findHackerByCopyCurricula(int id);

}
