<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/views/layout.jsp" charEncoding="UTF-8">
    <c:param name="title" value="Home - User Directory" />
    <c:param name="body">
		<h1>
			About
		</h1>	
		<h2>
		Description
		</h2>
		<h3>Bootstrapping</h3>
		<p>Class Initializer that implements WebApplicationInitializer interface is used to bootstrap application
		without web.xml configuration. Such classes are searched for and instantiated (bootstrapped) by SpringServletContainerInitializer, 
		which itself is bootstrapped automatically by any Servlet 3.0 container.</p>
		<h3>Annotation configuration</h3>
		<p>@Configuration annotated classes are used to replace *-config.xml dispatcher servlet configuration.</p>
		<h3>@RestController</h3>
		<p>This application uses Spring MVC back-end, generated by @RestController</p>
		<h3>Persistence Entity</h3>
		<p>Hibernate is used as persistence provider. @Entity @Table @Column annotations are used to map Java class to database table.</p>
		<h3>JPA persistence and repositories</h3>
		<p>Customized Spring Repositories were used to implement CRUD operations, and also login/logout and search. No SQL queries were used.</p>
		<h3>CORS</h3>
		<p>Tomcat CORS was set up using Tomcat filter in Web.xml</p>		
		<h3>Spring</h3>
		<p>
			<ul>
			<li>@Component Indicates a auto scan component.</li>
			<li>@Repository Indicates DAO component in the persistence layer.</li>
			<li>@Service Indicates a Service component in the business layer.</li>
			<li>@Controller Indicates a controller component in the presentation layer.</li>
			</ul>
		</p>		
		<h3>Error handling</h3>
		<p>@ExceptionHandler(Exception.class) for controller-wide exception handling, return error object and status (400 or any) to client gracefully.</p>
		
		<h2>User levels</h2>
		<h3>User (level 0)</h3>
        <p>Can list and view users, nothing else</p>
        <h3>Power User (level 10)</h3>
        <p>Can create and edit users (of level User and Power User)</p>
        <h3>Admin (level 20)</h3>
        <p>Can also delete users (of level User, Power User and Admin)</p>
        <h3>Jedi (level 30)</h3>
        <p>Can do whatever he wants.</p>
				
		<h2>API endpoints</h2>		
		<h3>Login</h3>
		<h4>Request</h4>
		<p>
		POST /users/login HTTP/1.1 <br />
		Content-Type: application/x-www-form-urlencoded; charset=UTF-8 <br />
		<br />
		login=user&passwd=12345
		</p>
		
		<h4>Response</h4>
		<p>
		HTTP/1.1 200 OK<br />
		Content-Type: application/json;charset=UTF-8<br />
		<br />
		{"id":1,"login":"user","passwd":"12345","level":10,"securityToken":"1ae70298-bf89-408d-8682-f0f60c3a62c1","firstName":"John","lastName":"Smith"}
		</p>

		<h3>Get users</h3>		
		<h4>Request</h4>
		<p>
		GET /users HTTP/1.1	<br />
		x-token: 1ae70298-bf89-408d-8682-f0f60c3a62c1
		</p>
		<h4>Response</h4>
		<p>
		HTTP/1.1 200 OK <br />
		Content-Type: application/json;charset=UTF-8 <br />
		<br />
		[{"id":1,"login":"user","passwd":"12345","level":10,"securityToken":"1ae70298-bf89-408d-8682-f0f60c3a62c1","firstName":"John","lastName":"Smith"},<br />{"id":2,"login":"admin","passwd":"12345","level":20,"securityToken":"fd5e3239-c8da-4ee7-9fc5-1416000f3bf5","firstName":"Dan","lastName":"Dare"},<br />{"id":5,"login":"senior","passwd":"12345","level":10,"securityToken":"","firstName":"Aaron","lastName":"Baron"},<br />{"id":6,"login":"jedi","passwd":"12345","level":30,"securityToken":"","firstName":"Anakin","lastName":"Skywalker"}]
		</p>
		
		<h3>Get user</h3>		
		<h4>Request</h4>
		<p>
		GET /users/42 HTTP/1.1	<br />	
		x-token: 1ae70298-bf89-408d-8682-f0f60c3a62c1
		</p>
		<h4>Response</h4>
		<p>
		HTTP/1.1 200 OK <br />
		Content-Type: application/json;charset=UTF-8 <br />
		<br />
		{"id":42,"login":"theone","passwd":"12345","level":10,"securityToken":null,"firstName":"Neo","lastName":"One"}
		</p>
		
		<h3>Update user</h3>		
		<h4>Request</h4>
		<p>
		POST /users/42 HTTP/1.1<br />
		x-token: 1ae70298-bf89-408d-8682-f0f60c3a62c1<br />
		Content-Type: application/json;charset=UTF-8<br />
		<br />
		{"id":42,"login":"noone","passwd":"12345","level":"0","securityToken":null,"firstName":"No","lastName":"One"}
		</p>
		
		<h4>Response</h4>
		<p>
		HTTP/1.1 200 OK <br />
		Content-Type: application/json;charset=UTF-8 <br />
		<br />
		{"id":42,"login":"noone","passwd":"12345","level":0,"securityToken":null,"firstName":"No","lastName":"One"}
		</p>
		
		<h3>Delete user</h3>
		<h4>Request</h4>
		<p>
		DELETE /users/10 HTTP/1.1<br />
		x-token: 1ae70298-bf89-408d-8682-f0f60c3a62c1
		</p>		
		
		<h4>Response</h4>
		<p>
		HTTP/1.1 200 OK <br />
		Content-Type: application/json;charset=UTF-8<br />
		<br />
		{"id":10,"login":"beautiful","passwd":"12345","level":20,"securityToken":null,"firstName":"Test","lastName":"Test"}
		</p>
		
	</c:param>
</c:import>