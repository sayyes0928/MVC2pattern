function addressFinder() {
        	  new daum.Postcode({
        	    oncomplete: function (data) {
        	     
        	      var addr = ''; 
        	      var extraAddr = ''; 
        	     

        	  
        	      if (data.userSelectedType === 'R') { 
        	        addr = data.roadAddress;
        	      } else { 
        	        addr = data.jibunAddress;
        	      }

        	
        	      if (data.userSelectedType === 'R') {
        	     
        	
        	        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
        	          extraAddr += data.bname;
        	        }
        	   
        	        if (data.buildingName !== '' && data.apartment === 'Y') {
        	          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        	        }
        	 
        	        if (extraAddr !== '') {
        	          extraAddr = ' (' + extraAddr + ')';
        	        }
        
        	        document.getElementById("order_received_at_detail").value =  extraAddr;

        	      } else {
        	        document.getElementById("order_received_at_post_code6").value = "";
        	      }

        	      document.getElementById('order_received_zip_code').value = data.zonecode;
        	      document.getElementById("order_received_at").value = addr;
        	      document.getElementById("order_received_at_detail").focus();
        	    }
        	  }).open();
}
