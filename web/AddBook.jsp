<%-- 
    Document   : AddBook
    Created on : Aug 1, 2018, 1:40:25 AM
    Author     : Natsu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Book</title>
        <link href='https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="Contents/CSS/main.css" media="all" />
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

        

<script>
function showCustomer(str) {
  var xhttp;    
  if (str == "") {
    document.getElementById("txtHint").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState === 4 && this.status === 200) {
      document.getElementById("txtHint").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "getcustomer.asp?q="+str, true);
  xhttp.send();
}
</script>

    </head>
    <body>
        <%@ include file="Shared/header.jsp" %>
        
        <div class='container' style="margin-top: 100px;">
        <div id="txtHint">Success or Error Message Comes Here ....</div>
        
            <div class='panel panel-primary dialog-panel'>
                <div class='panel-heading'>
                    <h5>Add New Book - Library Management System</h5>
                </div>
                <div class='panel-body'>
                    <form class='form-horizontal' role='form' action="AddBookController" method="get">

                        <div class="row">
                            <div class="col-md-6">
                                <div class='form-group'>
                                    <label class='control-label col-md-4'>Book ID</label>
                                    <div class='col-md-8'>
                                        <input class='form-control' id='bookid' name='bookid' placeholder='Book ID' type='text'>
                                    </div>
                                </div>
                                <div class='form-group'>
                                    <label class='control-label col-md-4'>Book Title</label>
                                    <div class='col-md-8'>
                                        <input class='form-control' id='booktitle' name='booktitle' placeholder='Book Title' type='text'>
                                    </div>
                                </div>
                                <div class='form-group'>
                                    <label class='control-label col-md-4'>Book Author</label>
                                    <div class='col-md-8'>
                                        <input class='form-control' id='bookauthor' name='bookauthor' placeholder='Book Author' type='text'>
                                    </div>
                                </div>
                                <div class='form-group'>
                                    <label class='control-label col-md-4'>Main Classification</label>
                                    <div class='col-md-8'>
                                        <select class='form-control' id='mainclassification' name='mainclassification'  onchange="showCustomer(this.value)">
                                            <option value="m1">Engineering</option>
                                            <option value="m2">Medicine</option>
                                        </select>
                                    </div>
                                </div>
                                <div class='form-group'>
                                    <label class='control-label col-md-4'>Sub Classification</label>
                                    <div class='col-md-8'>
                                        <select class='form-control' id='subclassification' name='subclassification'>
                                            <option value="sc1">Civil Engineering</option>
                                            <option value="sc2">Software Engineering</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class='form-group'>
                                    <label class='control-label col-md-4'>Year of Publishing</label>
                                    <div class='col-md-8'>
                                        <select class='form-control' id='publishyear' name='publishyear'>
                                            <option value="2018">2018</option>
                                            <option value="2017">2017</option>
                                        </select>
                                    </div>
                                </div>
                                <div class='form-group'>
                                    <label class='control-label col-md-4'>Last Printed Year</label>
                                    <div class='col-md-8'>
                                        <select class='form-control' id='lastprintyear' name='lastprintyear'>
                                            <option value="2018">2018</option>
                                            <option value="2017">2017</option>
                                        </select>
                                    </div>
                                </div>
                                <div class='form-group'>
                                    <label class='control-label col-md-4'>ISBN No</label>
                                    <div class='col-md-8'>
                                        <input class='form-control' id='isbn' name='isbn' placeholder='ISBN No' type='text'>
                                    </div>
                                </div>
                                <div class='form-group'>
                                    <label class='control-label col-md-4'>No of Pages</label>
                                    <div class='col-md-8'>
                                        <input class='form-control' id='noofpages' name='noofpages' placeholder='No of Pages' type='number'>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class='form-group'>
                            <div class='col-md-offset-7 col-md-2'>
                                <a href="index.jsp">
                                    <button class='btn btn-danger' style='float:right' type="button">Back</button>
                                </a>
                            </div>
                            <div class='col-md-3'>
                                <button class='btn btn-primary' type='submit'>Add Book</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
