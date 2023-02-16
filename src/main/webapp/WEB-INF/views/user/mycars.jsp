<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../templates/user/header.jsp">
	<jsp:param name="title" value="List of Cars"/>
</jsp:include>

    <section>
        <a href="postcar" class="btn btn-primary">Post a Car</a>
        
        <div class="flex flex-wrap gap-5 my-5">
	        <c:forEach items="${cars}" var="car">
	            <div class="mycars">
	                <div style="background-image: url('../../userImages/${car.getBanner()}');"></div>
	                <div>
                        <a href="/car/${car.getCarId()}" class="text-2xl hover:underline">${car.getName()}</a>
                        <div class="flex gap-4 my-4">
                            <a href="updatecar?carId=${car.getCarId()}" class="btn btn-primary">Update</a>
	                        <a href="deletecar/${car.getCarId()}" class="btn btn-outline-danger">Delete</a>
                        </div>
                    </div>
	            </div>
	        </c:forEach>
        </div>
    </section>

<jsp:include page="../templates/user/footer.jsp"/>