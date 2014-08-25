		<!--Clients Update / Add Form -->
		</script>
		      <div class="container">
        <form align= "center" class="form-signin" action="http://10.0.0.11:8080/VEF_CRM/controller/viewClient" method="get">
        <h2 align = "center" class="form-signin-heading">Add/Update Client Form</h2>
        <input type="text" class="form-control" placeholder="Client ID" required name="Clientid">
        <input type="text" class="form-control" placeholder="Company Code"  name="companyCode">
        <input type="text" class="form-control" placeholder="Company Name"   name="companyName">
         <input type="text" class="form-control" placeholder="Contact First Name" name="firstName">
          <input type="text" class="form-control" placeholder="Contact Last Name" name="lastName">
            <input type="text" class="form-control" placeholder="Phone Number"   name="phone">
			 <input type="text" class="form-control" placeholder="Email" name="email">
              <input type="text" class="form-control" placeholder="Address"   name="adress">
              <input class="btn-primary" type="submit" name="action1" value="Create New" onclick="alert('Creating New Client'); return true" />
              <input class="btn-primary" type="submit" name="action1" value="Update" onclick="alert('Updating Client'); return true;location.href='http://10.0.0.11:8080/VEF_CRM/controller/viewClient'" />
      </form>
      
      
      
      
      
      
      
      		<!--Add/update/new Form-->
 <form class="form-signin" action="http://10.0.0.11:8080/VEF_CRM/controller/viewTimlol" method="get">
        <h2 align = "center" class="form-signin-heading">Add/Update Transcribers</h2>
        <input type="text" class="form-control" placeholder="Timlol ID" required name="Timlolid">
        <input type="text" class="form-control" placeholder="Timlol Code"  name="timlolCode">
        <input type="text" class="form-control" placeholder="Timlol Price"   name="timlolPrice">
         <input type="text" class="form-control" placeholder="Contact First Name" name="firstName">
          <input type="text" class="form-control" placeholder="Contact Last Name" name="lastName">
            <input type="text" class="form-control" placeholder="Phone Number"   name="phone">
			 <input type="text" class="form-control" placeholder="Email" name="email">
              <input type="text" class="form-control" placeholder="Address"   name="adress">
              <input class="btn-primary" type="submit" name="action1" value="Create New" onclick="alert('Creating New Transcriber'); return true" />
              <input class="btn-primary" type="submit" name="action1" value="Update" onclick="alert('Updating Transcriber'); return true" />
      </form>
      
      
      <link rel="stylesheet" href="/VEF_CRM/view/css/bootstrap.min.css">
        <link rel="stylesheet" href="../view/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="../view/css/main.css">
        
        <script src="../view/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
   		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		
		
     	<script> window.jQuery || document.write('<script src="js/vendor/jquery-1.10.1.js"><\/script>')</script>
        <script src="../view/js/vendor/bootstrap.min.js"></script>
        <script type="text/javascript" src="../view/js/main.js"></script>