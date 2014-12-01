﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Validator</title>

   <%-- <link href="<%= Url.Content("~/Content/kendo/style/examples-offline.css")%>" rel="stylesheet" type="text/css" />--%>
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.common.min.css")%>" rel="stylesheet" />
    <link href="<%= Url.Content("~/Content/kendo/style/kendo.default.min.css")%>" rel="stylesheet" />

    <script src="<%= Url.Content("~/Content/kendo/js/jquery.min.js")%>"></script>
    <script src="<%= Url.Content("~/Content/kendo/js/kendo.web.min.js")%>"></script>
    <%--<script src="<%= Url.Content("~/Content/kendo/js/console.js")%>"></script>--%>
</head>
<body>
    <a class="offline-button" href="../index.html">Back</a>
    
        <div id="example" class="k-content">
        <div id="tickets">
            <h3>Book Tickets</h3>
            <ul>
                <li>
                    <label for="fullname" class="required">Your Name</label>
                    <input type="text" id="fullname" name="fullname" class="k-textbox" placeholder="Full name" required validationMessage="Please enter {0}" />
                </li>
                <li>
                    <label for="search" class="required">Movie</label>
                    <input type="search" id="search" name="search" required validationMessage="Please select movie"/><span class="k-invalid-msg" data-for="search"></span>
                </li>
                <li>
                    <label for="time">Start time</label>
                    <select name="time" id="time" required data-required-msg="Select start time">
                        <option>14:00</option>
                        <option>15:30</option>
                        <option>17:00</option>
                        <option>20:15</option>
                    </select>
                    <span class="k-invalid-msg" data-for="time"></span>
                </li>
                <li>
                    <label for="amount">Amount</label>
                    <input id="amount" name="Amount" type="text" min="1" max="10" value="1" required data-max-msg="Enter value between 1 and 10" />
                    <span class="k-invalid-msg" data-for="Amount"></span>
                </li>
                <li>
                    <label for="email" class="required">Email</label>
                    <input type="email" id="email" name="Email" class="k-textbox" placeholder="e.g. myname@example.net"  required data-email-msg="Email format is not valid" />
                </li>
                <li>
                    <label for="tel" class="required">Phone</label>
                    <input type="tel" id="tel" name="tel" class="k-textbox" pattern="\d{10}" placeholder="Please enter a ten digit phone number" required
                        validationMessage="Please enter a ten digit phone number"/>
                </li>
               <%-- <li  class="accept">
                    <input type="checkbox" name="Accept" required validationMessage="Acceptance is required" /> I accept the terms and condition of service
                </li>--%>
                <li  class="accept">
                    <button class="k-button" type="button">Submit</button>
                </li>
                <li class="status">
                </li>
            </ul>
        </div>

            <style scoped>

                .k-textbox {
                    width: 11.8em;
                }

                #tickets {
                    width: 510px;
                    height: 323px;
                    margin: 30px auto;
                    padding: 10px 20px 20px 170px;
                    /*background: url('../../content/web/validator/ticketsOnline.png') transparent no-repeat 0 0;*/
                }

                #tickets h3 {
                    font-weight: normal;
                    font-size: 1.4em;
                    border-bottom: 1px solid #ccc;
                }

                #tickets ul {
                    list-style-type: none;
                    margin: 0;
                    padding: 0;
                }
                #tickets li {
                    margin: 10px 0 0 0;
                }

                label {
                    display: inline-block;
                    width: 90px;
                    text-align: right;
                }

                .required {
                    font-weight: bold;
                }

                .accept, .status {
                    padding-left: 90px;
                }

                .valid {
                    color: green;
                }

                .invalid {
                    color: red;
                }
                span.k-tooltip {
                    margin-left: 6px;
                }
            </style>

            <script>
                $(document).ready(function() {
                    var data = [
                    "12 Angry Men",
                    "Il buono, il brutto, il cattivo.",
                    "Inception",
                    "One Flew Over the Cuckoo's Nest",
                    "Pulp Fiction",
                    "Schindler's List",
                    "The Dark Knight",
                    "The Godfather",
                    "The Godfather: Part II",
                    "The Shawshank Redemption"
                    ];

                    $("#search").kendoAutoComplete({
                        dataSource: data,
                        separator: ", "
                    });

                    $("#time").kendoDropDownList({
                        optionLabel: "--Start time--"
                    });

                    $("#amount").kendoNumericTextBox();

                    var validator = $("#tickets").kendoValidator().data("kendoValidator"),
                    status = $(".status");

                    $("button").click(function() {
                        if (validator.validate()) {
                            status.text("Hooray! Your tickets has been booked!")
                                .removeClass("invalid")
                                .addClass("valid");
                        } else {
                            status.text("Oops! There is invalid data in the form.")
                                .removeClass("valid")
                                .addClass("invalid");
                        }
                    });
                });
            </script>
        </div>

</body>
</html>
