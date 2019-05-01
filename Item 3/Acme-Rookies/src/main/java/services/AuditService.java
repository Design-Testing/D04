
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.AuditRepository;
import domain.Audit;
import domain.Position;

@Service
@Transactional
public class AuditService {

	@Autowired
	private AuditRepository	auditRepository;

	@Autowired
	private AuditorService	auditorService;

	@Autowired
	private PositionService	positionService;


	public Audit create(final int auditId) {
		final Audit audit = new Audit();
		final Position position = new Position();
		final Auditor auditor = new Auditor();
		final Date moment = new Date(System.currentTimeMillis() - 1);
		audit.setAuditor(auditor);
		audit.setMoment(moment);
		audit.setPosition(position);
		return audit;
	}

	public Collection<Audit> findAll() {
		Collection<Audit> res = new ArrayList<>();
		res = this.auditRepository.findAll();
		Assert.notNull(res);
		return res;
	}

	public Audit findOne(final int auditId) {
		Assert.isTrue(auditId != 0);
		final Audit res = this.auditRepository.findOne(auditId);
		Assert.notNull(res);
		return res;
	}

	public Audit save(final Audit audit, final int positionId) {
		Assert.notNull(audit);
		final Auditor principal = this.auditorService.findByPrincipal();
		final Audit result;

		if (audit.getId() != 0) {
			Assert.isTrue(principal.equals(audit.getAuditor()), "No puede actualizar un audit que no le pertenece.");
			Assert.isTrue(audit.getMode().equals("DRAFT"));
		} else {
			final Position position = this.positionService.findOne(positionId);
			audit.setMode("DRAFT");
			audit.setAuditor(principal);
			audit.setPosition(position);
		}
		result = this.auditRepository.save(audit);
		return result;
	}
	public void delete(final Audit audit) {
		Assert.notNull(audit);
		Assert.isTrue(audit.getId() != 0);
		Assert.isTrue(this.auditRepository.exists(audit.getId()));
		Assert.isTrue(audit.getMode().equals("DRAFT"));
		this.auditRepository.delete(audit);
	}

	/* ========================= OTHER METHODS =========================== */

	public void flush() {
		this.auditRepository.flush();
	}

	public Collection<Audit> findAllByPosition(final int positionId) {
		Collection<Audit> res;
		res = this.auditRepository.findAllByPosition(positionId);
		return res;
	}

	public Collection<Audit> findAllByAuditor(final int auditorId) {
		Collection<Audit> res;
		res = this.auditRepository.findAllByAuditor(auditorId);
		return res;
	}

}
