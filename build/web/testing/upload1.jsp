<!DOCTYPE html>
<%@page  import="java.io.*,javax.servlet.http.*,javax.servlet.annotation.MultipartConfig" %>
<%






%>
<html>

<style>
    body {
        font-family: Arial, Helvetica, sans-serif;
    }
    
    html,
    body {
        width: 100%;
        height: 100%;
    }
    
    * {
        box-sizing: border-box
    }
    /* Full-width input fields */
    
    body {
        background-image: url("bg.jpg");
         /* Full height */
        height: 100%;
        /* Center and scale the image nicely */
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        background-attachment: fixed;
    }
    

    .maxl {
        margin: 25px;
    }
    
    .inline {
        display: inline-block;
    }
    
    .inline+.inline {
        margin-left: 10px;
    }
    
    .radio {
        color: white;
        font-size: 15px;
        position: relative;
    }
    
    .radio span {
        position: relative;
        padding-left: 20px;
    }
    
    .radio span:after {
        content: '';
        width: 15px;
        height: 15px;
        border: 3px solid;
        position: absolute;
        left: 0;
        top: 1px;
        border-radius: 100%;
        -ms-border-radius: 100%;
        -moz-border-radius: 100%;
        -webkit-border-radius: 100%;
        box-sizing: border-box;
        -ms-box-sizing: border-box;
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
    }
    
    .radio input[type="radio"] {
        cursor: pointer;
        position: absolute;
        width: 100%;
        height: 100%;
        z-index: 1;
        opacity: 0;
        filter: alpha(opacity=0);
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)"
    }
    
    .radio input[type="radio"]:checked+span {
        color: #0B8;
    }
    
    .radio input[type="radio"]:checked+span:before {
        content: '';
        width: 5px;
        height: 5px;
        position: absolute;
        background: #0B8;
        left: 5px;
        top: 6px;
        border-radius: 100%;
        -ms-border-radius: 100%;
        -moz-border-radius: 100%;
        -webkit-border-radius: 100%;
    }
    /* Set a style for all buttons */
    
    .button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
        opacity: 0.9;
    }
    
    .button:hover {
        opacity: 1;
    }
    /* Extra styles for the cancel button */
    /* Float cancel and signup buttons and add an equal width */
    
    .signupbtn {
        float: left;
        width: 50%;
    }
    /* Add padding to container elements */
    
    .container {
        padding: 16px;
    }
    /* The Modal (background) */
    
    .modal {
        display: none;
        /* Hidden by default */
        position: fixed;
        /* Stay in place */
        z-index: 1;
        /* Sit on top */
        left: 0;
        top: 0;
        width: 100%;
        /* Full width */
        height: 100%;
        /* Full height */
        overflow: auto;
        /* Enable scroll if needed */
        background-color: #474e5d;
        padding-top: 50px;
    }
    /* Modal Content/Box */
    
    .modal-content {
        /*background-color: #fefefe;*/
        background: rgba(0, 0, 0, 0.5);
        margin: 5% auto 15% auto;
        /* 5% from the top, 15% from the bottom and centered */
        border: 1px solid #888;
        width: 50%;
        /* Could be more or less, depending on screen size */
    }
    /* Style the horizontal ruler */
    
    hr {
        border: 1px solid #f1f1f1;
        margin-bottom: 25px;
    }
    /* The Close Button (x) */
    
    .close {
        position: absolute;
        right: 35px;
        top: 15px;
        font-size: 40px;
        font-weight: bold;
        color: #f1f1f1;
    }
    
    .close:hover,
    .close:focus {
        color: #f44336;
        cursor: pointer;
    }
    /* Clear floats */
    
    .clearfix::after {
        content: "";
        clear: both;
        display: table;
    }
    
    .checkboxgroup {
        width: 20em;
        overflow: auto;
    }
    
    .checkboxgroup p {
        width: 7em;
        text-align: right;
    }
    
    .checkboxgroup label {
        width: 12em;
        float: right;
    }
    /* Change styles for cancel button and signup button on extra small screens */
</style>

<body text="white">

        <script type="text/javascript">
            // assign onclick handler to hazard checkbox
    
            function inform()
            {
                alert("An email will be sent shortly to your ID with instructions on how to proceed");
            }
        </script>


    <h1 style="align-content: center">Upload PDFs</h1>
    <%
        if(request.getPart("file1")!=null)
        out.println("NOT NULL");
    %>
    <form method="post" action="multiPartServlet" enctype="multipart/form-data"><input name="file1" type="file" ><input type="submit"></form>
    <br>
    <br>
    <a style="color: #f1f1f1" href="admin_homepage.html"> Homepage</a>
    <br>

</body>

</html>