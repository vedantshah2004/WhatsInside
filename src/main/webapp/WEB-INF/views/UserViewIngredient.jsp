<%@page import="com.bean.IngredentsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  IngredentsBean ingredent = (IngredentsBean) request.getAttribute("ingred");
%>

<div id="wrapper">
  <jsp:include page="UserSidebar.jsp"></jsp:include>

  <div id="content-wrapper" class="d-flex flex-column">
    <div id="content">
      <jsp:include page="UserNavbar.jsp"></jsp:include>

      <style>
        .fade-seq {
          opacity: 0;
          transform: translateY(10px);
          animation: fadeInUp 0.6s ease forwards;
        }

        @keyframes fadeInUp {
          to {
            opacity: 1;
            transform: translateY(0);
          }
        }

        .delay-1 { animation-delay: 0.2s; }
        .delay-2 { animation-delay: 0.4s; }
        .delay-3 { animation-delay: 0.6s; }
        .delay-4 { animation-delay: 0.8s; }
        .delay-5 { animation-delay: 1.0s; }
        .delay-6 { animation-delay: 1.2s; }
        .delay-7 { animation-delay: 1.4s; }

        .card-header {
          background: linear-gradient(45deg, #007bff, #6610f2);
        }

        .card-footer a.btn:hover {
          background-color: #0056b3;
          transform: scale(1.05);
        }

        .card-footer a.btn {
          transition: 0.3s ease;
        }

        dl dt, dl dd {
          padding: 6px 0;
        }
      </style>

      <div class="container py-5">
        <div class="row justify-content-center">
          <div class="col-md-8">
            <div class="card shadow-lg">
              <div class="card-header text-white text-center">
                <h3>Ingredient Details</h3>
              </div>
              <div class="card-body">
                <dl class="row">
                  <dt class="col-sm-4 fade-seq delay-1">Name</dt>
                  <dd class="col-sm-8 fade-seq delay-1"><%= ingredent.getName() %></dd>

                  <dt class="col-sm-4 fade-seq delay-2">Scientific Name</dt>
                  <dd class="col-sm-8 fade-seq delay-2"><%= ingredent.getScientificName() %></dd>

                  <dt class="col-sm-4 fade-seq delay-3">Common Usage</dt>
                  <dd class="col-sm-8 fade-seq delay-3"><%= ingredent.getCommonUsage() %></dd>

                  <dt class="col-sm-4 fade-seq delay-4">Avoid By</dt>
                  <dd class="col-sm-8 fade-seq delay-4"><%= ingredent.getAvoidBy() %></dd>

                  <dt class="col-sm-4 fade-seq delay-5">FDA</dt>
                  <dd class="col-sm-8 fade-seq delay-5"><%= ingredent.getFda() %></dd>

                  <dt class="col-sm-4 fade-seq delay-6">FSSAI</dt>
                  <dd class="col-sm-8 fade-seq delay-6"><%= ingredent.getFssai() %></dd>

                  <dt class="col-sm-4 fade-seq delay-7">EFSA</dt>
                  <dd class="col-sm-8 fade-seq delay-7"><%= ingredent.getEfsa() %></dd>
                </dl>
              </div>
              <div class="card-footer text-center">
                <a href="search" class="btn btn-secondary">⬅ Back to Search</a>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
    <%@ include file="UserFooter.jsp" %>
  </div>
</div>

