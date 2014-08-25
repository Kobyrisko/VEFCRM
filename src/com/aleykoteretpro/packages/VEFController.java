package com.aleykoteretpro.packages;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.lang.reflect.Field;

import javax.jws.soap.SOAPBinding.Use;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

/**
 * Servlet implementation class WebstoreController
 */
@WebServlet("/controller/*")
public class VEFController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VEFController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/**
		 * Koby Riskovich and Liran Bar this following code is for a controller
		 * that is set to control between pages
		 */
		// creating factory for getting sessions
		SessionFactory factory = new AnnotationConfiguration().configure()
				.buildSessionFactory();
		// creating a new session for adding products
		Session session = factory.openSession();
		// Getting data from the DataBase and sending it to the request
		String path = request.getPathInfo(); // requesting path for switch case
		// Reading from DB
		List timlolList = session.createQuery("from Timlol").list();
		List clientList = session.createQuery("from Client").list();
		List transList = session.createQuery("from Trans").list();
		List workOrderList = session.createQuery("from WorkOrder").list();
		List usersList = session.createQuery("from Users").list();
		List allJobRequestList = session.createQuery("from JobRequest").list();
		// forwarding Data to GUI
		request.setAttribute("timlolList", timlolList);
		request.setAttribute("clientList", clientList);
		request.setAttribute("transList", transList);
		request.setAttribute("workOrderList", workOrderList);
		request.setAttribute("allJobRequestList", allJobRequestList);
		// Printing the Data
		System.out.println("There are " + clientList.size() + " Client(s)");
		System.out.println("There are " + timlolList.size()
				+ " Transcribers(s)");
		System.out.println("There are " + transList.size() + " Translators(s)");
		System.out.println("There are " + workOrderList.size()
				+ " Work Orders(s)");
		System.out.println("There are " + usersList.size() + " Users(s)");
		System.out.println("There are "+ allJobRequestList.size()+ "Opened Job Requests");
		String currentUser = new String(" ");
		
		String checkButtonPressed = new String("No Val");
		if (request.getParameter("Username")!=null)
		{
			if(currentUser.equals(" "))
			{
			currentUser = request.getParameter("Username");
			}
		}
		request.setAttribute("Username", currentUser);
		session.close();

		// Catching which page needs to be load and routing
		switch (path) 
		{
		case "/home": 
		{
			if (request.getParameter("action1") != null)
				checkButtonPressed = request.getParameter("action1");
			System.out.println(checkButtonPressed);
			session.close();
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/view/viewClient.jsp");
			dispatcher.forward(request, response);
			break;
		}

		case "/viewClient": // adding a new client
		{
			IClientDAO clientObjectDao = ClientDAO.getInstance();

			Client newClientObject = new Client();
			
			if (request.getParameter("action1") != null)
			{
				checkButtonPressed = request.getParameter("action1");
				
				newClientObject = new Client(Integer.parseInt(request
						.getParameter("Clientid")),
						request.getParameter("firstName"),
						request.getParameter("lastName"),
						request.getParameter("phone"),
						request.getParameter("email"),
						request.getParameter("adress"),
						request.getParameter("companyName"),
						request.getParameter("companyCode"));
			}

			try
			{
				if (checkButtonPressed.equals("Update"))
				{
					if (clientObjectDao.updateClient((newClientObject)))
						System.out.println("Updated Client");
				}
				
				if (checkButtonPressed.equals("Delete"))
				{
					if (clientObjectDao.deleteClient((newClientObject)))
						System.out.println("added a new Client");
				}
				
				if (checkButtonPressed.equals("Create New"))
				{
					if (clientObjectDao.addClient((newClientObject)))
						System.out.println("added a new Client");
				}
				
				List updatedClientList = clientObjectDao.getClient();
				request.setAttribute("clientList", updatedClientList);
				
			}
			
			catch (MyExceptions e)
			{
				e.printStackTrace();
			} 
			
			finally
			{
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/view/viewClient.jsp");
				dispatcher.forward(request, response);
			}
			break;
		}

		case "/viewTimlol":
		{
			ITimlolDAO timlolObjectDao = TimlolDAO.getInstance();
			Timlol newTimlolObject = new Timlol();

			if (request.getParameter("action1") != null) 
			{
				checkButtonPressed = request.getParameter("action1");
				double price = 0;
				
				if (!request.getParameter("timlolPrice").equals(""))
				{
					price = Double.parseDouble(request
							.getParameter("timlolPrice"));
				}
				
				newTimlolObject = new Timlol(Integer.parseInt(request
						.getParameter("Timlolid")),
						request.getParameter("firstName"),
						request.getParameter("lastName"),
						request.getParameter("phone"),
						request.getParameter("email"),
						request.getParameter("adress"), price,
						request.getParameter("timlolCode"));
			}

			try
			{
				if (checkButtonPressed.equals("Update")) 
				{
					if (timlolObjectDao.updateTimlol((newTimlolObject)))
						System.out.println("Timlol Updated");
				}
				
				if (checkButtonPressed.equals("Delete"))
				{
					if (timlolObjectDao.deleteTimlol((newTimlolObject)))
						System.out.println("Timlol Deleted");
				}
				
				if (checkButtonPressed.equals("Create New")) 
				{
					if (timlolObjectDao.addTimlol((newTimlolObject)))
						System.out.println("Added a new Timlol");
				}
				
				List updatedTimlolList = timlolObjectDao.getTimlol();
				request.setAttribute("timlolList", updatedTimlolList);

			} 
			catch (MyExceptions e) 
			{
				e.printStackTrace();
			} 
			finally
			{
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/view/viewTimlol.jsp");
				dispatcher.forward(request, response);
			}
			
			break;
		}

		case "/viewTrans":
		{
			ITransDAO trDao = TransDAO.getInstance();
			Trans newTrans = new Trans();
			
			if (request.getParameter("action1") != null) 
			{
				checkButtonPressed = request.getParameter("action1");
				double price = 0;
				if (!request.getParameter("transPrice").equals(""))
					price = Double.parseDouble(request
							.getParameter("transPrice"));
				newTrans = new Trans(Integer.parseInt(request
						.getParameter("Transid")),
						request.getParameter("firstName"),
						request.getParameter("lastName"),
						request.getParameter("phone"),
						request.getParameter("email"),
						request.getParameter("adress"), price,
						request.getParameter("transCode"),
						request.getParameter("languages"));
			}

			try 
			{
				if (checkButtonPressed.equals("Update"))
				{
					if (trDao.updateTrans((newTrans)))
						System.out.println("Translator Updated");
				}
				
				if (checkButtonPressed.equals("Delete"))
				{
					if (trDao.deleteTrans((newTrans)))
						System.out.println("Translator Deleted");
				}
				
				if (checkButtonPressed.equals("Create New"))
				{
					if (trDao.addTrans((newTrans)))
						System.out.println("Added a new Translator");
				}
				
				List updatedTranslatorsList = trDao.getTrans();
				request.setAttribute("transList", updatedTranslatorsList);
			}
			
			catch (MyExceptions e) 
			{
				e.printStackTrace();
			}
			finally
			{
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/view/viewTrans.jsp");
				dispatcher.forward(request, response);
			}
			
			break;
		}

		case "/viewWorkOrder": 
		{
			String Job = "";
			String clientGet= "";
			
			if (!(request.getParameter("ClientGet") == null))
				clientGet = request.getParameter("ClientGet");
			if (!(request.getParameter("Job") == null))
				Job = request.getParameter("Job");
			IWorkOrderDAO woDao = WorkOrderDAO.getInstance();

			WorkOrder newWorkOrderObject = new WorkOrder();

			if (request.getParameter("action1") != null) 
			{
				checkButtonPressed = request.getParameter("action1");
				int price = 0;
				if (!request.getParameter("Price").equals(""))
				{
					price = Integer.parseInt(request.getParameter("Price"));
				}
				
				newWorkOrderObject = new WorkOrder(Integer.parseInt(request
						.getParameter("OrderID")),
						request.getParameter("Client"), Job,
						request.getParameter("Lang1"),
						request.getParameter("Lang2"),
						request.getParameter("Length"),
						request.getParameter("Translator"),
						request.getParameter("Timlol"),
						request.getParameter("Status"),
						request.getParameter("StartDate"),
						request.getParameter("FinishDate"), price,
						clientGet,
						request.getParameter("Notifications"),
						request.getParameter("nameOfJob"));
			}
			
			try 
			{
				if (checkButtonPressed.equals("Update"))
				{
					if (woDao.updateWorkOrder((newWorkOrderObject)))
					{
						System.out.println("workOrder Updated");
					}
				}
				
				if (checkButtonPressed.equals("Delete")) 
				{
					if (woDao.deleteWorkOrder((newWorkOrderObject)))
					{
						System.out.println("workOrder Deleted");
					}
				}
				
				if (checkButtonPressed.equals("Create New"))
				{
					if (woDao.addWorkOrder((newWorkOrderObject)))
					{
						System.out.println("Added a new workOrder");
					}
					JobRequest newJobRequest = new JobRequest(1, newWorkOrderObject.getId(),
							newWorkOrderObject.getTranslator(),
							1,
							newWorkOrderObject.getNameOfJob(),
							"Opened");
					IJobRequest jobRequestDao = JobRequestDao.getInstance();
					if (jobRequestDao.addJobRequest(newJobRequest))
					{
						System.out.println("Added a new Job Request");
						request.setAttribute("currentJobRequest", newJobRequest);
					}
					
				}
				
				List updatedWorkOrderList = woDao.getWorkOrder();
				request.setAttribute("workOrderList", updatedWorkOrderList);
			} 
			
			catch (MyExceptions e)
			{
				e.printStackTrace();
			} 
			finally 
			{
				if (checkButtonPressed.equals("Create New"))
				{
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/view/ViewCurrentJobRequest.jsp");
					dispatcher.forward(request, response);
					
				}
				else
				{
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/view/homePage.jsp");
					dispatcher.forward(request, response);
				}
				
				
			}
			
			break;
		}
		
		case "/CreateNewWorkOrder": 
		{
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/view/CreateNewWorkOrder.jsp");
			dispatcher.forward(request, response);
			break;
		}
		
		case "/TechUpdateWorkOrder": 
		{
			IWorkOrderDAO woDao = WorkOrderDAO.getInstance();
			request.setAttribute("Username", "Admin");
			
			System.out.println(request.getParameter("action1"));
			WorkOrder wo = new WorkOrder(Integer.parseInt(request
					.getParameter("OrderID")), "", "", "", "",
					request.getParameter("Length"), "", "",
					(request.getParameter("Status")), "", "", 0, "", "", "");
			if (checkButtonPressed.equals("Update")) {
				try {
					if (woDao.updateWorkOrder(wo))
						System.out.println("workOrder Updated");
					List workOrderList2 = woDao.getWorkOrder();
					request.setAttribute("workOrderList", workOrderList2);
				} catch (MyExceptions e) {
					e.printStackTrace();
				} finally {

					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher("/view/TechViewWorkOrder.jsp");
					dispatcher.forward(request, response);
				}
			}
			break;
		}
		case "/viewJobRequest":
		{
			IJobRequest jobRequestDao = JobRequestDao.getInstance();
			JobRequest currentJobRequest = new JobRequest(Integer.parseInt(request.getParameter("jobRequestID")),
					Integer.parseInt(request.getParameter("jobRequestWorkOrderID")),
					request.getParameter("jobRequestFreeLancerName"),
					Integer.parseInt(request.getParameter("jobRequestPrice")),
					Integer.parseInt(request.getParameter("jobRequestMonth")),
					request.getParameter("jobRequestFinishDate"),
					request.getParameter("jobRequestNameOfJob"), 
					request.getParameter("jobRequestStatus"),
					request.getParameter("jobRequestComments"));
			try {
				if (jobRequestDao.updateJobRequest(currentJobRequest))
				{
					System.out.println("Job Request Updated Succesfully");
				}
			} catch (MyExceptions e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		 finally 
		 {

			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/view/VAOJR.jsp");
			dispatcher.forward(request, response);
		}
			
			break;
		}

		
		
		
		case "/HomePageLoad": // Login users check
		{
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/view/homePage.jsp");
			dispatcher.forward(request, response);
			break;
		}
		
		case "/viewAllOpenedJobRequest":
		{
			System.out.println("*************************************************************************");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/view/VAOJR.jsp");
			dispatcher.forward(request, response);
			System.out.println("*************************************************************************");
			break;
		}
		case "/viewCurrentJobRequest":
		{
			JobRequest currentJobRequest = new JobRequest();
			int currentJobRequestID = Integer.parseInt(request.getParameter("currentJobRequestID"));
			currentJobRequest = (JobRequest) allJobRequestList.get(currentJobRequestID);
			request.setAttribute("currentJobRequest", currentJobRequest);
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/view/ViewCurrentJobRequest.jsp");
			dispatcher.forward(request, response);
			break;
		}
	
		
		
		
		case "/currentWorkOrderView": // Login users check
		{
			WorkOrder currentWorkOrder = new WorkOrder();
			int currentWorkOrderID = Integer.parseInt(request
					.getParameter("currentWorkOrderID"));
			
			currentWorkOrder = (WorkOrder) workOrderList
					.get(currentWorkOrderID);
			
			request.setAttribute("currentWorkOrder", currentWorkOrder);
			
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher("/view/ViewCurrentWorkOrder.jsp");
			dispatcher.forward(request, response);
			break;
		}
		
		
		
		
		
		case "/UserCheck": // Login users check
		{
			boolean Adminflag = false;
			boolean TechFlag = false;
			System.out.println(Adminflag);
			Iterator i = usersList.iterator();
			while (i.hasNext()) {
				Users newUser = (Users) i.next();
				if (request.getParameter("Username").equals(
						newUser.getUsername()))
					if (request.getParameter("Password").equals(
							newUser.getPassword())) {
						Adminflag = true;
						if (request.getParameter("Username").equals("Tech")) {
							Adminflag = false;
							TechFlag = true;
						}
						break;
					}
			}
			if (Adminflag == true) {
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/view/homePage.jsp");
				dispatcher.forward(request, response);

			}
			if (TechFlag == true) {
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/view/TechViewWorkOrder.jsp");
				dispatcher.forward(request, response);
			}
			if (Adminflag == false && TechFlag == false) {
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher("/view/index_2.html");
				dispatcher.forward(request, response);
			}

			break;
		}

		}
	}
}
