<jsp:include page="./templates/header.jsp">
	<jsp:param name="title" value="Sign in"/>
</jsp:include>

<div class="container mx-auto auth relative">
<div class="auth-form">
    <h1>Welcome back</h1>
    <p>Welcome back! Please enter your details</p>
    <form action="/login" method="post">
    		<div class="${successMsg != null ? "validation bg-emerald-400" : ""}">
                <h4>${successMsg}</h4>
            </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-input" placeholder="username" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-input mb-3" placeholder="password" id="password" name="password" required>
                <span class="text-sm">
                    <a href="/findemail" class="text-slate-400 hover:text-emerald-400 transition">
                        Forgot password?
                    </a>
                </span>
            </div>
            <button type="submit" class="btn btn-primary mb-3 w-full">Sign in</button>
            <small class="text-slate-500 text-md text-center">Don't have an account? <a href="/register" class="text-primary hover:underline
                ">Sign up</a></small>
        </form>
    </div>
</div>
<div class="auth-img" style="background-image: url('images/bmwm8.jpg');"></div>