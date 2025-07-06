<%@page import="com.bean.IngredentsBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.UserBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- Begin Page Content -->
<div id="wrapper">
	
	<jsp:include page="AdminSidebar.jsp"></jsp:include>
       
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            
            <!-- Main Content -->
            <div id="content">
            
               <jsp:include page="AdminNavbar.jsp"></jsp:include>

							


									
							  <div class="container mt-5">
 							   <h2 class="mb-4 text-center">List User</h2>
 							   
 							       <!-- 🔍 Search Form -->
							<div class="container">
							  <div class="row justify-content-center">
							    <div class="col-md-6">
							      <form action="searchingredient" method="post" class="mb-4">
							        <div class="input-group">
							          <input type="text" name="name" class="form-control" placeholder="Search by Name or Scientific Name">
							          
                                			<button class="btn btn-primary" type="submit">
                                   			 <i class="fas fa-search fa-sm"></i>
                               				 </button>
							        </div>
							      </form>
							    </div>
							  </div>
							</div>
 							   
 							   

	
	<%
		List<UserBean> users = (List<UserBean>) request.getAttribute("users");
		Iterator<UserBean> it = users.iterator();
	%>
								
		 							<div class="table-responsive">
 									  <% String msg = (String) request.getAttribute("msg"); %>
					     				<% if (msg != null) { %>
 										 <div class="alert alert-warning"><%= msg %></div>
										<% } %>
    

<table class="table table-bordered table-hover table-striped align-middle" style="border: 2px solid #343a40;">
  <thead class="table-dark text-white" style="pointer-events: none;">
    <tr>
      <th>FirstName</th>
      <th>Email</th>
      <th>Action</th>
    </tr>
  </thead>
  <tbody>
    <%
    while (it.hasNext()) {
      UserBean user = it.next();
    %>
    
    <tr>
      <td><%= user.getFirstname() %></td>
      <td><%= user.getEmail() %></td>
      <td><a href="deleteuser?id=<%=user.getId()%>" class="btn btn-outline-danger btn-sm">Delete</a></td>
    </tr>
    <%
    }
    %>
  </tbody>
</table>


  							  </div>
  					 </div>
             
               </div>
                                   <%@ include file="AdminFooter.jsp" %>
               
        </div> 
</div>