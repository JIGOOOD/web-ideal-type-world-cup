$(document).ready(function(){
	var userName = localStorage.getItem('username');
    var winnerSubject = localStorage.getItem('winnerSubject');
    var winnerImage = localStorage.getItem('winnerImage');
    var winnerName = localStorage.getItem('winnerName');
    $(".winner-subject").text(winnerSubject);
    $(".winner-image").attr("src", winnerImage);
    $(".winner-text").text(winnerName);
    
    // Load main page.
    $(".main").click(function() {
  		window.location.href = "index.html";
	});
	
	$(".winner-button").click(function() {
		// Send infomation of winner to store in the database(winner_log table).
		$.ajax({
            type: "POST",
            url: "saveLog.jsp",
            data: {
				username: userName,
                subject: winnerSubject,
                imageUrl: winnerImage,
                text: winnerName
            },
            success: function(data) {
                alert('Winner information saved successfully!');
                // Send infomation of user to make the log table.
                $.ajax({
	                type: "POST",
	                url: "mylog.jsp",
	                data: {
	                    username: userName
	                },
	                success: function(data) {
	                    // If the first request is successful, navigate to the page.
          				// Pass the username as a query parameter in the URL.
          				window.location.href = "http://localhost:8080/FinalProject/mainPages/mylog.jsp?username=" + encodeURIComponent(userName);
	                }
	            });
            }
        });
	});
});
