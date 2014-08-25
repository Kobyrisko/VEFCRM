<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/Java_Pro_EE/view/ico/favicon.png">

    <title>Signin To Liran and Koby's Project</title>

    <!-- Bootstrap core CSS -->
    <link href="/Final_Pro_EE/view/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../view/css/signin.css" rel="stylesheet">
    
  </head>
  <body>
    <div class="container">
      <form class="form-signin" action="http://localhost:8080/Final_Pro_EE/controller/UserCheck" method="get">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" class="form-control" placeholder="Username" required autofocus name="Username">
        <input type="password" class="form-control" placeholder="Password" required name="Password">
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
  <select class="selectpicker remove-example">
    <option value="Mustard">Mustard</option>
    <option value="Ketchup">Ketchup</option>
    <option value="Relish">Relish</option>
  </select>
 
<button class="btn btn-warning rm-mustard">Remove Mustard</button>
<button class="btn btn-danger rm-ketchup">Remove Ketchup</button>
<button class="btn btn-success rm-relish">Remove Relish</button>
 
  $('.rm-mustard').click(function() {
    $('.remove-example').find('[value=Mustard]').remove();
    $('.remove-example').selectpicker('refresh');
  });
      </form>
    </div> 
  </body>
</html>
