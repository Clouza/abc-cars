<jsp:include page="./templates/header.jsp">
	<jsp:param name="title" value="ABC Cars"/>
</jsp:include>
<div class="container mx-auto my-5">
    <h1>Get in Touch</h1>
    <p>We want to hear from you. Let us know how we can help</p>

    <form action="">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-input" placeholder="ex, John Doe" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-input" placeholder="Email Address" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="subject">Subject</label>
            <input type="text" class="form-input" placeholder="Subject" id="subject" name="subject" required>
        </div>
        <div class="form-group">
            <label for="message">Message</label>
            <textarea name="message" id="message" cols="30" rows="10" placeholder="Type a Message" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Send</button>
    </form>
</div>
<jsp:include page="./templates/footer.jsp"/>