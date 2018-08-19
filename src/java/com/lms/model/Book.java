package com.lms.model;

public class Book {
    String bookId, title, 
            author, mainClassificationId, 
            subClassificationId, publishYear, 
            lastPrintYear, isbnNo, mainClassificationName, subclassificationName;
    int noOfPages;

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getLastPrintYear() {
        return lastPrintYear;
    }

    public void setLastPrintYear(String lastPrintYear) {
        this.lastPrintYear = lastPrintYear;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getMainClassificationId() {
        return mainClassificationId;
    }

    public void setMainClassificationId(String mainClassificationId) {
        this.mainClassificationId = mainClassificationId;
    }

    public String getSubClassificationId() {
        return subClassificationId;
    }

    public void setSubClassificationId(String subClassificationId) {
        this.subClassificationId = subClassificationId;
    }

    public String getPublishYear() {
        return publishYear;
    }

    public void setPublishYear(String publishYear) {
        this.publishYear = publishYear;
    }

    public String getIsbnNo() {
        return isbnNo;
    }

    public void setIsbnNo(String isbnNo) {
        this.isbnNo = isbnNo;
    }

    public int getNoOfPages() {
        return noOfPages;
    }

    public void setNoOfPages(int noOfPages) {
        this.noOfPages = noOfPages;
    }

    public String getMainClassificationName() {
        return mainClassificationName;
    }

    public void setMainClassificationName(String mainClassificationName) {
        this.mainClassificationName = mainClassificationName;
    }

    public String getSubclassificationName() {
        return subclassificationName;
    }

    public void setSubclassificationName(String subclassificationName) {
        this.subclassificationName = subclassificationName;
    }
}
