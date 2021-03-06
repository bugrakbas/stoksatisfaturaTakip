<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Kategori List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body background="https://wallpaperaccess.com/full/16677.jpg">

<nav class="navbar navbar-inverse" style="background-color: black">
    <div class="container-fluid">

        <ul class="nav navbar-nav" style="background-color: black">
            <li><a href="/urun/list">Ürün Ekle</a></li>
            <li><a href="/fatura/list">Fatura Ekle</a></li>
            <li><a href="/kargofirmasi/list">Kargo Firması Ekle</a></li>
            <li  class="active"><a href="/kategori/list">Kategori Ekle</a></li>
        </ul>
        <spring:url value="http://localhost:8080/" var="editUrl" />
        <a class="btn btn-danger" href="${editUrl}" role="button">Çıkış</a>
    </div>
</nav>

<center><h1 style= "background-color: sandybrown;">Kategori Ekranı</h1> </center>
<div class="container">
    <table class="table table-striped table-bordered table-sm">
        <thead class="thead-dark">
        <th scope="row">ID</th>
        <th scope="row">Kod</th>
        <th scope="row">Kategori Adı</th>
        <th scope="row">Güncelle</th>
        <th scope="row">Sil</th>
        </thead>
        <tbody>

        <c:forEach items="${kategoriList}" var="kategori" >
            <tr>
                <td>${kategori.id}</td>
                <td>${kategori.kod}</td>
                <td>${kategori.ad}</td>

                <td>

                    <spring:url value="/kategori/editKategori/${kategori.id}" var="editURL" />
                    <a class="btn btn-warning" href="${editURL}" role="button" >Güncelle</a>

                </td>

                <td>
                    <spring:url value="/kategori/deleteKategori/${kategori.id}" var="deleteURL" />
                    <a class="btn btn-danger" href="${deleteURL}" role="button" >Sil</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <spring:url value="/kategori/addKategori/" var="addURL" />
    <a class="btn btn-success" href="${addURL}" role="button" >Kategori Ekle</a>
</div>
</body>

