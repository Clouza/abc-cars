<jsp:include page="./templates/header.jsp">
	<jsp:param name="title" value="Forgot Password"/>
</jsp:include>

<div class="container mx-auto auth relative">
<div class="auth-form">
    <h1>Update password</h1>
    <p>Forgot your password?</p>
    <form action="/forgotpassword" method="post">
    <input type=hidden name="email" value="${email}">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      <div class="form-group">
          <label for="password">New Password</label>
          <input type="password" class="form-input mb-3" placeholder="password" id="password" name="password" required>
      </div>
      <div class="form-group">
          <label for="confirmationPassword">New Password Confirmation</label>
          <input type="password" class="form-input mb-3" placeholder="Confirmation Password" id="confirmationPassword" name="confirmationPassword" required>
      </div>
      <button type="submit" class="btn btn-primary mb-3 w-full">Update Password</button>
     </form>
</div>
</div>
<div class="auth-img" style="background-image: url('images/bmwm8.jpg');"></div>