<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Whats Inside</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form class="user" action="saveuser" method="post">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                            placeholder="First Name" name="firstname">
                                            <span class="text-danger">
                        	${result.getFieldError("firstname").getDefaultMessage()}
                        </span>
                                            
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"
                                            placeholder="Last Name" name="lastname">
                                            <span class="text-danger">
                        	${result.getFieldError("lastname").getDefaultMessage()}
                        </span>
                                            
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                        placeholder="Email Address" name="email">
                                        <span class="text-danger">
                        					${result.getFieldError("email").getDefaultMessage()}
                        				</span>
                                        
                                </div>
                                
                               
						<div class="form-group">
   							 <label for="gender" class="form-label">Gender</label>
   								 <select name="gender" id="gender" class="form-select py-2 px-3 rounded-pill text-muted">
       								 <option value="">-- Select --</option>
       								 <option value="Male">Male</option>
       								 <option value="Female" >Female</option>
       								 <option value="Other">Other</option>
    								</select>
    								<span class="text-danger">
    								    ${result.getFieldError("gender").getDefaultMessage()}
    								</span>
						</div>


                               
                                
                                
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user "
                                            id="exampleInputPassword" placeholder="Password" name="password">
                                          
                                    </div>
                                     <span class="text-danger">
                        	${result.getFieldError("password").getDefaultMessage()}
                        </span>
                                    
                                    
                                 
                                </div>
                                
                                
                                
                                
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user "
                                            placeholder="Contactno" name="contactNo">
                                          
                                    </div>
                                </div>
                                
                                
                                
                                
                                
                                
                               
                               
                               
                                <button href="login" class="btn btn-primary btn-user btn-block">
                                    Register Account
                                </button>
                               
                            </form>
                            <hr>
                           
                            <div class="text-center">
                                <a class="small" href="login">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>
