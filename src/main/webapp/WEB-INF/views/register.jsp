<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="./templates/header.jsp">
	<jsp:param name="title" value="Sign up"/>
</jsp:include>
<div class="container mx-auto auth relative">
    <div class="auth-form">
        <h1>Create an Account</h1>
        <p>Start bidding by create an account first</p>
        <form:form modelAttribute="user" action="">
            <div class="flex gap-5">
                <div class="form-group">
                    <label for="email">Email</label>
                    <form:input type="email" class="form-input" placeholder="email" id="email" name="email" path="email" required="required"/>
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <form:input type="text" class="form-input" placeholder="username" id="username" name="username" path="username" required="required"/>
                </div>
            </div>
            <div class="flex gap-5">
                <div class="form-group">
                    <label for="password">Password</label>
                    <form:input type="password" class="form-input" placeholder="password" id="password" name="password" path="password" required="required"/>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" class="form-input" placeholder="re-password" id="confirmPassword" name="confirmPassword" required>
                </div>
            </div>

            <button type="submit" class="btn btn-primary mb-3 w-full">Create Account</button>
            <small class="text-slate-500 text-md text-center">Already have an account? <a href="/login" class="text-primary hover:underline">Sign in</a></small>
        </form:form>
    </div>
</div>
<div class="auth-img" style="background-image: url('https://i.ytimg.com/vi/EoE3EPeRuJc/maxresdefault.jpg');"></div>