<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Enter OTP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-lg rounded-4">
                <div class="card-header bg-info text-white text-center">
                    <h4>Verify OTP</h4>
                </div>
                <div class="card-body">
                    <form action="verifyotp" method="post">
                        <input type="hidden" name="email" value="${sessionScope.otpEmail}">
                        <div class="mb-3">
                            <label for="otp" class="form-label">Enter OTP</label>
                            <input type="number" class="form-control" id="otp" name="otp" required>
                        </div>
                        <button type="submit" class="btn btn-info w-100">Verify OTP</button>
                    </form>
                    <div class="mt-2 text-center text-danger">${error}</div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
