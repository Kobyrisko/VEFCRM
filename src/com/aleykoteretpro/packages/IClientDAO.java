package com.aleykoteretpro.packages;
import java.util.Collection;
import java.util.List;

public interface IClientDAO {
/**
* Public Interface for DAO
* @param iterator
* @return
* @throws MyExceptions
*/
	public Client getClient(int iterator) throws MyExceptions;
	public List getClient() throws MyExceptions;
	public Boolean addClient(Client cl) throws MyExceptions;
	public Boolean deleteClient(Client cl) throws MyExceptions;
	public Boolean updateClient(Client cl) throws MyExceptions;
}
