$(document).ready(function(){
	// Save world cup round state.
	function saveState(candidates, nextRoundCandidates, index) {
	    localStorage.setItem('worldcupState', JSON.stringify({candidates, nextRoundCandidates, index}));
	}
	
	// Load world cup round state.
	function loadState() {
	    var state = JSON.parse(localStorage.getItem('worldcupState'));
	    if (state) {
	        startWorldcup(state.candidates, state.nextRoundCandidates, state.index);
	    }
	}

	// Play the seleted worldcup.
	$(".card-button").click(function() {
		if($('#login').text() === "Log Out"){
			localStorage.setItem('buttonId', this.id);
	  		loadState();
	  		window.location.href = "playWorldcup.html";
		}
		else{
			alert("Please log in.");
		}
  		
	});
	
	// Check local storage when page loads.
    var username = localStorage.getItem('username');
    if (username) {
        // If the user name is saved, show the logout button.
        $('#login').text('Log Out');
    }
    
    // Load main page.
	$(".main").click(function() {
  		window.location.href = "index.html";
	});
	
	// Load different pages depending on whether you're logged in or not.
	$(".log").click(function() {
		if ($('#login').text() === 'Log Out') {
			var userName = localStorage.getItem('username');
	        window.location.href = "http://localhost:8080/FinalProject/mainPages/mylog.jsp?username=" + encodeURIComponent(userName);
	    }
	    else{
			alert("Please log in.");
		}
	});
	
	// Sign up
	$("#signup").click(function() {
  		window.location.href = "http://localhost:8080/FinalProject/mainPages/signup.jsp";
	});
	
	// Login
	$('#login').click(function() {
	    if ($('#login').text() === 'Log Out') {
	        // Remove username from local storage when trying to log out.
	        localStorage.removeItem('username');
	        $('#login').text('Log In');
	    }
	    else{
			window.location.href = "http://localhost:8080/FinalProject/mainPages/login.jsp";
		}
	});
	
	// Save sign up info in database.
	$('#signupForm').on('submit', function(event) {
	    event.preventDefault();
	
	    var username = $('#username').val();
	    var password = $('#password').val();
	    var confirmPassword = $('#password-confirm').val();
	
	    if (username && password && confirmPassword) {
	        if (password !== confirmPassword) {
	            alert('Passwords do not match.');
	        } else {
	            // AJAX call to send the form data to your server
	            $.ajax({
	                type: "POST",
	                url: "validate_signup.jsp",
	                data: {
	                    username: username,
	                    password: password
	                },
	                success: function(response){
	                    alert('Form submitted successfully.');
	                    window.location.href = "http://localhost:8080/FinalProject/mainPages/login.jsp";
	                },
	                error: function(){
	                    alert('Error occurred while submitting form.');
	                }
	            });
	        }
	    } else {
	        alert('All fields are required.');
	    }
	});
	
	// Load user info in database.
	$('#loginForm').on('submit', function(event) {
		event.preventDefault();
		
		$.ajax({
		    type: "POST",
		    url: "validate_login.jsp",
		    data: {
		        username: $('#username').val(),
		        password: $('#password').val()
		    },
		    success: function(response){
		        // 로그인이 성공하면 username을 로컬 스토리지에 저장
		        localStorage.setItem('username', $('#username').val());
		        alert('Form submitted successfully.');
		        $('#login').text('Log Out');
		        window.location.href = "index.html";
		    },
		    error: function(){
		        alert('Error occurred while submitting form.');
		    }
		});
	});

});
