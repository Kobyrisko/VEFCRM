package com.aleykoteretpro.packages;
import java.util.Collection;
import java.util.List;

public interface IWorkOrderDAO {
/**
* Public Interface for DAO
* @param iterator
* @return
* @throws MyExceptions
*/	
	public WorkOrder getWorkOrder(int iterator) throws MyExceptions;
	public List getWorkOrder() throws MyExceptions;
	public Boolean addWorkOrder(WorkOrder wo) throws MyExceptions;
	public Boolean deleteWorkOrder(WorkOrder wo) throws MyExceptions;
	public Boolean updateWorkOrder(WorkOrder wo) throws MyExceptions;
}
