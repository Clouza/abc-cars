<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../templates/admin/header.jsp">
	<jsp:param name="title" value="List of Cars"/>
</jsp:include>

    <section>
         <div class="settings">
            <div class="flex gap-5">
                <div class="profile-setting" style="background-image: url('https://images.unsplash.com/photo-1569173112611-52a7cd38bea9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60');"></div>
                <div class="mb-6">
                    <h2 class="text-2xl font-bold">${user.getUsername()}</h2>
                    <p>Total Auction: 0</p>
                </div>
            </div>

            <form action="" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-input" value="${user.getUsername()}" name="username" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-input" value="${user.getEmail()}" name="email" required>
                </div>
                <div class="form-group">
                    <label for="role">Role</label>
                    <select name="role" id="role">
                    	<c:forEach items="${roles}" var="role">
                    		<option value="${role.getRoleId()}" ${userRole == String.valueOf(role.getRoleId()) ? "selected" : ""}>${role.getRoleName()}</option>
						</c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-outline-primary">Update user</button>
            </form>
        </div>
    </section>

<jsp:include page="../templates/admin/footer.jsp"/>