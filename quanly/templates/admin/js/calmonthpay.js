	var CalMonthPay = 
	{
		productID : 0,
		isZeroRate : false,
		rateCommon : 2 / 100,
		price : 0,
		listRate : new Object(),
		main : null,
		init : function()
		{
			//alert('inited') ;
			//this.main = new ModalPopup("divCalPerMonthPay", "Tính số tiền thanh toán hàng tháng", true); 
			CalMonthPay.main = new ModalPopup("divCalPerMonthPay", "Tính số tiền thanh toán hàng tháng", true); 
			//CalMonthPay.main = this.main ;
			//alert('done' + this.main) ;
			
			//alert(CalMonthPay + "-" + CalMonthPay.main + "-" + this.main) ;
		},		
		show : function(producttitle, productprice, productname)
		{
			//alert("this.main:" + this.main) ;
			this.isZeroRate = true ;//zeroRate.value.toLowerCase() == "true";
			var lblProductTitle = producttitle ;
			this.price = productprice ;
			//alert(productname + "-" + producttitle) ;
			
			var lblProductName = document.getElementById("lblProductName");//productname ;
			
			lblProductName.innerHTML = productname;
			var lblProductPrice =document.getElementById("lblProductPrice");
			lblProductPrice.innerHTML = utilObj.formatNumber(this.price, ".");//alert('kkk') ;
			//alert(this.price);
			//this.calPerMonthPay();
			//alert('kkk1') ;
			//alert("this.main:" + this.main) ;
			this.main.display();
			//alert('kkk2') ;
		},
		getRate : function()
		{
			if(this.isZeroRate) return 0;
			var cboCity = document.getElementById("cboCity");
			var cboType = document.getElementById("cboType");
			if(this.listRate[cboCity.value + "-" + cboType.value])
			{
				return parseFloat(this.listRate[cboCity.value + "-"+ cboType.value]);
			}
			return this.rateCommon;
		},
		calPerMonthPay : function()
		{
			//var rate = this.getRate();			
			var rate = 2.2/100 ;
			var paymentrating = document.getElementById("paymentrating");
			var cboPerPay = document.getElementById("cboPerPay");
			var cboTimePay = document.getElementById("cboTimePay");
			var lblPerpay = document.getElementById("lblPerpay");
			var lblPerMonthPay = document.getElementById("lblPerMonthPay");
			//alert('xxx') ;
			//var moneypercent = parseInt(this.price * parseFloat(cboPerPay.value), 10);
			//var paymonth = parseInt(((this.price - moneypercent) / parseInt(cboTimePay.value, 10) + (this.price - moneypercent) * rate), 10);			
			var moneypercent = parseInt(this.price * parseFloat(cboPerPay.value), 10);
			//var paymonth = (1+paymentrating.value*parseInt(cboTimePay.value, 10))*this.price/parseInt(cboTimePay.value, 10) ;
			//alert(this.price + "-" + moneypercent + (this.price - moneypercent) + "-" + cboTimePay.value + "-" + rate) ;
			var paymonth = parseInt(((this.price - moneypercent) / parseInt(cboTimePay.value, 10) + (this.price - moneypercent) * rate), 10);
			//alert(			
			//alert('xxx') ;
			//lblPerpay.innerHTML = format_number(Math.round(moneypercent / 1000) * 1000);
			//lblPerMonthPay.innerHTML = format_number(Math.round(paymonth / 1000) * 1000);
			//lblPerpay.innerHTML = utilObj.formatNumber(Math.round(moneypercent / 1000) * 1000, ".");
			//lblPerMonthPay.innerHTML = utilObj.formatNumber(Math.round(paymonth / 1000) * 1000, ".");
			lblPerpay.innerHTML = utilObj.formatNumber(Math.round(moneypercent / 1000) * 1000, ".");
			lblPerMonthPay.innerHTML = utilObj.formatNumber(Math.round(paymonth), ".");
			//alert('aaa') ;
		}
	};
/*
	utilObj.addEvent(window, "load", function(e) {
		CalMonthPay.init();
	});
	*/