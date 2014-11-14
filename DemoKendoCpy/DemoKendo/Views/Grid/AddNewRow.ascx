<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>


				<li>
                    <label for="ProductNameform" class="required">Your Name</label>
                    <input type="text" id="ProductNameform" name="ProductNameform" class="k-textbox" placeholder="Product name" required validationMessage="Please enter Product name" />
                </li>
				<li>
                    <label for="UnitPriceform">Unit in price</label>
                    <input id="UnitPriceform" name="UnitPriceform" type="text" min="1" value="1" required validationMessage="Please enter  unit in price"  />
                    <span class="k-invalid-msg" data-for="UnitPriceform"></span>
                </li>
				<li>
                    <label for="UnitStockform">Unit in stock</label>
                    <input id="UnitStockform" name="UnitStockform" type="text"  value="0" />
                    <span class="k-invalid-msg" data-for="UnitStockform"></span>
                </li>
				<li>
						<label for="Discontinuedform">Discontinued</label>
                        <input type="radio" name="Discontinuedform" value="true" checked> True
    					<input type="radio" name="Discontinuedform" value="false" > False
				</li>
				 <li>
                    <label for="Categoryform">Food Category</label>
                   	<input id="Categoryform" style="width: 300px" required validationMessage="Please select food ategory" />
                    <span class="k-invalid-msg" data-for="time"></span>
                </li>
				<li  class="accept">
                    <button class="k-button" type="button">Add new record</button>
                </li>
                 <li class="status">
                </li>
	<script>
	$(document).ready(function() {
	    var Categoryform = $("#Categoryform").kendoComboBox({
	        placeholder: "Select food Category...",
	        dataTextField: "Category",
	        dataValueField: "Category",
	        dataSource: SearchFOOD
	    }).data("kendoComboBox");

	    $("#UnitPriceform").kendoNumericTextBox();
	    $("#UnitStockform").kendoNumericTextBox();
	    var validator = $("#AddNew").kendoValidator().data("kendoValidator"),
                    status = $(".status");

	    $("#Submit").click(function() {

	        if (validator.validate()) {
	            // alert("Product name :" + $('#ProductNameform').val() + " Discontinue :" + $('input[name="Discontinuedform"]:checked').val() + " PriceUnit :" + $('#UnitPriceform').val() + " UnitStock :" + $('#UnitStockform').val() + " Food Category :" + $('#Categoryform').val());
	            var grid = $("#grid").data("kendoGrid");
	            var ins = { ProductID: 102, ProductName: $('#ProductNameform').val(), UnitPrice: $('#UnitPriceform').val(), UnitsInStock: $('#UnitStockform').val(), Discontinued: $('input[name="Discontinuedform"]:checked').val(), Category: $('#Categoryform').val() }; //id=1,rating=9.2,year=1995,title="The Godfather"
	            grid.dataSource.insert(ins);
	            status.text("Records added successdully").removeClass("invalid").addClass("valid");
	            $("#AddNew").data("kendoWindow").close();
	        } else {
	            status.text("Oops! There is invalid data in the form.")
                                .removeClass("valid")
                                .addClass("invalid");
	        }
	    });
	    }
	</script>