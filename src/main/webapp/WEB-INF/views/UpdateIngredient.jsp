<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bean.IngredentsBean" %>
<%
    IngredentsBean ibean = (IngredentsBean) request.getAttribute("ingredent");
    String[] avoidByArray = ibean.getAvoidBy() != null ? ibean.getAvoidBy().split(",") : new String[0];
    java.util.List<String> avoidList = java.util.Arrays.asList(avoidByArray);
%>

<div id="wrapper">

    <jsp:include page="AdminSidebar.jsp" />

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <jsp:include page="AdminNavbar.jsp" />

            <div class="container-fluid mt-4">
                <div class="row justify-content-center">
                    <div class="col-lg-8">

                        <!-- Card -->
                        <div class="card shadow-lg border-0">
                            <div class="card-header bg-warning text-dark">
                                <h4 class="mb-0">✏️ Update Ingredient</h4>
                            </div>

                            <div class="card-body">
                                <form action="updateingredientdata" method="post">
                                    <input type="hidden" name="ingredientId" value="<%= ibean.getIngredientId() %>" />

                                    <!-- Fields -->
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <label class="form-label">Ingredient Name</label>
                                            <input type="text" name="name" class="form-control" value="<%= ibean.getName() %>" required>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label">Scientific Name</label>
                                            <input type="text" name="scientificName" class="form-control" value="<%= ibean.getScientificName() %>">
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Common Usage</label>
                                        <input type="text" name="commonUsage" class="form-control" value="<%= ibean.getCommonUsage() %>">
                                    </div>

                                    <!-- Avoid By -->
                                    <div class="mb-3">
                                        <label class="form-label fw-bold">Avoided By (select all that apply):</label>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="avoidBy" value="asthma patient" id="asthma"
                                                        <%= avoidList.contains("asthma patient") ? "checked" : "" %> >
                                                    <label class="form-check-label" for="asthma">Asthma Patient</label>
                                                </div>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="avoidBy" value="diabetic patient" id="diabetic"
                                                        <%= avoidList.contains("diabetic patient") ? "checked" : "" %> >
                                                    <label class="form-check-label" for="diabetic">Diabetic Patient</label>
                                                </div>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="avoidBy" value="child" id="child"
                                                        <%= avoidList.contains("child") ? "checked" : "" %> >
                                                    <label class="form-check-label" for="child">Child</label>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="avoidBy" value="infant" id="infant"
                                                        <%= avoidList.contains("infant") ? "checked" : "" %> >
                                                    <label class="form-check-label" for="infant">Infant</label>
                                                </div>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="avoidBy" value="adult" id="adult"
                                                        <%= avoidList.contains("adult") ? "checked" : "" %> >
                                                    <label class="form-check-label" for="adult">Adult</label>
                                                </div>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="avoidBy" value="senior citizen" id="senior"
                                                        <%= avoidList.contains("senior citizen") ? "checked" : "" %> >
                                                    <label class="form-check-label" for="senior">Senior Citizen</label>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="avoidBy" value="pregnant woman" id="pregnant"
                                                        <%= avoidList.contains("pregnant woman") ? "checked" : "" %> >
                                                    <label class="form-check-label" for="pregnant">Pregnant Woman</label>
                                                </div>
                                                <div class="form-check mb-2">
                                                    <input class="form-check-input" type="checkbox" name="avoidBy" value="breastfeeding woman" id="breastfeeding"
                                                        <%= avoidList.contains("breastfeeding woman") ? "checked" : "" %> >
                                                    <label class="form-check-label" for="breastfeeding">Breastfeeding Woman</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Regulatory Status -->
                                    <div class="row mb-3">
                                        <div class="col-md-4">
                                            <label class="form-label">FDA Status</label>
                                            <input type="text" name="fda" class="form-control" value="<%= ibean.getFda() %>">
                                        </div>
                                        <div class="col-md-4">
                                            <label class="form-label">FSSAI Status</label>
                                            <input type="text" name="fssai" class="form-control" value="<%= ibean.getFssai() %>">
                                        </div>
                                        <div class="col-md-4">
                                            <label class="form-label">EFSA Status</label>
                                            <input type="text" name="efsa" class="form-control" value="<%= ibean.getEfsa() %>">
                                        </div>
                                    </div>

                                    <!-- Submit -->
                                    <div class="text-end">
                                        <button type="submit" class="btn btn-warning px-4 text-dark fw-bold">
                                            💾 Update Ingredient
                                        </button>
                                        <a href="listingredients" class="btn btn-secondary ms-2">Cancel</a>
                                    </div>

                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <%@ include file="AdminFooter.jsp" %>
        </div>
    </div>
</div>
