<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:include page="../templates/user/header.jsp">
	<jsp:param name="title" value="List of Cars"/>
</jsp:include>

    <section>
        <form:form modelAttribute="car" action="" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        	
        	<div class="form-group">
        		<label for="make">Make</label>
        		<form:input type="text" class="form-input" placeholder="ex, Toyota" id="make" name="make" path="make" required="required"/>
        	</div>
        	
        	<div class="form-group">
        		<label for="model">Model</label>
        		<form:input type="text" class="form-input" placeholder="Car Model" id="model" name="model" path="model" required="required"/>
        	</div>
        	
        	<div class="form-group">
        		<label for="name">Name</label>
        		<form:input type="text" class="form-input" placeholder="Car Name" id="name" name="name" path="name" required="required"/>
        	</div>
        	
        	<div class="form-group">
	            <label for="description">Description</label>
	            <form:textarea name="description" id="description" cols="30" rows="10" placeholder="Car Description" path="description" required="required"></form:textarea>
	        </div>
	        
	        <div class="form-group">
        		<label for="price">Price</label>
        		<form:input type="number" min="0" class="form-input" placeholder="$ price" id="price" name="price" path="price" required="required"/>
        	</div>
        	
        	<div class="form-group">
	            <label for="registration">Registration Number</label>
	            <form:input type="text" class="form-input" placeholder="ex, DK 00976 NJ" id="registration" name="reistration" path="registration" required="required"/>
	        </div>
	        
	        <div class="form-group">
	            <label for="year">Year</label>
	            <form:input type="text" class="form-input" placeholder="Car year" id="year" name="year" path="year" required="required"/>
	        </div>
	        
	        <div class="form-group">
	            <label for="images">Banner Image</label>
	            <input class="form-input" id="images" type="file" name="image" accept="image/png, image/jpeg" required="required"/>
	            <small class="mt-1 text-sm text-gray-500 dark:text-gray-300">PNG, JPG (max 2MB)</small>
	        </div>
	        
	        <button type="submit" class="btn btn-primary">Post</button>
        </form:form>
    </section>

<jsp:include page="../templates/user/footer.jsp"/>