package com.aleykoteretpro.packages;
import java.util.List;

public interface ITransDAO {
/**
* Public Interface for DAO
* @param iterator
* @return
* @throws MyExceptions
*/
	public List<Trans> getTrans() throws MyExceptions;
	public Boolean addTrans(Trans tr) throws MyExceptions;
	public Boolean deleteTrans(Trans tr) throws MyExceptions;
	public Boolean updateTrans(Trans tr) throws MyExceptions;
}