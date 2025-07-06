<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bean.IngredentsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Ingredient List</title>
  <!-- Bootstrap CSS CDN -->
  <!-- Bootstrap Icons CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">
  <div class="container mt-5">
    <h2 class="mb-4 text-center">Ingredient List</h2>

    <!-- 🔍 Search Form -->
   <form action="searchingredient" method="post" class="mb-4">
  <div class="input-group">
    <input type="text" name="name" class="form-control" placeholder="Search by Name or Scientific Name">
    <button class="btn btn-primary" type="submit">
      <i class="bi bi-search"></i> <!-- Bootstrap Search Icon -->
    </button>
  </div>
</form>


    <%
      List<IngredentsBean> ingred = (List<IngredentsBean>) request.getAttribute("ingred");
      Iterator<IngredentsBean> it = ingred.iterator();
    %>

    <div class="table-responsive">
    <% String msg = (String) request.getAttribute("msg"); %>
	<% if (msg != null) { %>
  	<div class="alert alert-warning"><%= msg %></div>
	<% } %>
    
    
      <table class="table table-bordered table-hover table-striped align-middle">
        <thead class="table-dark">
          <tr>
            <th>Name</th>
            <th>Scientific Name</th>
            <th>Common Usage</th>
            <th colspan="3" align="center">Action</th>
          </tr>
        </thead>
        <tbody>
          <%
            while (it.hasNext()) {
              IngredentsBean ibean = it.next();
          %>
          <tr>
            <td><%= ibean.getName() %></td>
            <td><%= ibean.getScientificName() %></td>
            <td><%= ibean.getCommonUsage() %></td>
            
            <td>
              <a href="viewingredients?ingredientId=<%= ibean.getIngredientId() %>" class="btn btn-primary">View</a>
            </td>
            
            <td>
              <a href="updateingredients?ingredientId=<%= ibean.getIngredientId() %>" class="btn btn-success">Update</a>
            </td>
            
            <td>
              <a href="deleteingredients?ingredientId=<%= ibean.getIngredientId() %>" class="btn btn-danger btn-sm">Delete</a>              
            </td>
          </tr>
          <%
            }
          %>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Bootstrap JS CDN -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

