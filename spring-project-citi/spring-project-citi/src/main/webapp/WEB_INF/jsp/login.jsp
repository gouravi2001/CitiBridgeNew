

<html>

<head>
<title>Login Page</title>
<link href="webjars/bootstrap/4.6.0/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

<style type="text/css">
  <%@include file="style.css" %>
  .alert{
  display:none
  }
  .alert-danger{
  display:none
  }
  .adjust{

position:relative;
top:20%;
text-align:center;
  }
  
</style>

</head>

<body>
	
	
	<h1 class="adjust">
  <a href="" class="typewrite" data-period="2000" data-type='[ "Finding stock trading hard?", "Now tracking and finding stocks got easier!!"]'>
    <span class="wrap"></span>
  </a>
</h1>
	<div class="login-form">
	<!--  
	<div class="alert alert-danger" role="alert" id="alerting">
  ${errorMsgs}
</div>
-->


		<p class="danger"> ${errorMsgs} </p>
		<div class="container-fluid">
			<form method="post" action="login">

				<div class="mt-3">
					<input type="text" class="form-control" name="userId"
						placeholder="User ID" />
				</div>
				<div class="mt-3">
					<input type="password" class="form-control" name="password"
						placeholder="Password" />
				</div>
				<button type="submit" class="btn btn-dark btn-block mt-3" >Login</button>
			</form>
		</div>
	</div>
<script>

function showalert(){
	document.getElementById("alerting").style.display="block";
}
var TxtType = function(el, toRotate, period) {
    this.toRotate = toRotate;
    this.el = el;
    this.loopNum = 0;
    this.period = parseInt(period, 10) || 2000;
    this.txt = '';
    this.tick();
    this.isDeleting = false;
};

TxtType.prototype.tick = function() {
    var i = this.loopNum % this.toRotate.length;
    var fullTxt = this.toRotate[i];

    if (this.isDeleting) {
    this.txt = fullTxt.substring(0, this.txt.length - 1);
    } else {
    this.txt = fullTxt.substring(0, this.txt.length + 1);
    }

    this.el.innerHTML = '<span class="wrap">'+this.txt+'</span>';

    var that = this;
    var delta = 200 - Math.random() * 100;

    if (this.isDeleting) { delta /= 2; }

    if (!this.isDeleting && this.txt === fullTxt) {
    delta = this.period;
    this.isDeleting = true;
    } else if (this.isDeleting && this.txt === '') {
    this.isDeleting = false;
    this.loopNum++;
    delta = 500;
    }

    setTimeout(function() {
    that.tick();
    }, delta);
};

window.onload = function() {
    var elements = document.getElementsByClassName('typewrite');
    for (var i=0; i<elements.length; i++) {
        var toRotate = elements[i].getAttribute('data-type');
        var period = elements[i].getAttribute('data-period');
        if (toRotate) {
          new TxtType(elements[i], JSON.parse(toRotate), period);
        }
    }
    // INJECT CSS
    var css = document.createElement("style");
    css.type = "text/css";
    css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
    document.body.appendChild(css);
};
</script>
	
</body>

</html>