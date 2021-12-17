<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Fatura List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>
<body>
<body background="https://miro.medium.com/max/1200/1*dP81IJq-tGFxy1rIK3RYsg.png">

<nav class="navbar navbar-inverse" style="background-color: black">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/musteri/musteri/" style="background-color: black">Ana Sayfa</a>
        </div>
        <ul class="nav navbar-nav" style="background-color: black">
            <li><a href="/urun/list">Ürünler</a></li>
            <li><a href="/kategori/list">Kategoriler</a></li>
            <li><a href="/kargofirmasi/list">Kargo Firması Ekranı</a></li>
            <li><a href="/siparis/list">Siparişler</a></li>
            <li  class="active"><a href="/fatura/list">Faturalar </a></li>
        </ul>
    </div>
</nav>


<center><h1 style= "background-color: sandybrown;">Fatura Ekranı</h1> </center>

<div class="container">
    <table class="table table-striped table-bordered table-sm">
        <thead class="thead-dark">

        <th scope="row">ID</th>
        <th scope="row">Fatura No</th>
        <th scope="row">Tarih</th>
        <th scope="row">Güncelle</th>
        <th scope="row">Sil</th>
        </thead>
        <tbody>
        <c:forEach items="${faturaList}" var="fatura" >
            <tr>
                <td>${fatura.id}</td>
                <td>${fatura.faturano}</td>
                <td>${fatura.tarih}</td>
                <td><fmt:formatDate value="${fatura.tarih}" pattern="dd/MM/yyyy" /></td>
                <td>

                    <spring:url value="/fatura/editFatura/${fatura.id}" var="editURL" />
                    <a class="btn btn-warning" href="${editURL}" role="button" >Güncelle</a>

                </td>

                <td>
                    <spring:url value="/fatura/deleteFatura/${fatura.id}" var="deleteURL" />
                    <a class="btn btn-danger" href="${deleteURL}" role="button" >Sil</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <spring:url value="/fatura/addFatura/" var="addURL" />
    <a class="btn btn-success" href="${addURL}" role="button" >Fatura Ekle</a>
</div>
</body>

