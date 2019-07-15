
package services;

import org.joda.time.LocalDate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import domain.CreditCard;

@Service
@Transactional
public class CreditCardService {

	// auxiliar
	public boolean tarjetaCaducada(final CreditCard c) {
		boolean res = false;
		final boolean mesCaducado = c.getExpirationMonth() < LocalDate.now().getMonthOfYear();
		final boolean mismoAnyo = (2000 + c.getExpirationYear()) == LocalDate.now().getYear();
		final boolean anyoCaducado = (2000 + c.getExpirationYear()) < LocalDate.now().getYear();
		if (anyoCaducado || (mismoAnyo && mesCaducado))
			res = true;

		return res;
	}
}
