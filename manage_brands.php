<?php
require('top.inc.php');
$brands='';
$msg='';
if(isset($_GET['id']) && $_GET['id']!=''){
	$id=get_safe_value($con,$_GET['id']);
	$res=mysqli_query($con,"select * from brands where id='$id'");
	$check=mysqli_num_rows($res);
	if($check>0){
		$row=mysqli_fetch_assoc($res);
		$brands=$row['brands'];
	}else{
		header('location:brands.php');
		die();
	}
}

if(isset($_POST['submit'])){
	$brands=get_safe_value($con,$_POST['brands']);
	$res=mysqli_query($con,"select * from brands where brands='$brands'");
	$check=mysqli_num_rows($res);
	if($check>0){
		if(isset($_GET['id']) && $_GET['id']!=''){
			$getData=mysqli_fetch_assoc($res);
			if($id==$getData['id']){
			
			}else{
				$msg="Brand already exist";
			}
		}else{
			$msg="Brand already exist";
		}
	}
	
	if($msg==''){
		if(isset($_GET['id']) && $_GET['id']!=''){
			mysqli_query($con,"update brands set brands='$brands' where id='$id'");
		}else{
			mysqli_query($con,"insert into brands(brands,status) values('$brands','1')");
		}
		header('location:brands.php');
		die();
	}
}
?>
<div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Brands</strong><small> Form</small></div>
                        <form method="post">
							<div class="card-body card-block">
							   <div class="form-group">
									<label for="brands" class=" form-control-label">Brands</label>
									<input type="text" name="brands" placeholder="Enter Brand name" class="form-control" required value="<?php echo $brands?>">
								</div>
							   <button id="payment-button" name="submit" type="submit" class="btn btn-lg btn-info btn-block">
							   <span id="payment-button-amount">Submit</span>
							   </button>
							   <div class="field_error"><?php echo $msg?></div>
							</div>
						</form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
<?php
require('footer.inc.php');
?>