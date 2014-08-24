package com.shoping.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoping.model.DatabaseConect;
import com.shoping.model.Item;
import com.shoping.model.LoginCheck;


public class ServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LoginCheck logincheck = null;
	Item itemcheck = null;
	DatabaseConect db = null;
	ArrayList<String> totalQuantity;

	String message = "";


	String nextPage = "/login.jsp";



	public ServletController() {
		super();

	}
	public void init(){
		logincheck = new LoginCheck();
		itemcheck = new Item();
		db = new DatabaseConect();
		totalQuantity= new ArrayList<String>();

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = null;
		session = request.getSession();


		
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String buttonClicked = null;
		String hiddenValue = null;
		if(request.getParameter("page")!=null)
			hiddenValue = request.getParameter("page").toString();
		



		buttonClicked = request.getParameter("action").toString();
		System.out.println(buttonClicked);
		if(buttonClicked.equalsIgnoreCase("login")){
			if(username!= null && username.equalsIgnoreCase("") || password != null && password.equalsIgnoreCase("") ){
				
				 
				request.setAttribute("errorMsg", "null");
			}

			else{

				boolean isValidUser = logincheck.authenticate(username, password);

				if(isValidUser){
					nextPage = "/WEB-INF/cart.jsp";
					
					session.setAttribute("itemList",db.getItem());//*****database.
					System.out.println("***********");
					//System.out.println(name);
					request.setAttribute("errorMsg", "true");


					
				}
				else {

					request.setAttribute("errorMsg", "false");

				}
			}
		}

		else if(buttonClicked.equalsIgnoreCase("help")) {
			nextPage = "/WEB-INF/help.jsp";
		} 
		else if( buttonClicked.equalsIgnoreCase("add to cart")) {
			nextPage ="WEB-INF/cart.jsp";
			String[] itemID = request.getParameterValues("item");

			session.setAttribute("itemID", itemID);
			String name = "quantity";

			for(int i=0; i<itemID.length; i++) {
				name = "quantity" + itemID[i];
				totalQuantity.add(request.getParameter(name));
				//System.out.println(itemID[i]+"\t"+totalQuantity.get(i));
			}
			session.setAttribute("totalQuantity", totalQuantity );

			//	System.out.println(totalQuantity);/////
			for(int i =0 ; i<itemID.length;i++){
				System.out.println(itemID[i]);//

			}



		}
		else if (buttonClicked.equalsIgnoreCase("logout")){
			nextPage = "/login.jsp";
			session.invalidate();
			totalQuantity.clear();

		}
		else if (buttonClicked.equalsIgnoreCase("home")){
			nextPage = "/WEB-INF/cart.jsp";

		}
		else if ( session.getAttribute("itemID") != null && buttonClicked.equalsIgnoreCase("checkout")&&hiddenValue.equalsIgnoreCase("cart")){
			nextPage = "/WEB-INF/summary.jsp";
			String[] itemID = request.getParameterValues("item");

			session.setAttribute("itemID", itemID);
			String name = "quantity";

			for(int i=0; i<itemID.length; i++) {
				name = "quantity" + itemID[i];
				totalQuantity.add(request.getParameter(name));
				//System.out.println(itemID[i]+"\t"+totalQuantity.get(i));
			}
			session.setAttribute("totalQuantity", totalQuantity );

			//	System.out.println(totalQuantity);/////
			for(int i =0 ; i<itemID.length;i++){
				System.out.println(itemID[i]);//

			}


		}

		else if (buttonClicked.equalsIgnoreCase("checkout")&&hiddenValue.equalsIgnoreCase("summary")){
			nextPage = "/WEB-INF/thankyou.jsp";

		}

		else if(buttonClicked.equalsIgnoreCase("Back to cart")){
			nextPage = "/WEB-INF/cart.jsp";
		}
		else if (buttonClicked.equalsIgnoreCase("Clear Cart")){
			totalQuantity.clear();
			session.removeAttribute("itemID");
			nextPage="/WEB-INF/cart.jsp";
			//totalQuantity.clear();
		}




		RequestDispatcher rd = request.getRequestDispatcher(nextPage);
		rd.forward(request, response);


	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


}


