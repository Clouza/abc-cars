<jsp:include page="./templates/header.jsp">
	<jsp:param name="title" value="ABC Cars"/>
	<jsp:param name="navbarHome" value="true"/>
</jsp:include>
<section class="home">
    <div class="absolute left-0 right-0 bottom-0 top-0 overflow-hidden">
        <video autoplay muted loop>
            <source src="https://thumbs.gfycat.com/PersonalFormalAmericanpainthorse-mobile.mp4" type="video/mp4">
            Your browser does not support HTML video.
        </video>
    </div>
    <div class="container mx-auto home-hero">
        <div class="z-10">
            <h1>
                Help you to <br> sell your <br>
                <span class="bg-cars">
                    <div class="absolute top-0 w-full bottom-0 bg-emerald-400 z-[-1]"></div>
                    Cars
                </span>
            </h1>
            <p class="text-white">Create your first bid with ABC Cars</p>
            <a href="" class="btn btn-primary">Start bidding</a>
        </div>
    </div>
</section>

<div class="container mx-auto">
    <section class="text-center">
        <h2 class="text-2xl">The Suitable Aucation Cars <br> for you</h2>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum obcaecati pariatur ipsa odio modi
            asperiores sed deleniti praesentium animi enim!</p>
    </section>

    <section>
        <h2 class="text-2xl text-center">Featured Cars</h2>
        <div class="featured-cars">
            <div class="featured-card"
                style="background-image: url('https://images.unsplash.com/photo-1617814086906-d847a8bc6fca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1442&q=80');">
               <a href="#">Check it more</a>
           </div>
           <div class="featured-card"
               style="background-image: url('https://images.unsplash.com/photo-1594502184342-2e12f877aa73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80');">
               <a href="#">Check it more</a>
           </div>
           <div class="featured-card"
               style="background-image: url('https://images.unsplash.com/photo-1617788138017-80ad40651399?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80');">
                <a href="#">Check it more</a>
            </div>
        </div>
    </section>

    <section>
        <h2 class="text-2xl">Our <br> Collection</h2>
        <div class="categories">
            <a href="">Electric Car</a>
            <a href="">Coupé</a>
            <a href="">Van</a>
            <a href="">SUV</a>
            <a href="">Sedan</a>
            <a href="" class="btn btn-primary ml-auto">View All</a>
        </div>
    </section>
</div>
<jsp:include page="./templates/footer.jsp"/>