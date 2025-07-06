<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Ingredient - What's Inside</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #eef2f7;">



	<jsp:include page="AdminSidebar.jsp"></jsp:include>


<div class="container mt-5">

    <div class="card shadow-lg rounded">
        <div class="card-header bg-primary text-white">
            <h3 class="mb-0">🌿 Add New Ingredient</h3>
        </div>
        <div class="card-body">
            <form action="saveIngredent" method="post">
                <!-- Ingredient Fields -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label class="form-label">Ingredient Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label">Scientific Name</label>
                        <input type="text" name="scientificName" class="form-control">
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Common Usage</label>
                    <input type="text" name="commonUsage" class="form-control">
                </div>

                <!-- Avoid By Checkboxes -->
                <div class="mb-3">
                    <label class="form-label">Avoided By (check applicable):</label>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="avoidBy" value="asthma patient">
                                <label class="form-check-label">Asthma Patient</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="avoidBy" value="diabetic patient">
                                <label class="form-check-label">Diabetic Patient</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="avoidBy" value="child">
                                <label class="form-check-label">Child</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="avoidBy" value="infant">
                                <label class="form-check-label">Infant</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="avoidBy" value="adult">
                                <label class="form-check-label">Adult</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="avoidBy" value="senior citizen">
                                <label class="form-check-label">Senior Citizen</label>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="avoidBy" value="pregnant woman">
                                <label class="form-check-label">Pregnant Woman</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="avoidBy" value="breastfeeding woman">
                                <label class="form-check-label">Breastfeeding Woman</label>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Regulatory Status -->
                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="form-label">FDA Status</label>
                        <input type="text" name="fda" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">FSSAI Status</label>
                        <input type="text" name="fssai" class="form-control">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">EFSA Status</label>
                        <input type="text" name="efsa" class="form-control">
                    </div>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-success">Save Ingredient</button>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
