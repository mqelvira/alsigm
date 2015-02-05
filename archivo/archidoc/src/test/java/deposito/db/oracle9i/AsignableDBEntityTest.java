package deposito.db.oracle9i;

import org.junit.Test;

import common.manager.ArchidocBaseOracleTest;
import common.util.DBFactoryConstants;

import deposito.db.IElementoAsignableDBEntity;

public class AsignableDBEntityTest extends ArchidocBaseOracleTest {

	@Override
	protected IElementoAsignableDBEntity getDAO() {
		return getManager().getElementoAsignableDBEntity();
	}

	@Override
	protected String getDbFactoryClass() {
		return DBFactoryConstants.ORACLE9_FACTORY;
	}

	@Test
	public void allTest() {
		getDAO().getIdsElementosAsignables(idsPadres);
		getDAO().getElementoByCodOrden(codOrden, idDeposito);
		getDAO().getElementoByMinimoCodOrden(idDeposito, codOrden, idFormato);
	}


}
