<jsp:include page="./templates/header.jsp">
	<jsp:param name="title" value="ABC Cars"/>
</jsp:include>
<div class="container mx-auto flex flex-col items-center my-5">
    <h4>About us</h4>
    <h1 class="text-emerald-400">We're distributed team</h1>
    <p>We have teams all around the world</p>
    <img src="https://upload.wikimedia.org/wikipedia/commons/e/ec/World_map_%28blue_dots%29.svg" alt="">

    <div class="flex gap-5">
        <div class="text-center">
            <h3 class="text-xl font-bold">Support</h3>
            <p>Our friendly team is here to help</p>
            <a href="">support@abccars.com</a>
        </div>

        <div class="text-center">
            <h3 class="text-xl font-bold">Sales</h3>
            <p>Question or queries? Get in touch</p>
            <a href="">Contact us</a>
        </div>
    </div>
</div>
<jsp:include page="./templates/footer.jsp"/>