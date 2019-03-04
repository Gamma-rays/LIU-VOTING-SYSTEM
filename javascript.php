<!DOCTYPE html>
<html>
<body>

<h1>JavaScript Can Validate Input</h1>

<p>Please input a number between 1 and 10:</p>

<input id="numb">

<button type="button" onclick="myFunction()">Submit</button>

<p id="demo"></p>

<script>
    def validateInput{
            var Uname = docment.getElementById("numb").value;
            if (Uname == null || Uname == ""){
                window.alert("Please note the User Name is required");
                return false;
            }
        }

</script>

</body>

<!-- Mirrored from www.w3schools.com/js/tryit.asp?filename=tryjs_validation_number by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 07 Oct 2016 14:05:29 GMT -->
</html> 