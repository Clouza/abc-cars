<jsp:include page="./templates/header.jsp">
	<jsp:param name="title" value="Forgot Password"/>
</jsp:include>

<div class="container mx-auto auth relative">
<div class="auth-form">
    <form action="/findemail" method="post">
	    	<div class="${errMsg != null ? "validation bg-red-400" : ""}">
                <h4>${errMsg}</h4>
            </div>	
	      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	      <div class="form-group">
	          <label for="email">Email</label>
	          <input type="email" class="form-input mb-3" placeholder="Your email" id="email" name="email" required>
	      </div>
	      <button type="submit" class="btn btn-primary mb-3 w-full">Continue</button>
     </form>
</div>
</div>
<div class="auth-img" style="background-image: url('images/bmwm8.jpg');"></div>