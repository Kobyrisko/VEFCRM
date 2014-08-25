package com.aleykoteretpro.packages;
import java.util.Collection;
import java.util.List;

public interface IJobRequest {
/**
* Public Interface for DAO
* @param iterator
* @return
* @throws MyExceptions
*/
	public List<JobRequest> getAllJobRequest() throws MyExceptions;
	public List<JobRequest> getAllJobRequestByFreelancerName(String freelancerName) throws MyExceptions;
	public Boolean addJobRequest(JobRequest jobRequest) throws MyExceptions;
	public Boolean deleteJobRequest(JobRequest jobRequest) throws MyExceptions;
	public Boolean updateJobRequest(JobRequest jobRequest) throws MyExceptions;
}
