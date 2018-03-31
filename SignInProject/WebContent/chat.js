$(document).ready(function(){
	var last_message_id = '0';
	// 1. get last chat message id
	$.ajax({
		url: "chatServlet",
		async: true, 
		cache: false,
		type: "get",
		Accept:"application/json",
		dataType: "json",
		data: {
			action: "get" 
		},
		beforeSend: function(xhr){
			//resp.html("Please wait...");
			//console.log("----Please wait...");
		},
		success:function(data){
			if((typeof data["last_message_id"]) != "undefined") {
				last_message_id = data["last_message_id"];
				$('#last_message_id').val(last_message_id);
			}
			else {
				$('#last_message_id').val();
			}
			//console.log('successfully');
			//console.log(data["phone"]);
			//$.each(data, function(index, element) {
				//console.log(index + "==>" + element.name + ":" + element.value);
			//});
		},
		error:function(error){
			console.log('error...');
		},
	});
	
	// 2. write message to database
	$("#send").click(function(e){
		var message = $('#message').val();
		message = message.trim();
		if(message != '') {
			//var last_message_id = $('#last_message_id').val();
			//var user_id = $('#user_id').val();
			var auction_id = $('#auction_id').val();
			var message = $('#message').val();
			var user_name = $('#user_name').val();
			var color = $('#color').val();

			$.ajax({
				url: "chatServlet",
				async: true, 
				cache: false,
				type: "get",
				Accept:"application/json",
				dataType: "json",
				data: {
					action: "write" ,
					//last_message_id: last_message_id,
					//user_id: "22",
					auction_id: auction_id,
					message: message,
					color: color,
					user_name: user_name
				},
				beforeSend: function(xhr){
					//resp.html("Please wait...");
					//console.log("----Please wait...");
				},
				success:function(data){
					// process response data
					//console.log('ssssss...');
					// update last_message_id
					last_message_id = data["last_message_id"];
					$('#last_message_id').val(last_message_id);
					
					var str_message = $('#chatmessage').html();
					str_message += '<span style="color:' + color + '">' + 
						data["message_date"] + ' ' + user_name + ': ' + message + 
						'</span>' + '<br>';
					$('#chatmessage').html(str_message);
					//$('#chatmessage').scrollTop($('#chatmessage').prop("scrollHeight"));
					$("#chatmessage").animate({ scrollDown: $('#chatmessage').prop("scrollHeight")}, 1000);
					
					$('#message').val("");
				},
				error:function(error){
					console.log('error...');
				},
			});			
			
		}
	});

	// 3. read chat messages from database
	setInterval(function(){chat_read();}, 1000);

	function chat_read(){
		var auction_id = $('#auction_id').val();
		//var last_message_id = $('#last_message_id').val();
		//var user_id = "66";
		//var user_name = "wang";
		//var color = "555";
		
		$.ajax({
			url: "chatServlet",
			async: true, 
			cache: false,
			type: "get",
			Accept:"application/json",
			dataType: "json",
			data: {
				action: "read" ,
				auction_id: auction_id,
				last_message_id: last_message_id
				//user_id: user_id,
				//user_name: user_name,
				//color: color,
			},
			beforeSend: function(xhr){
				//resp.html("Please wait...");
				//console.log("----Please wait...");
			},
			success:function(data){
				console.log('sssss...');
				
				var tmp_last_message_id = '0';
				$.each(data, function (index, element) {
					tmp_last_message_id = element["id"];
					
					var str_date = element["dateCreated"];
					
					str_date = str_date.substr(0, 19);
					str_date = str_date.replace("-", "/");
					
					
					
					var str_message = $('#chatmessage').html();
					str_message += '<span style="color:' + element["color"] + '">' + 
					str_date + ' ' + element["userName"] + ': ' + element["message"] + 
						'</span>' + '<br>';

					$('#chatmessage').html(str_message);
					//$('#chatmessage').scrollTop($('#chatmessage').prop("scrollHeight"));
					$("#chatmessage").animate({ scrollTop: $('#chatmessage').prop("scrollHeight")}, 1000);
				});
				if(tmp_last_message_id != '0') {
					last_message_id = tmp_last_message_id;
					$('#last_message_id').val(last_message_id);
				
				}
					

				
				// Loop who data array
				// process response data
				//var strmessage = '';
				//strmessage += data["date_created"] + ' ';
				//strmessage += data["user_name"] + ': ';
				//strmessage += data["message"];
				//strmessage += '<br>';
				//$('#divmessage').append();
				
				// update last_message_id
				//$('#last_message_id').val(data["last_message_id"]);
				//if((typeof data["last_message_id"]) != "undefined") {
					//$('#last_message_id').val(data["last_message_id"]);
				//}
				//else {
					//$('#last_message_id').val();
				//}
				//console.log('successfully');
				//console.log(data["phone"]);
				//$.each(data, function(index, element) {
					//console.log(index + "==>" + element.name + ":" + element.value);
				//});
			},
			error:function(error){
				console.log('error...');
			},
		});
	}
	
	$("#clear").click(function(e){
		$('#chatmessage').html('');
	});

});

