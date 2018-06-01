<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Space</title>


    <!-- Internal game scripts/styles, mostly boring stuff 
    <script src="/static/game-frame.js"></script> -->
    <link rel="stylesheet" href="comments-style.css" />

    <!-- This is our database of messages -->
    <script src="post-store.js"></script>
  
    <script>
      var defaultMessage = "Welcome!<br><br>This is your <i>personal</i>"
        + " stream. You can post anything you want here, especially "
        + "<span style='color: #f00ba7'>madness</span>.";

      var DB = new PostDB(defaultMessage);

      function displayPosts() {
        var containerEl = document.getElementById("post-container");
        containerEl.innerHTML = "";

        var posts = DB.getPosts();
        for (var i=0; i<posts.length; i++) {
          var html = '<table class="message"> <tr> <td valign=top '
            + ' class="message-container"> <div class="shim"></div>';

          html += '<b>You</b>';          
          html += '<span class="date">' + new Date(posts[i].date) + '</span>';
          html += "<blockquote>" + posts[i].message + "</blockquote";
          html += "</td></tr></table>"
          containerEl.innerHTML += html; 
        }
      }

      window.onload = function() { 
        document.getElementById('clear-form').onsubmit = function() {
          DB.clear(function() { displayPosts() });
          return false;
        }

        document.getElementById('post-form').onsubmit = function() {
          var message = document.getElementById('post-content').value;
          DB.save(message, function() { displayPosts() } );
          document.getElementById('post-content').value = "";
          return false;
        }

        displayPosts();
      }

    </script>
<h1>http://projectwownow.blogspot.co.il/2008/08/javascript-simple-image-slideshow.html</h1>
<script type="text/javascript">

    var imageFiles=[];
    var imageIndex=0;

    function imageSwitch(i,d)
    {
      imageIndex += d;
      if(imageIndex >= imageFiles.length){imageIndex=0;}
      else if(imageIndex < 0){imageIndex=imageFiles.length-1}
      i.src = imageFiles[imageIndex].src;
    }

    function imagePreload()
    {
      for(i=0; i<arguments.length; i++)
      {
        imageFiles[imageFiles.length]=new Image();
        imageFiles[imageFiles.length-1].src=arguments[i];
      }
    }

    imagePreload('images.jpg'/* ,'list.jpg','of.jpg','images.jpg','goes.jpg','here.jpg' */);


  </script>
  <link rel="stylesheet" href="styles.css">
</head>
<body id="level2">
<div class="container">
<div class="toppane">
<td>Hello  </td>
<td><input type="text" value="<%= session.getAttribute("username") %>" /></td>
</div>
 <div class="leftpane" align="center">
    <h1>My Space</h1>
    <h3>Upload your picture  - http://www.technicalkeeda.com/java-tutorials/write-image-into-mysql-database-using-java; https://javatutorial.net/java-file-upload-rest-service https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/file</h3>
    Choose file to upload<br>
<form action="http://localhost:8088/MyVulnerableWebSite/api/pictures/upload" method="post" enctype="multipart/form-data">
	<input name="file" id="filename" type="file" /><br><br>
	<button name="submit" type="submit">Upload</button>
</form>
 <%-- <form action="api/pictures/upload" method="post" enctype="multipart/form-data">
    <input type="text" name="description" />
    <input type="file" name="file" />
    <input type="submit" />

	<%String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
    Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
    System.out.println(description);
    //String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
    //InputStream fileContent = filePart.getInputStream();
    %>
</form> --%>
    <!-- <input type="file" webkitdirectory directory multiple/> -->
</div>
<div class="middlepane">
 <h1>Gallery</h1>


  <br/><br/>
  <input type="button" value="Prev" onClick="imageSwitch(document.getElementById('myImg'),-1);"/>
  <img id="myImg" src="image0.jpg"/>
  <input type="button" value="Next" onClick="imageSwitch(document.getElementById('myImg'),1);"/>
  <br/><br/>
 

</div>

<div class="rightpane">
    <div id="header"> 
      <div>Share your thoughts</div>
      <form action="?" id="clear-form">
        <input class="clear" type="submit" value="Clear all posts">
      </form>
    </div>

    <div id="post-container"></div>

    <table class="message">
      <tr>
        <td valign="top">
        </td>
        <td class="message-container">
          <div class="shim"></div>
          <form action="?" id="post-form">
            <textarea id="post-content" name="content" rows="2" 
              cols="50"></textarea>
            <input class="share" type="submit" value="Share status!">
            <input type="hidden" name="action" value="sign">
          </form>
        </td>
      </tr>
    </table>

</div>
</div>





</body>
</html>
