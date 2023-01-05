<?php
    $username = $_POST['username'];
	$password = $_POST['password'];

	// doğru kullanıcı adı ve şifre
	$json_data = [
		'name' => $username,
		'password' => $password
	];
	 
	 // JSON verisini aşağıdaki şekilde diziye çevirin
	//  $data = http_build_query($json_data);
	 
	//  // POST isteğini gönderin
	 $curl = curl_init();
	 
	 curl_setopt($curl, CURLOPT_URL, 'http://ec2-3-69-23-93.eu-central-1.compute.amazonaws.com:3000/api/admin/signin');
	 curl_setopt($curl, CURLOPT_POST, 1);
	 curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($json_data));
	 curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
	 curl_setopt($curl, CURLOPT_HTTPHEADER, [
		'Content-Type: application/json',
		
	  ]);

	 $result = curl_exec($curl);
	
	 if ($result === false) {
		$error = curl_error($curl);
		echo $error;
		// do something with the error
	  }
	  
	 curl_close($curl);
	 
	 // Cevabı ekrana yazdırın
	 
	  //$result = file_get_contents("http://192.168.10.4:3000/api/admin/signin", false, "name");
	  
	  // Cevabı yazdırın
	  
	
	 
	  // Cevabın doğruluğunu kontrol etmek için, cevabı bir dizi olarak değerlendirin
	  //$responseData = json_decode($result, true);
	  
	  // Eğer cevap başarılı ise, doğruluğu true olarak işaretleyin
	  
	  if (strcmp(strtolower($result), "\"okey\"") == 0) {
		header('Location: drivers.html');
		
	  }
      else {
		
		$script = '<script>alert("Wrong Username or Password")</script>';
		$html =file_get_contents('singup.html');
		
		echo $html.$script;
		//header('Location: $html +');
	  }
	 
	  
    
	  
	  
	  

	
?>