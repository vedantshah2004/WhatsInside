<%@page import="com.bean.IngredentsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  IngredentsBean ingredent = (IngredentsBean) request.getAttribute("ingredent");
%>



<!-- Begin Page Content -->
<div id="wrapper">
	<jsp:include page="AdminSidebar.jsp"></jsp:include>


        	<!-- Content Wrapper -->
        	<div id="content-wrapper" class="d-flex flex-column">

            		<!-- Main Content -->
            		<div id="content">
               						<jsp:include page="AdminNavbar.jsp"></jsp:include>
               
               												<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card shadow-lg">
        <div class="card-header bg-primary text-white text-center">
          <h3>Ingredient Details</h3>
        </div>
        <div class="card-body">
          <dl class="row">
            <dt class="col-sm-4">Name</dt>
            <dd class="col-sm-8"><%= ingredent.getName() %></dd>

            <dt class="col-sm-4">Scientific Name</dt>
            <dd class="col-sm-8"><%= ingredent.getScientificName() %></dd>

            <dt class="col-sm-4">Common Usage</dt>
            <dd class="col-sm-8"><%= ingredent.getCommonUsage() %></dd>

            <dt class="col-sm-4">Avoid By</dt>
            <dd class="col-sm-8"><%= ingredent.getAvoidBy() %></dd>

            <dt class="col-sm-4">FDA</dt>
            <dd class="col-sm-8"><%= ingredent.getFda() %></dd>

            <dt class="col-sm-4">FSSAI</dt>
            <dd class="col-sm-8"><%= ingredent.getFssai() %></dd>

            <dt class="col-sm-4">EFSA</dt>
            <dd class="col-sm-8"><%= ingredent.getEfsa() %></dd>
          </dl>
        </div>
        <div class="card-footer text-center">
          <a href="listingredients" class="btn btn-secondary">Back to List</a>
        </div>
      </div>
    </div>
  </div>
</div>
               												
               
                              
               
                              
                    </div>
                    <%@ include file="AdminFooter.jsp" %>
                    
           </div>
           
</div>
               





