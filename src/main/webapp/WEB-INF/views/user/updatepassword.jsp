<jsp:include page="../templates/user/header.jsp">
	<jsp:param name="title" value="List of Cars"/>
</jsp:include>

    <section>
        <form action="" method="post">
             <div class="form-group">
                 <label for="password">New Password</label>
                 <input type="password" class="form-input" name="password" required>
             </div>
             <button type="submit" class="btn btn-primary">Update Password</button>
         </form>
    </section>

<jsp:include page="../templates/user/footer.jsp"/>