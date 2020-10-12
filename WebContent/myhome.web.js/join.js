
     $(document).ready(function () {
          $("#nick_check").change(function () {
            var inid2 = document.myform.nick.value;
            $.ajax({
              url: 'NickName_check.bo',
              data: {
                'NICK': inid2
              },
 
              success: function (req) {
                if (req == "중복된 닉네임이 있습니다.") {
                  $("#ok2").html(req);
                } else {
                  $("#ok2").html(req);
                }
              }

            });
          });
        });
  
     $(document).ready(function () {
          $("#id_check").change(function () {
        	
            var inid = document.myform.id.value;
            $.ajax({
              url: 'ID_check.bo',
              data: {
                'ID': inid
              },
             
              success: function (req) {
            	  
                if (req == "중복된 아이디가 있습니다.") {
          
                 $("#ok").html(req);
                } else {
                
                  $("#ok").html(req);
                }
              }

            });
          });
        });

      
        function password_check() {
        	  var pw = myform.pw.value;
        	  var pw_check = myform.pw_check.value;
        	  if (pw != pw_check) {
        	    document.getElementById("same").innerHTML = " 비밀번호 값이 일치하지 않습니다.";
        	    document.getElementById("same").style.color = "rgb(207, 0, 0)";
        	    myform.pw.value="";
        	    myform.pw_check.value="";
        	    myform.pw.focus();
        	  }
        	  else{
        	    document.getElementById("same").innerHTML = " 비밀번호 값이 일치합니다.";
        	    document.getElementById("same").style.color = "rgb(12, 78, 147)";
        	  }
        	}

        	function emailauto(e_addr) {
        	  var mail = "";
        	  if (e_addr.options[0].selected) {
        	    mail = "";
        	  }
        	  else {
        	    mail = e_addr.value
        	  }
        	  myform.email2.value = mail;
        	}

        	function out() {

        	  var id = document.myform.id.value;
        	  var pw = document.myform.pw.value;
        	  var pw_check = document.myform.pw_check.value;
        	  var name = document.myform.name.value;
        	  var nick = document.myform.nick.value;
        	  var year = document.myform.year.value;
        	  var month = document.myform.month.value;
        	  var day = document.myform.day.value;
        	  var postcode = document.myform.postcode.value;
        	  var addr1 = document.myform.addr1.value;
        	  var addr2 = document.myform.addr2.value;
        	  var addr3 = document.myform.addr3.value;
        	  var phon1 = document.myform.phon1.value;
        	  var phon2 = document.myform.phon2.value;
        	  var phon3 = document.myform.phon3.value;
        	  var sms_agree = document.myform.sms_agree.value;
        	  var email1 = document.myform.email1.value;
        	  var email2 = document.myform.email2.value;
        	  var email_agree = document.myform.email_agree.value;
        	  var agree1 = document.myform.agree1.checked;
        	  var agree2 = document.myform.agree2.checked;
        	  var ID_Overlap = document.getElementById('ok').innerHTML;
        	  var NICK_Overlap = document.getElementById('ok2').innerHTML;
              var testpro = $('#profile_img').val();
              
              if(!testpro){
            	  alert("프로필 사진을 첨부해주세요!");
          	    return;
              }
        	  
        	  if (id == "") {
        	    alert("아이디를 써주세요");
        	    return;
        	  }
        	
        	  if (pw == "") {
        	    alert("비밀번호를 써주세요");
        	    return;
        	  }

        	  if (pw_check == "") {
        	    alert("비밀번호 확인을 써주세요");
        	    return;
        	  }

        	  if (name == "") {
        	    alert("이름 써주세요");
        	    return;
        	  }

        	  if (nick == "") {
        	    alert("닉네임을 써주세요");
        	    return;
        	  }
        	  
        	 
        	  
        	
        	  if (year == "" || month == "" || day == "") {
        	    alert("생년월일을 써주세요");
        	    return;
        	  }

        	  if (phon2 == "" || phon3 == "") {
        	    alert("휴대폰 번호를 써주세요");
        	    return;
        	  }

        	  if (postcode == "" || addr1 == "" || addr2 == "" || addr3 == "") {
        	    alert("주소를 써주세요");
        	    return;
        	  }

        	  if (email1 == "" || email2 == "") {
        	    alert("이메일을 써주세요");
        	    return;
        	  }

        	  if (agree1 == false) {
        	    alert("이용정보동의를 체크해주세요");
        	    return;
        	  }

        	  if (agree2 == false) {
        	    alert("개인정보이용동의를 체크해주세요");
        	    return;
        	  }
        	  
        	  if (ID_Overlap == "중복된 아이디가 있습니다.") {
            	 alert("아이디를 다시 써주세요");
            	 myform.id.focus();
            	 return;
              }
        	  
        	  if (NICK_Overlap == "중복된 닉네임이 있습니다.") {
             	 alert("닉네임을 다시 써주세요");
             	 myform.nick.focus();
             	 return;
               }
             
        	  myform.submit();
        	}

        	function sample6_execDaumPostcode() {
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
        
        	        document.getElementById("sample6_extraAddress").value = extraAddr;

        	      } else {
        	        document.getElementById("sample6_extraAddress").value = '';
        	      }

        	      document.getElementById('sample6_postcode').value = data.zonecode;
        	      document.getElementById("sample6_address").value = addr;
        	      document.getElementById("sample6_detailAddress").focus();
        	    }
        	  }).open();
        	}
        