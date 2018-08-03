<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <button onclick="doWork(); return false; ">Do Work</button>
        <button onclick="doSquare(); return false; ">Do Square</button>
        <input type ="text" id="squareValue" />
        <button onclick="doAddValues(); return false;">Do AddValues</button>
        <input type ="text" id="addValue1" />
        <input type ="text" id="addValue2" />

    </div>

    <script type="text/javascript">

        function doWork() {
            console.info("Hello");

            $.ajax({
                url: "Service/Service1.svc/DoWork",
                type: "GET",
                dataType: "json",
                success: function (result) {
                    console.info(result);
                }
            });
        }

        function doSquare() {
            var value = $("#squareValue").val();
            $.ajax({
                url: "Service/Service1.svc/DoSquare",
                type: "POST",
                data: JSON.stringify(value),
                dataType: "json",
                contentType: "application/json",
                success: function (result) {
                    console.info(result);
                }
            });
        }

        function doAddValues() {
            var value = {
                "value1": $("#addValue1").val(),
                "value2": $("#addValue2").val(),
            }
            $.ajax({
                url: "Service/Service1.svc/DoAddValues",
                type: "POST",
                data: JSON.stringify(value),
                dataType: "json",
                contentType: "application/json",
                success: function (result) {
                    console.info(result);
                }
            });
        }
    </script>

</asp:Content>
