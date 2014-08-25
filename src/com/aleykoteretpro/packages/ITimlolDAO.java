package com.aleykoteretpro.packages;
import java.util.List;

public interface ITimlolDAO {
/**
* Public Interface for DAO
* @param iterator
* @return
* @throws MyExceptions
*/
	public Timlol getTimlol(int iterator) throws MyExceptions;
	public List<Timlol> getTimlol() throws MyExceptions;
	public Boolean addTimlol(Timlol tl) throws MyExceptions;
	public Boolean deleteTimlol(Timlol tl) throws MyExceptions;
	public Boolean updateTimlol(Timlol tl) throws MyExceptions;
}