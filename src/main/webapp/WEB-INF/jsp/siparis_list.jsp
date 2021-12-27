<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sipariş List</title>
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
        <ul>
            <li  class="active"><a href="/siparis/list">Sipariş Ekle</a></li>
        </ul>
    </div>
</nav>

<center><h1 style= "background-color: sandybrown;">Sipariş Ekranı</h1> </center>
<div class="container">
    <table class="table table-striped table-bordered table-sm">
        <thead class="thead-dark">
        <th scope="row">ID</th>
        <th scope="row">Kargo Firması</th>
        <th scope="row">Kargo Firması Adres</th>
        <th scope="row">Müşteri Ad</th>
        <th scope="row">Müşteri No</th>
        <th scope="row">Ürün</th>
        <th scope="row">Stok Miktarı</th>
        <th scope="row">Fatura No</th>
        <th scope="row">Fatura Tarihi</th>
        <th scope="row">Sipariş No</th>
        <th scope="row">Barkod No</th>
        <th scope="row">Sipariş Adedi</th>
        <th scope="row">Toplam Fiyat</th>
        <th scope="row">Güncelle</th>
        <th scope="row">Sil</th>

        </thead>
        <tbody>
        <c:forEach items="${siparisList}" var="siparis" >
            <tr>
                <td>${siparis.id}</td>
                <td>${siparis.kargofirmasi.ad}</td>
                <td>${siparis.kargofirmasi.adres}</td>
                <td>${siparis.musteri.ad} ${siparis.musteri.soyad}</td>
                <td>${siparis.musteri.musterino}</td>
                <td>${siparis.urun.adi}</td>
                <td>${siparis.urun.stokmiktari}</td>
                <td>${siparis.fatura.faturano}</td>
                <td><fmt:formatDate value="${siparis.fatura.tarih}" pattern="dd/MM/yyyy" /></td>
                <td>${siparis.siparisno}</td>
                <td>${siparis.barkodno}</td>
                <td>${siparis.siparisadedi}</td>
                <td>${siparis.urun.birimfiyat * siparis.siparisadedi}</td>



                <td>

                    <spring:url value="/siparis/editSiparis/${siparis.id}" var="editURL" />
                    <a class="btn btn-warning" href="${editURL}" role="button" >Güncelle</a>

                </td>

                <td>
                    <spring:url value="/siparis/deleteSiparis/${siparis.id}" var="deleteURL" />
                    <a class="btn btn-danger" href="${deleteURL}" role="button" >Sil</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <spring:url value="/siparis/addSiparis/" var="addURL" />
    <a class="btn btn-success" href="${addURL}" role="button" >Sipariş Ekle</a>
</div>
</body>

