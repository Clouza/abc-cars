<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../templates/admin/header.jsp">
	<jsp:param name="title" value="List of Cars"/>
</jsp:include>

    <section>
         <table>
             <thead>
                 <th>#</th>
                 <th>Username</th>
                 <th>Email</th>
                 <!-- <th>Total Cars</th> -->
                 <th>Action</th>
             </thead>
             <tbody>
             	 <% int i = 1; %>
	             <c:forEach items="${users}" var="user">
	                 <tr>
	                     <td><%= i++ %></td>
	                     <td>${user.getUsername()}</td>
	                     <td>${user.getEmail()}</td>
	                     <!-- <td>user@as.com</td> -->
	                     <td>
	                     	<a href="user/${user.getUserId()}" class="text-blue-400 hover:text-blue-700">Edit</a>
	                     	<a href="user/delete/${user.getUserId()}" class="text-red-400 hover:text-red-700">Delete</a>
	                     </td>
	                 </tr>
				 </c:forEach>
             </tbody>
         </table>
    </section>

<jsp:include page="../templates/admin/footer.jsp"/>