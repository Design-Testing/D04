
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.SponsorshipRepository;
import domain.Provider;
import domain.Sponsorship;

@Service
@Transactional
public class SponsorshipService {

	@Autowired
	private SponsorshipRepository	sponsorshipRepository;
	@Autowired
	private ProviderService			providerService;


	//Constructor
	public SponsorshipService() {
		super();
	}

	//Simple CRUD method
	public Sponsorship create() {
		return new Sponsorship();
	}

	public Collection<Sponsorship> findAll() {
		final Collection<Sponsorship> res = this.sponsorshipRepository.findAll();
		Assert.notNull(res);
		return res;
	}

	public Sponsorship findOne(final int sponsorshipId) {
		Assert.isTrue(sponsorshipId != 0);
		final Sponsorship res = this.sponsorshipRepository.findOne(sponsorshipId);
		Assert.notNull(res);
		return res;
	}

	public Sponsorship save(final Sponsorship sponsorship) {
		final Provider provider = this.providerService.findByPrincipal();
		Assert.notNull(sponsorship);
		Assert.isTrue(sponsorship.getProvider().equals(provider));
		final Sponsorship res = this.sponsorshipRepository.save(sponsorship);
		Assert.notNull(this.findOne(res.getId()));
		return res;
	}

	public void delete(final Sponsorship sponsorship) {
		Assert.notNull(sponsorship);
		Assert.isTrue(sponsorship.getId() != 0);
		Assert.isTrue(this.sponsorshipRepository.exists(sponsorship.getId()));
		this.sponsorshipRepository.delete(sponsorship);
	}

	public Double[] getStatisticsOfSponsorshipPerProvider() {
		return this.sponsorshipRepository.getStatisticsOfSponsorshipPerProvider();
	}

	public Double[] getStatisticsOfSponsorshipPerPosition() {
		return this.sponsorshipRepository.getStatisticsOfSponsorshipPerPosition();
	}

	public void flush() {
		this.sponsorshipRepository.flush();
	}

}
