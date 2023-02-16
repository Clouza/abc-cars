<jsp:include page="../templates/header.jsp">
	<jsp:param name="title" value="List of Cars"/>
	<jsp:param name="offset" value="true"/>
</jsp:include>

 <div class="car-banner"
        style="background-image: url('../userImages/${car.getBanner()}');">
    <div class="banner-shadow"></div>
    <div class="container mx-auto cardetails">
        <div class="car-thumbnail"
            style="background-image: url('../userImages/${car.getBanner()}');">
        </div>
        <div class="car-info">
            <div class="flex items-center mb-3">
                <h2 class="text-3xl font-bold">${car.getName()}</h2>
                <a href="" class="btn btn-primary ml-auto">Start bidding</a>
            </div>
            <p class="mb-3">${car.getDescription()}</p>

            <div class="flex">
                <div class="border-r pr-5 mr-5">
                    <h4 class="text-xl font-[500]">Current Bid</h4>
                    <span class="flex gap-2">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                            stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M2.25 18.75a60.07 60.07 0 0115.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 013 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 00-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 01-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 003 15h-.75M15 10.5a3 3 0 11-6 0 3 3 0 016 0zm3 0h.008v.008H18V10.5zm-12 0h.008v.008H6V10.5z" />
                        </svg>
                        $299.392
                    </span>
                </div>
                <div>
                    <h4 class="text-xl font-[500]">Auction Ending In</h4>
                    <span class="flex gap-2">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                            stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 7.5v11.25m-18 0A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75m-18 0v-7.5A2.25 2.25 0 015.25 9h13.5A2.25 2.25 0 0121 11.25v7.5m-9-6h.008v.008H12v-.008zM12 15h.008v.008H12V15zm0 2.25h.008v.008H12v-.008zM9.75 15h.008v.008H9.75V15zm0 2.25h.008v.008H9.75v-.008zM7.5 15h.008v.008H7.5V15zm0 2.25h.008v.008H7.5v-.008zm6.75-4.5h.008v.008h-.008v-.008zm0 2.25h.008v.008h-.008V15zm0 2.25h.008v.008h-.008v-.008zm2.25-4.5h.008v.008H16.5v-.008zm0 2.25h.008v.008H16.5V15z" />
                        </svg>
                        31 February, 2023
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container mx-auto">
    <h2 class="text-3xl font-bold uppercase tracking-widest mb-3">Car & Seller Information</h2>

    <div class="grid grid-cols-2 gap-20 mb-10">
        <table class="table-auto">
            <tr>
                <th>Make</th>
                <td>${car.getMake()}</td>
                <th>Model</th>
                <td>${car.getMake()}</td>
            </tr>
            <tr>
                <th>Registration</th>
                <td>${car.getRegistration()}</td>
                <th>Price</th>
                <td>$ ${car.getPrice()}</td>
            </tr>
        </table>

        <div class="seller-information">
            <div class="profile-card-cardetails"
                style="background-image: url('https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=2000&q=60');">
            </div>
            <div>
                <h3>${user.getUsername()}</h3>
                <!-- <span>Status: <span class="text-red-400">Offline</span></span> -->
                <div class="flex gap-3">
                    <a href="">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                            stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
                        </svg>
                    </a>
                    <a href="">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                            stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round"
                                d="M8.625 12a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H8.25m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H12m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0h-.375M21 12c0 4.556-4.03 8.25-9 8.25a9.764 9.764 0 01-2.555-.337A5.972 5.972 0 015.41 20.97a5.969 5.969 0 01-.474-.065 4.48 4.48 0 00.978-2.025c.09-.457-.133-.901-.467-1.226C3.93 16.178 3 14.189 3 12c0-4.556 4.03-8.25 9-8.25s9 3.694 9 8.25z" />
                        </svg>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <hr class="py-4">

    <h2 class="text-3xl font-bold uppercase tracking-widest mb-3">Gallery</h2>

    <div class="gallery mb-10">
       <!--  <img src="https://images.unsplash.com/photo-1583121274602-3e2820c69888?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2Fyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=2000&q=60"
            alt="">
        <img src="https://images.unsplash.com/photo-1592198084033-aade902d1aae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmVycmFyaXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=2000&q=60"
            alt="">
        <img src="https://images.unsplash.com/photo-1610847499832-918a1c3c6811?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZmVycmFyaXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=2000&q=60"
            alt="">
        <img src="https://images.unsplash.com/photo-1535360392524-dedff4c8b227?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
            alt="">
        <img src="https://images.unsplash.com/photo-1621638421911-2414b151164e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"
            alt="">
        <img src="https://images.unsplash.com/photo-1597687168547-2640e6a1b6ee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZlcnJhcml8ZW58MHx8MHx8&auto=format&fit=crop&w=2000&q=60"
            alt=""> -->
    </div>
</div>

<jsp:include page="../templates/footer.jsp"/>