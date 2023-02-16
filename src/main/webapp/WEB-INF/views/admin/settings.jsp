<jsp:include page="../templates/admin/header.jsp" />

    <section>
         <div class="settings">
            <div class="flex gap-5">
                <div class="profile-setting" style="background-image: url('https://images.unsplash.com/photo-1569173112611-52a7cd38bea9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60');"></div>
                <div class="mb-6">
                    <h2 class="text-2xl font-bold">${user.getUsername()}</h2>
                    <p>Total Auction: 0</p>
                    <div class="flex gap-4">
                        <a href="updatepassword" class="text-emerald-500 hover:text-emerald-700 text-sm transition">Update
                            Password</a>
                    </div>
                </div>
            </div>

            <form action="" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-input" value="${user.getUsername()}" name="username" disabled>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-input" value="${user.getEmail()}" name="email">
                </div>
                <button type="submit" class="btn btn-primary">Save settings</button>
            </form>
        </div>
    </section>

<jsp:include page="../templates/admin/footer.jsp"/>