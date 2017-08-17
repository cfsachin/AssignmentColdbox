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
	
	$('#Logout').click(function(){
		let url;

		url = $('#logoutform').prop('action');
		
		$.post( url,function(data){
			let response = JSON.parse(data);
			if(response.SUCCESS){
				$('#rowloginform').show();
				$('#loggedUsername').html('');
				$('#rowlogoutform').hide();
				$('.cbox_messagebox_error').hide();
				$('.cbox_messagebox_error').html('');
			}
			else{
				$('#rowlogoutform').show();
				$('#rowloginform').hide();
				$('#cbox_messagebox_error').show();
				$('#cbox_messagebox_error').html(response.MESSAGE);
			}
		});	
		
	});
	
	$('#Submit').click(function(){
		let frmData;
		let url;
		$('#loader').show();
		$('#Submit').addClass('disabled');
		
		frmData = $('#loginform').serialize();
		
		url = $('#loginform').prop('action');
		
		$.post( url, frmData, function(data){
			let response = JSON.parse(data);
			$('#loader').hide();
			if(response.SUCCESS){
				$('#rowloginform').hide();
				$('#loggedUsername').html(response.MESSAGE);
				$('#rowlogoutform').show();
				$('.cbox_messagebox_error').hide();
				$('#username').val('');
				$('#password').val('');				
			}
			else{
				$('#rowlogoutform').hide();
				$('#rowloginform').show();
				$('#cbox_messagebox_error').show();
				$('#cbox_messagebox_error').html(response.MESSAGE);
			}
		});
	});
});