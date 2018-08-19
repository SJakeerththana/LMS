<%-- 
    Document   : Books
    Created on : Aug 2, 2018, 6:21:48 PM
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
        <title>Manage Books</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="Contents/CSS/main.css" media="all" />
        <link rel="stylesheet" type="text/css" href="Contents/CSS/crudTable.css" media="all" />   

        <style>
            @media (min-width: 1200px){
                .container {
                    width: 1200px;
                }
            }
        </style>

        <script>

            function getAddBookMainClassification() {
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

                        $('#addBookMainClassification')
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

            function getEditBookMainClassification() {
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

                        $('#editBookMainClassification')
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

            function loadAddBookPublishYear() {
                var date = new Date();
                var endYear = 1800;

                option = '<option>Select Publish Year</option>';
                for (var publishYear = date.getFullYear(); publishYear >= endYear; publishYear--) {
                    option += '<option value="' + publishYear + '">' + publishYear + '</option>';
                }

                $('#addBookPublishYear')
                        .find('option')
                        .remove()
                        .end()
                        .append(option);
            }

            function loadEditBookPublishYear() {
                var date = new Date();
                var endYear = 1800;

                option = '<option>Select Publish Year</option>';
                for (var publishYear = date.getFullYear(); publishYear >= endYear; publishYear--) {
                    option += '<option value="' + publishYear + '">' + publishYear + '</option>';
                }

                $('#editBookPublishYear')
                        .find('option')
                        .remove()
                        .end()
                        .append(option);
            }

            function loadAllSubClassification() {
                $.ajax({
                    url: 'GetSubClassificationController',

                    complete: function (responsex) {
                        var json = JSON.parse(responsex.responseText);
                        var noOfList = Object.keys(json.SubClassification).length;
                        //alert(json.MainClassification[0].mainClassificationName);

                        option = '<option>Select Sub Classification</option>';

                        for (var x = 0; x < noOfList; x++) {
                            //alert(json.MainClassification[x].mainClassificationName);
                            //$('#output').html(user_profile.books[x].bookId);
                            option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                            //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                        }
                        //$('#idMainClassification').append(option);

                        $('#editBookSubClassification')
                                .find('option')
                                .remove()
                                .end()
                                .append(option);
                    },

                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            function loadAllLastPrintYear(publishYear) {
                var date = new Date();
                option = '<option>Select Last Print Year</option>';
                for (var lastPrintYear = date.getFullYear(); lastPrintYear >= publishYear; lastPrintYear--) {
                    option += '<option value="' + lastPrintYear + '">' + lastPrintYear + '</option>';
                }

                $('#editBookLastPrintYear')
                        .find('option')
                        .remove()
                        .end()
                        .append(option);
            }

            function getBookDetailsById(editBookId) {
                $.ajax({
                    url: 'GetBookDetailsByIdController?bookId=' + editBookId,
                    complete: function (response) {
                        var json = JSON.parse(response.responseText);

                        var bookId = json.books[0].bookId;
                        var bookTitle = json.books[0].Title;
                        var bookAuthor = json.books[0].Author;
                        var bookPublishYear = json.books[0].PublishYear;
                        var bookLastPrintYear = json.books[0].LastPrintYear;
                        var bookISBN = json.books[0].ISBN;
                        var bookNoOfPages = json.books[0].NoOfPages;
                        var bookMainClassificationId = json.books[0].MainClassificationId;
                        var bookMainClassificationName = json.books[0].MainClassificationName;
                        var bookSubClassificationId = json.books[0].SubClassificationId;
                        var bookSubClassificationName = json.books[0].SubClassificationName;

                        $("#editBookIdLabel").text(bookId);
                        $("#editBookId").val(bookId);
                        $("#editBookTitle").val(bookTitle);
                        $("#editBookAuthor").val(bookAuthor);
                        $("#editBookMainClassification").val(bookMainClassificationId);

                        getSubClassificationByMainClassificationEditBox(bookMainClassificationId);
                        setTimeout(function () {
                            $("#editBookSubClassification").val(bookSubClassificationId);
                        }, 100);

                        $("#editBookPublishYear").val(bookPublishYear);
                        loadAllLastPrintYear(bookPublishYear);
                        setTimeout(function () {
                            $("#editBookLastPrintYear").val(bookLastPrintYear);
                        }, 100);
                        $("#editISBN").val(bookISBN);
                        $("#editNoOfPages").val(bookNoOfPages);
                    },
                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            function getSubClassificationByMainClassificationEditBox(mainClassificationId) {
                //var mainClassificationId = $('#editBookMainClassification :selected').val();
                $.ajax({
                    url: 'GetSubClassificationByMainClassificationController?mainClassificationId=' + mainClassificationId,

                    complete: function (responsex) {
                        var json = JSON.parse(responsex.responseText);
                        var noOfList = Object.keys(json.SubClassification).length;
                        //alert(json.MainClassification[0].mainClassificationName);

                        option = '<option>Select Sub Classification</option>';

                        for (var x = 0; x < noOfList; x++) {
                            //alert(json.MainClassification[x].mainClassificationName);
                            //$('#output').html(user_profile.books[x].bookId);
                            option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                            //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                        }
                        //$('#idMainClassification').append(option);

                        $('#editBookSubClassification')
                                .find('option')
                                .remove()
                                .end()
                                .append(option);
                    },

                    error: function () {
                        //$('#id').html('Error receiving the response from json');
                        console.log('Error receiving the response from json');
                    },
                });
                return false;
            }

            $(document).ready(function () {
                $("#addBookMainClassification").change(function () {
                    var mainClassificationId = this.value;
                    $.ajax({
                        url: 'GetSubClassificationByMainClassificationController?mainClassificationId=' + mainClassificationId,

                        complete: function (responsex) {
                            var json = JSON.parse(responsex.responseText);
                            var noOfList = Object.keys(json.SubClassification).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            option = '<option>Select Sub Classification</option>';

                            for (var x = 0; x < noOfList; x++) {
                                //alert(json.MainClassification[x].mainClassificationName);
                                //$('#output').html(user_profile.books[x].bookId);
                                option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                                //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                            }
                            //$('#idMainClassification').append(option);

                            $('#addBookSubClassification')
                                    .find('option')
                                    .remove()
                                    .end()
                                    .append(option);
                        },

                        error: function () {
                            //$('#id').html('Error receiving the response from json');
                            console.log('Error receiving the response from json');
                        },
                    });
                    return false;
                });

                $("#editBookMainClassification").change(function () {
                    var mainClassificationId = this.value;
                    $.ajax({
                        url: 'GetSubClassificationByMainClassificationController?mainClassificationId=' + mainClassificationId,

                        complete: function (responsex) {
                            var json = JSON.parse(responsex.responseText);
                            var noOfList = Object.keys(json.SubClassification).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            option = '<option>Select Sub Classification</option>';

                            for (var x = 0; x < noOfList; x++) {
                                //alert(json.MainClassification[x].mainClassificationName);
                                //$('#output').html(user_profile.books[x].bookId);
                                option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                                //$("#myTable > tbody").append("<tr><td>row content</td></tr>");
                            }
                            //$('#idMainClassification').append(option);

                            $('#editBookSubClassification')
                                    .find('option')
                                    .remove()
                                    .end()
                                    .append(option);
                        },

                        error: function () {
                            //$('#id').html('Error receiving the response from json');
                            console.log('Error receiving the response from json');
                        },
                    });
                    return false;
                });

                $("#addBookPublishYear").change(function () {
                    var publishYear = this.value;
                    var date = new Date();

                    option = '<option>Select Last Print Year</option>';
                    for (var lastPrintYear = date.getFullYear(); lastPrintYear >= publishYear; lastPrintYear--) {
                        option += '<option value="' + lastPrintYear + '">' + lastPrintYear + '</option>';
                    }

                    $('#addBookLastPrintYear')
                            .find('option')
                            .remove()
                            .end()
                            .append(option);
                });

                $("#editBookPublishYear").change(function () {
                    var publishYear = this.value;
                    var date = new Date();

                    option = '<option>Select Last Print Year</option>';
                    for (var lastPrintYear = date.getFullYear(); lastPrintYear >= publishYear; lastPrintYear--) {
                        option += '<option value="' + lastPrintYear + '">' + lastPrintYear + '</option>';
                    }

                    $('#editBookLastPrintYear')
                            .find('option')
                            .remove()
                            .end()
                            .append(option);
                });

                $(document).on('click', 'i[id^="editBtn"]', function () {
                    //alert($(this).attr('value'));
                    var editBookId = $(this).attr('value');
                    getEditBookMainClassification();
                    loadAllSubClassification();
                    loadEditBookPublishYear();
                    getBookDetailsById(editBookId);
                });

                $(document).on('click', 'i[id^="deleteBtn"]', function () {
                    //alert($(this).attr('value'));
                    var deleteBookId = $(this).attr('value');
                    var deleteBookIdValue = $(this).attr('id');
                    //alert(deleteBookIdValue);
                    $("#deleteBookId").val(deleteBookId);
                });

                $("#btnViewAll").click(function () {
                    $("#tbodyBookDetails").empty();

                    $("#totalRecordCount").empty();

                    var viewAllRecords = $("#btnViewAll").attr("value");

                    $.ajax({
                        url: 'SearchBookController?viewAllRecords=' + viewAllRecords,

                        complete: function (viewResponse) {
                            var json = JSON.parse(viewResponse.responseText);
                            var noOfList = Object.keys(json.books).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            for (var x = 0; x < noOfList; x++) {
                                var bookId = json.books[x].bookId;
                                var bookTitle = json.books[x].Title;
                                var bookAuthor = json.books[x].Author;
                                var bookPublishYear = json.books[x].PublishYear;
                                var bookLastPrintYear = json.books[x].LastPrintYear;
                                var bookISBN = json.books[x].ISBN;
                                var bookNoOfPages = json.books[x].NoOfPages;
                                var bookMainClassificationId = json.books[x].MainClassificationId;
                                var bookMainClassificationName = json.books[x].MainClassificationName;
                                var bookSubClassificationId = json.books[x].SubClassificationId;
                                var bookSubClassification = json.books[x].SubClassificationName;

                                //alert(json.MainClassification[x].mainClassificationName);
                                //$('#output').html(user_profile.books[x].bookId);
                                //option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                                var tbodyViewAll = '<tr>\n\
                                                    <td>' + bookId + '</td>\n\
                                                    <td>' + bookTitle + '</td>\n\
                                                    <td>' + bookAuthor + '</td>\n\
                                                    <td>' + bookMainClassificationName + '</td>\n\
                                                    <td>' + bookSubClassification + '</td>\n\
                                                    <td>' + bookPublishYear + '</td>\n\
                                                    <td>' + bookLastPrintYear + '</td>\n\
                                                    <td>' + bookISBN + '</td>\n\
                                                    <td>' + bookNoOfPages + '</td>\n\
                                                    <td>\n\
                                                        <a href="#editBookModal" class="edit" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="editBtn' + bookId + '" value="' + bookId + '" title="Edit">&#xE254;</i></a>\n\
                                                        <a href="#deleteBookModal" class="delete" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="deleteBtn' + bookId + '" value="' + bookId + '" title="Delete">&#xE872;</i></a>\n\
                                                    </td>\n\
                                                    </tr>';

                                $("#tbodyBookDetails").append(tbodyViewAll);
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

                $("#btnSearchBook").click(function () {
                    $("#tbodyBookDetails").empty();

                    $("#totalRecordCount").empty();

                    var firstFilterType = $("#firstFilterType").find('option:selected').attr('id');
                    var firstFilterText = $("#firstFilterText").val();
                    var secondFilterType = $("#secondFilterType").find('option:selected').attr('id');
                    var secondFilterText = $("#secondFilterText").val();
                    //var editBookId = $(this).attr('value');

                    $.ajax({
                        url: 'SearchBookController?firstFilterText=' + firstFilterText + '&firstFilterType=' + firstFilterType + '&secondFilterType=' + secondFilterType + '&secondFilterText=' + secondFilterText,

                        complete: function (searchResponse) {
                            var json = JSON.parse(searchResponse.responseText);
                            var noOfList = Object.keys(json.books).length;
                            //alert(json.MainClassification[0].mainClassificationName);

                            for (var x = 0; x < noOfList; x++) {
                                var bookId = json.books[x].bookId;
                                var bookTitle = json.books[x].Title;
                                var bookAuthor = json.books[x].Author;
                                var bookPublishYear = json.books[x].PublishYear;
                                var bookLastPrintYear = json.books[x].LastPrintYear;
                                var bookISBN = json.books[x].ISBN;
                                var bookNoOfPages = json.books[x].NoOfPages;
                                var bookMainClassificationId = json.books[x].MainClassificationId;
                                var bookMainClassificationName = json.books[x].MainClassificationName;
                                var bookSubClassificationId = json.books[x].SubClassificationId;
                                var bookSubClassification = json.books[x].SubClassificationName;

                                //alert(json.MainClassification[x].mainClassificationName);
                                //$('#output').html(user_profile.books[x].bookId);
                                //option += '<option value="' + json.SubClassification[x].SubClassificationId + '">' + json.SubClassification[x].SubClassificationName + '</option>';
                                var tbodyViewAll = '<tr>\n\
                                                    <td>' + bookId + '</td>\n\
                                                    <td>' + bookTitle + '</td>\n\
                                                    <td>' + bookAuthor + '</td>\n\
                                                    <td>' + bookMainClassificationName + '</td>\n\
                                                    <td>' + bookSubClassification + '</td>\n\
                                                    <td>' + bookPublishYear + '</td>\n\
                                                    <td>' + bookLastPrintYear + '</td>\n\
                                                    <td>' + bookISBN + '</td>\n\
                                                    <td>' + bookNoOfPages + '</td>\n\
                                                    <td>\n\
                                                        <a href="#editBookModal" class="edit" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="editBtn' + bookId + '" value="' + bookId + '" title="Edit">&#xE254;</i></a>\n\
                                                        <a href="#deleteBookModal" class="delete" data-toggle="modal">\n\
                                                        <i class="material-icons" data-toggle="tooltip" id="deleteBtn' + bookId + '" value="' + bookId + '" title="Delete">&#xE872;</i></a>\n\
                                                    </td>\n\
                                                    </tr>';

                                $("#tbodyBookDetails").append(tbodyViewAll);
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
                <input type="text" class="form-control" id="firstFilterText" name="firstFilterText" style="width:200px; display: initial;" placeholder="First Filter"/>
                <select class="form-control" id="firstFilterType" name="firstFilterType" style="width:180px; display: initial;">
                    <option id="">All</option>
                    <option id="bd.bookId">Book ID</option>
                    <option id="bd.title">Title</option>
                    <option id="bd.author">Author</option>
                    <option id="mc.mainClassificationName">Main Classification</option>
                    <option id="sc.subClassificationName">Sub Classification</option>
                    <option id="bd.publishYear">Publish Year</option>
                    <option id="bd.lastPrintYear">Last Print Year</option>
                    <option id="bd.isbnNo">ISBN No</option>
                    <option id="bd.noOfPages">No of Pages</option>
                </select>
                <input type="text" class="form-control" id="secondFilterText" name="secondFilterText" style="width:200px; display: initial; margin-left:15px;" placeholder="Second Filter"/>
                <select class="form-control" id="secondFilterType" name="secondFilterType" style="width:180px; display: initial;">
                    <option id="">All</option>
                    <option id="bd.bookId">Book ID</option>
                    <option id="bd.title">Title</option>
                    <option id="bd.author">Author</option>
                    <option id="mc.mainClassificationName">Main Classification</option>
                    <option id="sc.subClassificationName">Sub Classification</option>
                    <option id="bd.publishYear">Publish Year</option>
                    <option id="bd.lastPrintYear">Last Print Year</option>
                    <option id="bd.isbnNo">ISBN No</option>
                    <option id="bd.noOfPages">No of Pages</option>
                </select>
                <button class="btn btn-success" id="btnSearchBook" name="btnSearchBook">Search Book</button>
            </form>
            <div class="table-wrapper">
                <div class="table-title" style="background:#365631;">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2 style="font-size: 18px;">Manage
                                <b>Books</b>
                            </h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addBookModal" id="btnAddBook" class="btn btn-success" data-toggle="modal" onclick="getAddBookMainClassification();
                                    loadAddBookPublishYear();">
                                <i class="material-icons">&#xE147;</i>
                                <span>Add New Book</span>
                            </a>
                            <a href="./index.jsp" class="btn btn-success" data-toggle="modal">
                                <i class="material-icons">account_balance</i>
                                <span>Home</span>
                            </a>
                            <a href="SearchBookController" value="viewAllRecords" id="btnViewAll" class="btn btn-success" data-toggle="modal">
                                <i class="material-icons">visibility</i>
                                <span>View All</span>
                            </a>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Book ID</th>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Main Classification</th>
                            <th>Sub Classification</th>
                            <th>Publish Year</th>
                            <th>Last Print Year</th>
                            <th>ISBN No</th>
                            <th>No of Pages</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyBookDetails">
                        <c:forEach items="${bookListAtt}" var="bookList">
                            <tr>
                                <td>${bookList.getBookId()}</td>
                                <td>${bookList.getTitle()}</td>
                                <td>${bookList.getAuthor()}</td>
                                <td>${bookList.getMainClassificationName()}</td>
                                <td>${bookList.getSubclassificationName()}</td>
                                <td>${bookList.getPublishYear()}</td>
                                <td>${bookList.getLastPrintYear()}</td>
                                <td>${bookList.getIsbnNo()}</td>
                                <td>${bookList.getNoOfPages()}</td>

                                <td>
                                    <a href="#editBookModal" class="edit" data-toggle="modal">
                                        <i class="material-icons" data-toggle="tooltip" id="editBtn${bookList.getBookId()}" value="${bookList.getBookId()}" title="Edit">&#xE254;</i>
                                    </a>
                                    <a href="#deleteBookModal" class="delete" data-toggle="modal">
                                        <i class="material-icons" data-toggle="tooltip" id="deleteBtn${bookList.getBookId()}" value="${bookList.getBookId()}" title="Delete">&#xE872;</i>
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
                    <!--                    <ul class="pagination">
                                            <li class="page-item disabled">
                                                <a href="#">Previous</a>
                                            </li>
                                            <li class="page-item">
                                                <a href="#" class="page-link">1</a>
                                            </li>
                                            <li class="page-item">
                                                <a href="#" class="page-link">2</a>
                                            </li>
                                            <li class="page-item active">
                                                <a href="#" class="page-link">3</a>
                                            </li>
                                            <li class="page-item">
                                                <a href="#" class="page-link">4</a>
                                            </li>
                                            <li class="page-item">
                                                <a href="#" class="page-link">5</a>
                                            </li>
                                            <li class="page-item">
                                                <a href="#" class="page-link">Next</a>
                                            </li>
                                        </ul>-->
                </div>
            </div>
        </div>
        <!-- Add Modal HTML -->
        <div id="addBookModal" class="modal fade">
            <div class="modal-dialog" style="max-width:60%;">
                <div class="modal-content">
                    <form method="get" action="AddBookController">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Book</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body col-md-6">
                            <div class="form-group">
                                <label>Book ID</label>
                                <input type="text" name="bookId" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Book Title</label>
                                <input type="text" name="bookTitle" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Book Author</label>
                                <input type="text" name="bookAuthor" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Main Classification</label>
                                <select class="form-control" id="addBookMainClassification" name="addBookMainClassification">
                                    <option>Select Main Classification</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sub Classification</label>
                                <select class="form-control" id="addBookSubClassification" name="addBookSubClassification">
                                </select>
                            </div>
                        </div>
                        <div class="modal-body col-md-6">
                            <div class="form-group">
                                <label>Publish Year</label>
                                <select class="form-control" id="addBookPublishYear" name="addBookPublishYear">
                                    <option>Publish Year</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Last Print Year</label>
                                <select class="form-control" id="addBookLastPrintYear" name="addBookLastPrintYear">
                                    <option>Select Last Print Year</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>ISBN No</label>
                                <input type="text" name="isbn" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>No of Pages</label>
                                <input type="number" name="noofpages" class="form-control" required>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save" style="background: #54a754;">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editBookModal" class="modal fade">
            <div class="modal-dialog" style="max-width:60%;">
                <div class="modal-content">
                    <form method="get" action="EditBookController">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Book</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body col-md-6">
                            <div class="form-group">
                                <label>Book ID</label>
                                <label class="form-control" name="editBookIdLabel" id="editBookIdLabel" readonly></label>
                                <input type="text" name="editBookId" id="editBookId" class="form-control" hidden style="display:none;">
                            </div>
                            <div class="form-group">
                                <label>Book Title</label>
                                <input type="text" name="editBookTitle" id="editBookTitle" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Book Author</label>
                                <input type="text" name="editBookAuthor" id="editBookAuthor" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Main Classification</label>
                                <select class="form-control" id="editBookMainClassification" name="editBookMainClassification">
                                    <option>Select Main Classification</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Sub Classification</label>
                                <select class="form-control" id="editBookSubClassification" name="editBookSubClassification">
                                </select>
                            </div>
                        </div>
                        <div class="modal-body col-md-6">
                            <div class="form-group">
                                <label>Publish Year</label>
                                <select class="form-control" id="editBookPublishYear" name="editBookPublishYear">
                                    <option>Publish Year</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Last Print Year</label>
                                <select class="form-control" id="editBookLastPrintYear" name="editBookLastPrintYear">
                                    <option>Select Last Print Year</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>ISBN No</label>
                                <input type="text" name="editISBN" id="editISBN" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>No of Pages</label>
                                <input type="number" name="editNoOfPages" id="editNoOfPages" class="form-control" required>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save" style="background: #54a754;">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteBookModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form method="get" action="DeleteBookController">
                        <input type="text" name="deleteBookId" id="deleteBookId" hidden style="display:none;"/>
                        <div class="modal-header">
                            <h4 class="modal-title">Delete Book</h4>
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