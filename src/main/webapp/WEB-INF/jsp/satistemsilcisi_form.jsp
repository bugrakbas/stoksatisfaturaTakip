<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Admin Ekle</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body background="https://wallpaperaccess.com/full/16668.jpg">
<body>

<div class="container">
    <spring:url value="/satistemsilcisi/addSatistemsilcisi" var="addURL" />
    <h2>Admin Ekle</h2>
    <form:form modelAttribute="satistemsilcisiForm" method="post" action="${addURL}" cssClass="form" >
        <form:hidden path="id"/>
        <div class="form-group">
            <label>Tc Kimlik No</label>
            <form:input path="tckimlikno" cssClass="form-control" id="tckimlikno" />
        </div>
        <div class="form-group">
            <label>Ad</label>
            <form:input path="ad" type="string" cssClass="form-control" id="ad" />
        </div>

        <div class="form-group">
            <label>Soyad</label>
            <form:input path="soyad" type="string" cssClass="form-control" id="soyad" />
        </div>

        <div class="form-group">
            <label>Şifre</label>
            <form:input path="sifre" type="string" cssClass="form-control" id="sifre" />
        </div>

        <div class="form-group">
            <label>Kullanıcı Adı</label>
            <form:input path="kullaniciadi" type="string" cssClass="form-control" id="kullaniciadi" />
        </div>

        <button type="submit" class="btn btn-success">Admin Ekle</button>
    </form:form>

</div>
</body>
