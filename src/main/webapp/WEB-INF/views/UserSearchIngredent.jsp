<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.IngredentsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Begin Page Content -->
<div id="wrapper">
	
	<jsp:include page="UserSidebar.jsp"></jsp:include>
       
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            
            <!-- Main Content -->
            <div id="content">
            
               <jsp:include page="UserNavbar.jsp"></jsp:include>

							


									
							  <div class="container mt-5">
 							   <h2 class="mb-4 text-center">Ingredient List</h2>
 							   
 							       <!-- 🔍 Search Form -->
							<div class="container">
							  <div class="row justify-content-center">
							    <div class="col-md-6">
							      <form action="usersearchingredient" method="post" class="mb-4">
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
    List<IngredentsBean> ingred = (List<IngredentsBean>) request.getAttribute("ingred");
    if (ingred != null && !ingred.isEmpty()) {
        Iterator<IngredentsBean> it = ingred.iterator();
%>
    <table class="table table-bordered table-hover table-striped align-middle" style="border: 2px solid #343a40;">
        <thead class="table-dark text-white" style="pointer-events: none;">
            <tr>
                <th>Name</th>
                <th>Scientific Name</th>
                <th>Common Usage</th>
                <th colspan="3" class="text-center">Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            while (it.hasNext()) {
                IngredentsBean ibean = it.next();
        %>
            <tr style="border: 1px solid #343a40;" class="text-dark bg-light">
                <td><%= ibean.getName() %></td>
                <td><%= ibean.getScientificName() %></td>
                <td><%= ibean.getCommonUsage() %></td>
                <td>
                    <a href="viewingredients?ingredientId=<%= ibean.getIngredientId() %>" class="btn btn-outline-primary">View</a>
                </td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
<%
    } else {
        String error = (String) request.getAttribute("error");
        if (error != null) {
%>
        <div class="alert alert-warning"><%= error %></div>
<%
        }
    }
%>



  							  </div>
  					 </div>
                                   <%@ include file="UserFooter.jsp" %>
             
               </div>
               
        </div> 



