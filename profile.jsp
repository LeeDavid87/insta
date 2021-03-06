<%-- 
    Document   : profile
    Created on : Mar 24, 2016, 1:49:36 PM
    Author     : David
--%>

<%@ page import="instagram.Constants" %>

<%@ page import="org.jinstagram.Instagram" %>

<%@ page import="org.jinstagram.entity.users.basicinfo.UserInfoData" %>


<%

    Object objInstagram = session.getAttribute(Constants.INSTAGRAM_OBJECT);

    Instagram instagram = null;

    if (objInstagram != null) {
        instagram = (Instagram) objInstagram;
    } else {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">jInstagram</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="profile.jsp">Profile</a></li>
                <li><a href="#">Gallery</a></li>
                <li><a href="#">Popular</a></li>
                <li><a href="search.jsp">Search</a></li>
                <li><a href="#">Logout</a></li>

            </ul>
        </div>
    </div>
    <!-- /.container -->
</nav>

<!-- Page Content -->
<div class="container">

    <div class="row">
        <a href="https://api.instagram.com/v1/users/458131440/media/recent/?client_id=cb8f2beb45ae42958d3105c17edc95b9&access_token=${access.getToken()}">Click me</a>
        <div class="col-lg-12">
            <h1 class="page-header">User Profile</h1>
        </div>
        <% UserInfoData userInfoData = instagram.getCurrentUserInfo().getData();         %>
        <p class="lead">

            <img src="<%= userInfoData.getProfilePicture() %>"/> <br/>

        <p>Username : <%=userInfoData.getUsername()%>
        </p>

        <p>Full Name : <%=userInfoData.getFullName()%>
        </p>

        <p>Bio : <%=userInfoData.getBio()%>
        </p>

        <p>Website : <%=userInfoData.getWebsite()%>
        </p>

        <p>Follows : <%=userInfoData.getCounts().getFollows()%>
        </p>

        <p>Followed By : <%=userInfoData.getCounts().getFollowedBy()%>
        </p>

        <p>Media Count : <%=userInfoData.getCounts().getMedia()%>
        </p>
        </p>


    </div>

    <hr>
    </body>
</html>







