$(document).ready(function(){
	$('#username, #password').keyup(function(){
		if(validateForm()){
			$('#Submit').removeClass('disabled');
		}
		else{
			$('#Submit').addClass('disabled');
		}
	});
	
	function validateForm(){
		if($.trim($('#username').val()).length && $.trim($('#password').val()).length){
			return true;
		}
		else{
			return false;
		}
	}
	
	$('#Submit').click(function(){
		let data;
		$('#loader').show();
		$('#Submit').addClass('disabled');
		
		//frmData = $('#Login_Form').serialize();
		
		//$('#Username').prop('disabled','true');
		//$('#Password').prop('disabled','true');
		
		/*$.post( "/security/validate", frmData, function(data){
				console.log('here');
		});*/
		$('#loginform').submit();
	});
});