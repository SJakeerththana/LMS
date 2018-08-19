<%-- 
    Document   : MainClassification
    Created on : Aug 4, 2018, 10:49:01 AM
    Author     : Natsu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manage Main Classification</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="Contents/CSS/main.css" media="all" />
        <link rel="stylesheet" type="text/css" href="Contents/CSS/crudTable.css" media="all" />   

        <script>

            function getMainClassificationDetailsById(mainClassificationId) {
                $.ajax({
                    url: 'GetMainClassificationByIdController?mainClassificationId=' + mainClassificationId,
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);

                        var mainClassificationId = json.MainClassification[0].MainClassificationId;
                        var mainClassificationName = json.MainClassification[0].MainClassificationName;

                        $("#editMainClassificationIdLabel").text(mainClassificationId);
                        $("#editMainClassificationId").val(mainClassificationId);
                        $("#editMainClassificationName").val(mainClassificationName);
                    },
                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }


            $(document).ready(function () {
                $(document).on('click', 'i[id^="editBtn"]', function () {
                    var editMainClassificationId = $(this).attr('value');

                    setTimeout(function () {
                        getMainClassificationDetailsById(editMainClassificationId);
                    }, 100);
                });

                $(document).on('click', 'i[id^="deleteBtn"]', function () {
                    var deleteMainClassificationId = $(this).attr('value');
                    var deleteMainClassificationIdValue = $(this).attr('id');
                    $("#deleteMainClassificationId").val(deleteMainClassificationId);
                });

                $("#btnSearchMainClassification").click(function () {
                    $("#tbodyMainClassificationDetails").empty();

                    $("#totalRecordCount").empty();

                    var searchText = $("#searchText").val();

                    $.ajax({
                        url: 'SearchMainClassificationController?searchText=' + searchText,

                        complete: function (searchResponse) {
                            var json = JSON.parse(searchResponse.responseText);
                            var noOfList = Object.keys(json.MainClassification).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            for (var x = 0; x < noOfList; x++) {
                                var mainClassificationId = json.MainClassification[x].MainClassificationId;
                                var mainClassificationName = json.MainClassification[x].MainClassificationName;

                                var tbodyViewAll = '<tr>\n\
                                                    <td>' + mainClassificationId + '</td>\n\
                                                    <td>' + mainClassificationName + '</td>\n\
                                                    <td>\n\
                                                        <a href="#editMainClassificationModal" class="edit" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="editBtn' + mainClassificationId + '" value="' + mainClassificationId + '" title="Edit">&#xE254;</i></a>\n\
                                                        <a href="#deleteMainClassificationModal" class="delete" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="deleteBtn' + mainClassificationId + '" value="' + mainClassificationId + '" title="Delete">&#xE872;</i></a>\n\
                                                    </td>\n\
                                                    </tr>';

                                $("#tbodyMainClassificationDetails").append(tbodyViewAll);
                            }
                            var totalRecords = "Total <b>" + noOfList + "</b> record(s)";
                            $("#totalRecordCount").append(totalRecords);
                        },

                        error: function () {
                            //$('#id').html('Error receiving the response from json');
                            console.log('Error receiving the response from json');
                        },
                    });
                    return false;
                });
                
                $("#btnViewAll").click(function () {
                    var btnViewAll = $("#btnViewAll").attr("value");
                    $("#tbodyMainClassificationDetails").empty();

                    $("#totalRecordCount").empty();

                    $.ajax({
                        url: 'SearchMainClassificationController?btn=' + btnViewAll,

                        complete: function (searchResponse) {
                            var json = JSON.parse(searchResponse.responseText);
                            var noOfList = Object.keys(json.MainClassification).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            for (var x = 0; x < noOfList; x++) {
                                var mainClassificationId = json.MainClassification[x].MainClassificationId;
                                var mainClassificationName = json.MainClassification[x].MainClassificationName;

                                var tbodyViewAll = '<tr>\n\
                                                    <td>' + mainClassificationId + '</td>\n\
                                                    <td>' + mainClassificationName + '</td>\n\
                                                    <td>\n\
                                                        <a href="#editMainClassificationModal" class="edit" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="editBtn' + mainClassificationId + '" value="' + mainClassificationId + '" title="Edit">&#xE254;</i></a>\n\
                                                        <a href="#deleteMainClassificationModal" class="delete" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="deleteBtn' + mainClassificationId + '" value="' + mainClassificationId + '" title="Delete">&#xE872;</i></a>\n\
                                                    </td>\n\
                                                    </tr>';

                                $("#tbodyMainClassificationDetails").append(tbodyViewAll);
                            }
                            var totalRecords = "Total <b>" + noOfList + "</b> record(s)";
                            $("#totalRecordCount").append(totalRecords);
                        },

                        error: function () {
                            //$('#id').html('Error receiving the response from json');
                            console.log('Error receiving the response from json');
                        },
                    });
                    return false;
                });
                
            });

        </script>
    </head>

    <body>
        <%@ include file="Shared/header.jsp" %>
        <div class="container">
            <form>
                <input type="text" class="form-control" id="searchText" name="searchText" placeholder="Search Here.." style="width:200px; display: initial;"/>
                <button class="btn btn-success" id="btnSearchMainClassification" name="btnSearchMainClassification">Search</button>
                <button class="btn btn-success" id="btnViewAll" name="btnViewAll" value="ViewAllRecords">View All</button>
            </form>
            <div class="table-wrapper">
                <div class="table-title" style="background:#365631;">
                    <div class="row">
                        <div class="col-sm-4">
                            <h2 style="font-size:18px;">Manage
                                <b>Main Classifications</b>
                            </h2>
                        </div>
                        <div class="col-sm-8">
                            <a href="#addMainClassificationModal" id="btnAddSubClassification" class="btn btn-success" data-toggle="modal" onclick="getAddMainClassificationMainClassification();">
                                <i class="material-icons">&#xE147;</i>
                                <span>Add Main Classification</span>
                            </a>
                            <a href="./ViewSubClassificationController" class="btn btn-success" data-toggle="modal">
                                <i class="material-icons">star</i>
                                <span>Sub Classification</span>
                            </a>
                            <a href="./index.jsp" class="btn btn-success" data-toggle="modal">
                                <i class="material-icons">account_balance</i>
                                <span>Home</span>
                            </a>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th style="width:auto;">Main Classification Name</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyMainClassificationDetails">
                        <c:forEach items="${mainClassificationListAtt}" var="mainClassificationList">
                            <tr>
                                <td>${mainClassificationList.getMainClassificationId()}</td>
                                <td>${mainClassificationList.getMainClassificationName()}</td>
                                <td>
                                    <a href="#editMainClassificationModal" class="edit" data-toggle="modal">
                                        <i class="material-icons" data-toggle="tooltip" id="editBtn${mainClassificationList.getMainClassificationId()}" value="${mainClassificationList.getMainClassificationId()}" title="Edit">&#xE254;</i>
                                    </a>
                                    <a href="#deleteMainClassificationModal" class="delete" data-toggle="modal">
                                        <i class="material-icons" data-toggle="tooltip" id="deleteBtn${mainClassificationList.getMainClassificationId()}" value="${mainClassificationList.getMainClassificationId()}" title="Delete">&#xE872;</i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="clearfix">
                    <div class="hint-text" id="totalRecordCount">
                        Total <b>${records}</b> record(s)
                    </div>
                </div>
            </div>
        </div>
        <!-- Add Modal HTML -->
        <div id="addMainClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="AddMainClassificationController">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Main Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Main Classification ID</label>
                                <input type="text" class="form-control" name="mainClassificationId" id="mainClassificationId" required>
                            </div>
                            <div class="form-group">
                                <label>Main Classification Name</label>
                                <input type="text" class="form-control" name="mainClassificationName" id="mainClassificationName" required>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editMainClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="EditMainClassificationController">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Main Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Main Classification ID</label>
                                <label class="form-control" id="editMainClassificationIdLabel" name="editMainClassificationIdLabel" readonly></label>
                                <input type="text" name="editMainClassificationId" id="editMainClassificationId" class="form-control" hidden style="display:none;">
                            </div>
                            <div class="form-group">
                                <label>Main Classification Name</label>
                                <input type="text" id="editMainClassificationName" name="editMainClassificationName" class="form-control" required>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Update">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteMainClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="DeleteMainClassificationController">
                        <input type="text" name="deleteMainClassificationId" id="deleteMainClassificationId" hidden style="display:none;"/>
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Main Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure you want to delete this record?</p>
                            <p class="text-warning">
                                <small>This action cannot be undone.</small>
                            </p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>