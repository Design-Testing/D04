
package converters;

import javax.transaction.Transactional;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import domain.Audit;

@Component
@Transactional
public class AuditToStringConverter implements Converter<Audit, String> {

	@Override
	public String convert(final Audit audit) {

		String result;

		if (audit == null)
			result = null;
		else
			result = String.valueOf(audit.getId());

		return result;

	}

}
