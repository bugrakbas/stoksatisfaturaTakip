<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Müşteri List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<body background="https://miro.medium.com/max/1200/1*dP81IJq-tGFxy1rIK3RYsg.png">


<center><h1 style= "background-color: sandybrown;">Müşteri Ekranı</h1> </center>
<div class="container">
    <table class="table table-striped table-bordered table-sm">
        <thead class="thead-dark">
        <th scope="row" style="color: white">ID</th>
        <th scope="row" style="color: white">Şehir Kodu</th>
        <th scope="row" style="color: white">Müşteri No</th>
        <th scope="row" style="color: white">Tc Kimlik No</th>
        <th scope="row" style="color: white">Müşteri Ad Soyad</th>
        <th scope="row" style="color: white">Müşteri Şifre</th>
        <th scope="row" style="color: white">Müşteri Kullanıcı Adı</th>
        <th scope="row" style="color: white">Müşteri Adres</th>
        <th scope="row" style="color: white">Güncelle</th>
        <th scope="row" style="color: white">Sil</th>
        </thead>
        <tbody>
        <c:forEach items="${musteriList}" var="musteri" >
            <tr>
                <td>${musteri.id}</td>
                <td>${musteri.iller.iladi}</td>
                <td>${musteri.musterino}</td>
                <td>${musteri.tckimlikno}</td>
                <td>${musteri.ad} ${musteri.soyad}</td>
                <td>${musteri.sifre}</td>
                <td>${musteri.kullaniciadi}</td>
                <td>${musteri.adres}</td>


                <td>

                    <spring:url value="/musteri/editMusteri/${musteri.id}" var="editURL" />
                    <a class="btn btn-warning" href="${editURL}" role="button" >Güncelle</a>

                </td>

                <td>
                    <spring:url value="/musteri/deleteMusteri/${musteri.id}" var="deleteURL" />
                    <a class="btn btn-danger" href="${deleteURL}" role="button" >Sil</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <spring:url value="/musteri/addMusteri/" var="addURL" />
    <a class="btn btn-success" href="${addURL}" role="button" >Müşteri Ekle</a>
    <spring:url value="http://localhost:8080/" var="editUrl" />
    <a class="btn btn-danger" href="${editUrl}" role="button">Ana Sayfaya Dön</a>
</div>
</body>

