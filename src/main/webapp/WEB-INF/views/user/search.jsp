<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../templates/header.jsp">
	<jsp:param name="title" value="List of Cars"/>
</jsp:include>

<div class="container mx-auto pt-10">
   <div class="listcars">
       <div class="filter">
           <form action="/search" class="filter-form">
               <button type="submit" class="btn btn-outline-primary mb-3">Set filter</button>
               <input type="text" placeholder="Search by name" name="n" value="<%= request.getParameter("n") %>">
               <input type="text" placeholder="Search by registration" name="r" value="<%= request.getParameter("r") %>">
               
               <div class="form-group">
	               <label for="year">Year</label>
	               <select id="year" name="y">
			            <c:forEach begin="0" end="100" var="val">
			                <c:set var="decr" value="${2023 - val}"/>
			                <option value="${decr}" ${birthYear == decr ? "selected='selected'": ''}>${decr}</option>
			            </c:forEach>
				   </select>
               </div>
               
               <div class="form-group">
                   <input type="range" min="1000" max="10000" name="pr" value="<%= request.getParameter("pr") %>">
                   <small>1000$ - 10000$+</small>
               </div>

               <hr class="mb-3">

				<div class="form-group">
                   <label for="make">Make</label>
                   <select name="mk" id="make">
                       <option value="">-- Select Make --</option>
                   </select>
               </div>

               <div class="form-group">
                   <label for="model">Model</label>
                   <select name="md" id="model">
                       <option value="">-- Select Model --</option>
                   </select>
               </div>
           </form>
       </div>
       <div class="cars">
	       <c:forEach items="${cars}" var="car">
	           <div class="cars-card mb-3">
	               <div style="background-image: url('userImages/${car.getBanner()}');">
	                    <span>Find similar car</span>
	                    <a href="/search?n=&r=&y=${car.getYear()}&pr=${car.getPrice()}&mk=${car.getMake()}&md=">Find similar car</a>
	                </div>
	                <div class="cars-card-content">
	                    <h2>${car.getName()}</h2>
	                    <div class="flex border-2 p-5 rounded-md hover:border-emerald-400 transition">
	                        <div class="border-r pr-5 mr-5">
	                            <h4>Current Bid</h4>
	                            <span class="flex gap-2">
	                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
	                                    stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
	                                    <path stroke-linecap="round" stroke-linejoin="round"
	                                        d="M2.25 18.75a60.07 60.07 0 0115.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 013 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 00-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 01-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 003 15h-.75M15 10.5a3 3 0 11-6 0 3 3 0 016 0zm3 0h.008v.008H18V10.5zm-12 0h.008v.008H6V10.5z" />
	                                </svg>
	                                $299.392
	                            </span>
	                        </div>
	                        <div>
	                            <h4>Auction Ending In</h4>
	                            <span class="flex gap-2">
	                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
	                                    stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
	                                    <path stroke-linecap="round" stroke-linejoin="round"
	                                        d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 7.5v11.25m-18 0A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75m-18 0v-7.5A2.25 2.25 0 015.25 9h13.5A2.25 2.25 0 0121 11.25v7.5m-9-6h.008v.008H12v-.008zM12 15h.008v.008H12V15zm0 2.25h.008v.008H12v-.008zM9.75 15h.008v.008H9.75V15zm0 2.25h.008v.008H9.75v-.008zM7.5 15h.008v.008H7.5V15zm0 2.25h.008v.008H7.5v-.008zm6.75-4.5h.008v.008h-.008v-.008zm0 2.25h.008v.008h-.008V15zm0 2.25h.008v.008h-.008v-.008zm2.25-4.5h.008v.008H16.5v-.008zm0 2.25h.008v.008H16.5V15z" />
	                                </svg>
	                                31 February, 2023
	                            </span>
	                        </div>
	                    </div>
	                    <div class="mt-5">
	                        <a href="/car/${car.getCarId()}" class="btn btn-outline-primary">View Car</a>
	                        <a href="" class="btn btn-primary">Place a Bid</a>
	                    </div>
	                </div>
	            </div>
			</c:forEach>
			<h1>${carsMessage}</h1>
        </div>
    </div>
</div>
<jsp:include page="../templates/footer.jsp"/>