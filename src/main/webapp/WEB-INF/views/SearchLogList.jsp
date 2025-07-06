<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.SearchLogBean"%>



<!-- Begin Page Content -->
<div id="wrapper">
	
	<jsp:include page="AdminSidebar.jsp"></jsp:include>
       
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            
            <!-- Main Content -->
            <div id="content">
            
               <jsp:include page="AdminNavbar.jsp"></jsp:include>

							


									
							  <div class="container mt-5">
 							   <h2 class="mb-4 text-center">Search Log Ingredient List</h2>
 							   
 				
 							   
 							   
 							   
 									 <%
 									    List<SearchLogBean> ingred = (List<SearchLogBean>) request.getAttribute("searchloglist");
 									    Iterator<SearchLogBean> it = ingred.iterator();
 									  %>
								
    

<table class="table table-bordered table-hover table-striped align-middle" style="border: 2px solid #343a40;">
  <thead class="table-dark text-white" style="pointer-events: none;">
    <tr>
											<th>Search id</th>
											<th>Search Name (INS Code)</th>
											<th>User Name</th>
											<th>Action</th>
											
</tr>
  </thead>
  <tbody>
    <%
      while (it.hasNext()) {
    	  SearchLogBean ib = it.next();
    %>
    <tr style="border: 1px solid #343a40;" class="text-dark bg-light">
      <td><%=ib.getSearchId()%></td>
	  <td><%=ib.getName()%></td>
	  <td><%=ib.getFirstName()%></td>
      <td><a href="fetch?name=<%=ib.getName()%>">Fetch</a></td>
    </tr>
    <%
      }
    %>
  </tbody>
</table>


  							  </div>
  					 </div>
                                   <%@ include file="AdminFooter.jsp" %>
             
               </div>
               
        </div> 



