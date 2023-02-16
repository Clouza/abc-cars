<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../templates/admin/header.jsp" />
    <section>
        <div class="flex flex-wrap gap-5 my-5">
        	<c:if test="${!cars.isEmpty()}">
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
	        </c:if>
	        <c:if test="${cars.isEmpty()}">
	        	<h2>Cars Not Available</h2>
	        </c:if>
        </div>
    </section>

<jsp:include page="../templates/admin/footer.jsp"/>