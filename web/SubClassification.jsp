<%-- 
    Document   : SubClassification
    Created on : Aug 4, 2018, 11:00:47 AM
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
        <title>Manage Sub Classification</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="Contents/CSS/main.css" media="all" />
        <link rel="stylesheet" type="text/css" href="Contents/CSS/crudTable.css" media="all" />   

        <script>

            function getAddSubClassificationMainClassification() {
                $.ajax({
                    url: 'GetMainClassificationController',
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);
                        var noOfList = Object.keys(json.MainClassification).length;
                        //alert(json.MainClassification[0].mainClassificationName);

                        option = '<option>Select Main Classification</option>';

                        for (var x = 0; x < noOfList; x++) {
                            //alert(json.MainClassification[x].mainClassificationName);
                            //$('#output').html(user_profile.books[x].bookId);
                            option += '<option value="' + json.MainClassification[x].mainClassificationId + '">' + json.MainClassification[x].mainClassificationName + '</option>';
                            //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                        }
                        //$('#idMainClassification').append(option);

                        $('#addSubClassificationMainClassification')
                                .find('option')
                                .remove()
                                .end()
                                .append(option)
                                ;
                    },

                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            function getEditSubClassificationMainClassification() {
                $.ajax({
                    url: 'GetMainClassificationController',
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);
                        var noOfList = Object.keys(json.MainClassification).length;
                        //alert(json.MainClassification[0].mainClassificationName);

                        option = '<option>Select Main Classification</option>';

                        for (var x = 0; x < noOfList; x++) {
                            //alert(json.MainClassification[x].mainClassificationName);
                            //$('#output').html(user_profile.books[x].bookId);
                            option += '<option value="' + json.MainClassification[x].mainClassificationId + '">' + json.MainClassification[x].mainClassificationName + '</option>';
                            //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                        }
                        //$('#idMainClassification').append(option);

                        $('#editSubClassificationMainClassification')
                                .find('option')
                                .remove()
                                .end()
                                .append(option)
                                ;
                    },

                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            function getSubClassificationDetailsById(subClassificationId) {
                $.ajax({
                    url: 'GetSubClassificationByIdController?subClassificationId=' + subClassificationId,
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);

                        var subClassificationId = json.SubClassification[0].SubClassificationId;
                        var subClassificationName = json.SubClassification[0].SubClassificationName;
                        var mainClassificationId = json.SubClassification[0].MainClassificationId;
                        var mainClassificationName = json.SubClassification[0].MainClassificationName;

                        $("#editSubClassificationIdLabel").text(subClassificationId);
                        $("#editSubClassificationId").val(subClassificationId);

                        setTimeout(function () {
                            $("#editSubClassificationMainClassification").val(mainClassificationId);
                        }, 100);

                        $("#editSubClassificationName").val(subClassificationName);
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
                    var editSubClassificationId = $(this).attr('value');
                    getEditSubClassificationMainClassification();

                    setTimeout(function () {
                        getSubClassificationDetailsById(editSubClassificationId);
                    }, 100);
                });

                $(document).on('click', 'i[id^="deleteBtn"]', function () {
                    //alert($(this).attr('value'));
                    var deleteSubClassificationId = $(this).attr('value');
                    var deleteSubClassificationIdValue = $(this).attr('id');
                    //alert(deleteBookIdValue);
                    $("#deleteSubClassificationId").val(deleteSubClassificationId);
                });

                $("#btnSearchSubClassification").click(function () {
                    $("#tbodySubClassificationDetails").empty();

                    $("#totalRecordCount").empty();

                    var firstFilterType = $("#firstFilterType").find('option:selected').attr('id');
                    var firstFilterText = $("#firstFilterText").val();
                    var secondFilterText = $("#secondFilterText").val();
                    //var editBookId = $(this).attr('value');

                    $.ajax({
                        url: 'SearchSubClassificationController?firstFilterText=' + firstFilterText + '&firstFilterType=' + firstFilterType + '&secondFilterText=' + secondFilterText,

                        complete: function (searchResponse) {
                            var json = JSON.parse(searchResponse.responseText);
                            var noOfList = Object.keys(json.SubClassification).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            for (var x = 0; x < noOfList; x++) {
                                var subClassificationId = json.SubClassification[x].SubClassificationId;
                                var subClassificationName = json.SubClassification[x].SubClassificationName;
                                var mainClassificationId = json.SubClassification[x].MainClassificationId;
                                var mainClassificationName = json.SubClassification[x].MainClassificationName;
                                
                                var tbodyViewAll = '<tr>\n\
                                                    <td>' + subClassificationId + '</td>\n\
                                                    <td>' + mainClassificationName + '</td>\n\
                                                    <td>' + subClassificationName + '</td>\n\
                                                    <td>\n\
                                                        <a href="#editSubClassificationModal" class="edit" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="editBtn' + subClassificationId + '" value="' + subClassificationId + '" title="Edit">&#xE254;</i></a>\n\
                                                        <a href="#deleteSubClassificationModal" class="delete" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="deleteBtn' + subClassificationId + '" value="' + subClassificationId + '" title="Delete">&#xE872;</i></a>\n\
                                                    </td>\n\
                                                    </tr>';

                                $("#tbodySubClassificationDetails").append(tbodyViewAll);
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
                    
                    $("#tbodySubClassificationDetails").empty();

                    $("#totalRecordCount").empty();

                    $.ajax({
                        url: 'SearchSubClassificationController?btn=' + btnViewAll,

                        complete: function (searchResponse) {
                            var json = JSON.parse(searchResponse.responseText);
                            var noOfList = Object.keys(json.SubClassification).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            for (var x = 0; x < noOfList; x++) {
                                var subClassificationId = json.SubClassification[x].SubClassificationId;
                                var subClassificationName = json.SubClassification[x].SubClassificationName;
                                var mainClassificationId = json.SubClassification[x].MainClassificationId;
                                var mainClassificationName = json.SubClassification[x].MainClassificationName;
                                
                                var tbodyViewAll = '<tr>\n\
                                                    <td>' + subClassificationId + '</td>\n\
                                                    <td>' + mainClassificationName + '</td>\n\
                                                    <td>' + subClassificationName + '</td>\n\
                                                    <td>\n\
                                                        <a href="#editSubClassificationModal" class="edit" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="editBtn' + subClassificationId + '" value="' + subClassificationId + '" title="Edit">&#xE254;</i></a>\n\
                                                        <a href="#deleteSubClassificationModal" class="delete" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="deleteBtn' + subClassificationId + '" value="' + subClassificationId + '" title="Delete">&#xE872;</i></a>\n\
                                                    </td>\n\
                                                    </tr>';

                                $("#tbodySubClassificationDetails").append(tbodyViewAll);
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
                <input type="text" class="form-control"  id="firstFilterText" name="firstFilterText" style="width:200px; display: initial;" placeholder="First Filter"/>
                <select class="form-control"  id="firstFilterType" name="firstFilterType" style="width:180px; display: initial;">
                    <option id="">All</option>
                    <option id="MainClassification">Main Classification</option>
                </select>
                <input type="text" class="form-control"  id="secondFilterText" name="secondFilterText" style="width:200px; display: initial; margin-left:15px;" placeholder="Second Filter"/>
                <button class="btn btn-success" id="btnSearchSubClassification" name="btnSearchSubClassification">Search</button>
                <button class="btn btn-success" id="btnViewAll" name="btnViewAll" value="ViewAllRecords">View All</button>
            </form>
            <div class="table-wrapper">
                <div class="table-title" style="background:#365631;">
                    <div class="row">
                        <div class="col-sm-4">
                            <h2 style="font-size:18px;">Manage
                                <b>Sub Classifications</b>
                            </h2>
                        </div>
                        <div class="col-sm-8">
                            <a href="#addSubClassificationModal" id="btnAddSubClassification" class="btn btn-success" data-toggle="modal" onclick="getAddSubClassificationMainClassification();">
                                <i class="material-icons">&#xE147;</i>
                                <span>Add Sub Classification</span>
                            </a>
                            <a href="./ViewMainClassificationController" class="btn btn-success" data-toggle="modal">
                                <i class="material-icons">star</i>
                                <span>Main Classification</span>
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
                            <th style="width:auto;">Sub Classification Name</th>
                        </tr>
                    </thead>
                    <tbody id="tbodySubClassificationDetails">
                        <c:forEach items="${subClassificationListAtt}" var="subClassificationList">
                            <tr>
                                <td>${subClassificationList.getSubClassificationId()}</td>
                                <td>${subClassificationList.getMainClassificationName()}</td>
                                <td>${subClassificationList.getSubClassificationName()}</td>

                                <td>
                                    <a href="#editSubClassificationModal" class="edit" data-toggle="modal">
                                        <i class="material-icons" data-toggle="tooltip" id="editBtn${subClassificationList.getSubClassificationId()}" value="${subClassificationList.getSubClassificationId()}" title="Edit">&#xE254;</i>
                                    </a>
                                    <a href="#deleteSubClassificationModal" class="delete" data-toggle="modal">
                                        <i class="material-icons" data-toggle="tooltip" id="deleteBtn${subClassificationList.getSubClassificationId()}" value="${subClassificationList.getSubClassificationId()}" title="Delete">&#xE872;</i>
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
        <div id="addSubClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="AddSubClassificationController">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Sub Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Sub Classification ID</label>
                                <input type="text" class="form-control" name="subClassificationId" id="subClassificationId" required>
                            </div>
                            <div class="form-group" style="margin-bottom:20px;">
                                <label>Main Classification</label>
                                <select class="form-control" name="addSubClassificationMainClassification" id="addSubClassificationMainClassification">
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sub Classification Name</label>
                                <input type="text" class="form-control" name="subClassificationName" id="subClassificationName" required>
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
        <div id="editSubClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="EditSubClassificationController">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Sub Classification</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Sub Classification ID</label>
                                <label class="form-control" id="editSubClassificationIdLabel" name="editSubClassificationIdLabel" readonly></label>
                                <input type="text" name="editSubClassificationId" id="editSubClassificationId" class="form-control" hidden style="display:none;">
                            </div>
                            <div class="form-group">
                                <label>Main Classification</label>
                                <select class="form-control" style="margin-bottom:20px;" id="editSubClassificationMainClassification" name="editSubClassificationMainClassification">
                                    <option>Main Classification</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sub Classification Name</label>
                                <input type="text" class="form-control" id="editSubClassificationName" name="editSubClassificationName" required>
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
        <div id="deleteSubClassificationModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="DeleteSubClassificationController">
                        <input type="text" name="deleteSubClassificationId" id="deleteSubClassificationId" hidden style="display:none;"/>
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Sub Classification</h4>
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