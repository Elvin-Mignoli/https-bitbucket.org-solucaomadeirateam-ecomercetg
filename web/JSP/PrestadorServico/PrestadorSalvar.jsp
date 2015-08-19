<%-- 
    Document   : PrestadorSalvar
    Created on : 21/07/2015, 20:21:29
    Author     : Felipe Monteiro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
 <!-- Importando jquery-->
        <script src="../../js/libs/jquery-1.11.1.min.js"></script>
        <script src="../../js/libs/jquery-ui.min.js"></script>
        <script src="../../js/libs/jquery.maskedinput.js"></script>
<html>
    <head>
         <!--Meta -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="Cadastrar Prestador de Serviço" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
 
         <!-- implementando bootstrap na página -->
        <script src="../../bootstrap/dist/js/bootstrap.min.js"></script>

        <!-- implementando CSS do bootstrap -->
        <link rel="stylesheet" href="../../bootstrap/dist/css/bootstrap.min.css" />
        <script src="../../js/ajaxFuntions.js"></script>
        <script src="../../js/ajaxLoadingMenu.js" type="text/javascript"></script>
        <title>Cadastrar Prestador de Serviço</title>
        
        <!--Mask -->
        <script>
            $(document).ready(function(){
                $("#input_cpf").mask("999.999.999-99");
                $("#input_cnpj").mask("99.999.999/9999-99");
                $("#numero").blur(function () {
                    $("#input_nome").focus();
                });
            })
        </script>
    </head>
    <body>
        <div class="page-header text-center">
            <h1>Cadastro do Prestador de serviço</h1>
        </div>
        
         <!-- DIV CONTAINER DA APLICAÇÂO -->
        <div class="container">
            <form id="form_cadastro" method="POST" action="SalvarPrestador">
                <div class="row">
                    <input type="text" hidden="true" name="operacao" value="Salvar"/>
                    <div class="panel panel-success col-lg-5">
                        <div class="panel panel-heading text-center">Informações Pessoais</div>
                        <div class="panel-body">
                            <!-- Conteudo dos Panels! -->
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Nome</span>
                                    <input type="text" required="required" name="txtNome" class="form-control" placeholder="Digite seu Nome" value="${requestScope.prestador.nome}"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Sobrenome</span>
                                    <input type="text" name="txtSobrenome" class="form-control" placeholder="Digite seu Sobrenome" required="required" value="${requestScope.prestador.sobrenome}"/>
                                </div>
                            </div>
                                <script>
                                     $("#input_cnpj").on("click",function(e))
                                    {
                                      alert("oi");
                                         $("#input_cpf").addClass("disabled");
                                          alert("oi");
                                    });
                                </script>  
                            <div class="form-group" id="div_cpf">
                                <!--Status CPF -->
                                <div id="statusCPF"></div>
                                <div class="input-group">
                                    <span class="input-group-addon">CPF</span>
                                    <input type="text" name="txtCpf" class="form-control" id="input_cpf"  value="${requestScope.prestador.cpf}" onchange="validaCPF()"/>
                                     <span id="span_cpf"></span>
                                </div>
                            </div>
                           <div class="form-group" id="div_cnpj">
                                <div class="input-group">
                                    <span class="input-group-addon">CNPJ</span>
                                    <input type="text" name="txtCnpj" class="form-control" id="input_cnpj"  value="${requestScope.prestador.cnpj}"/>
                                </div>
                            </div>     
                        </div>
                    </div>

                    <div class="col-sm-1"></div> <!-- Um pequeno SPAN -->

                    <!-- -------------------------------------------- -->
                    <div class="panel panel-primary col-lg-5">
                        <div class="panel panel-heading text-center">Informações de Login</div>
                        <div class="panel-body">
                            
                            <div id="statusEmail">

                            </div>
                            <div class="form-group" id="div_email">
                                <div class="input-group">
                                    <span class="input-group-addon">Email</span>
                                    <input type="email" required="required" name="txtLogin" class="form-control" value="${requestScope.prestador.email}" id="input_email" onchange="validaEmail()"/>
                                </div>
                                <span id="span_email"></span>
                            </div>

                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Senha</span>
                                    <input type="password" required="required" name="txtSenha" class="form-control"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">Confirmar Senha</span>
                                    <input type="password" required="required" name="txtSenha2" class="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div> <!-- Fim do ROW!-->

                <div class="row center-block">
                    <div class="form-group">
                        <div class="form-inline">
                            <input type="submit" value="Cadastrar!" class="btn btn-success" />
                            <a href="../../index.jsp" class="btn btn-primary">Voltar</a>
                        </div>
                    </div>
                </div>
            </form>

            <!-- Mensagens das operacoes -->
            <c:if test="${requestScope.MsgSalvarCliente ne null}">
                <c:forEach var="alert" items="${requestScope.MsgSalvarCliente}">
                    <div class="alert alert-danger">
                        ${alert}
                    </div>
                </c:forEach>
            </c:if>

            <c:if test="${requestScope.MsgSucess ne null}">
                <c:forEach var="alert" items="${requestScope.MsgSucess}">
                    <div class="alert alert-success">
                        ${alert}
                    </div>
                </c:forEach>
            </c:if>
        </div>

    </body>
    </html>
