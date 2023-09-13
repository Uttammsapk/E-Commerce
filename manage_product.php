<?php
require('top.inc.php');
$categories_id='';
$name='';
$mrp='';
$price='';
$qty='';
$image='';
$short_desc	='';
$description	='';
$brands_id=''; 
$multipleImageArr=[];

$msg='';
$image_required='required';

if(isset($_GET['pi']) && $_GET['pi']>0){
	$pi=get_safe_value($con,$_GET['pi']);
	$delete_sql="delete from product_images where id='$pi'";
	mysqli_query($con,$delete_sql);
}

if(isset($_GET['id']) && $_GET['id']!=''){
	$image_required='';
	$id=get_safe_value($con,$_GET['id']);
	$res=mysqli_query($con,"select * from product where id='$id'");
	$check=mysqli_num_rows($res);
	if($check>0){
		$row=mysqli_fetch_assoc($res);
		$categories_id=$row['categories_id'];
		$name=$row['name'];
		$mrp=$row['mrp'];
		$price=$row['price'];
		$qty=$row['qty'];
		$short_desc=$row['short_desc'];
		$description=$row['description'];
		$brands_id=$row['brands_id'];
		$image=$row['image'];

		$resMultipleImage=mysqli_query($con,"select id,product_images from product_images where product_id='$id'");
		if(mysqli_num_rows($resMultipleImage)>0){
			$jj=0;
			while($rowMultipleImage=mysqli_fetch_assoc($resMultipleImage)){
				$multipleImageArr[$jj]['product_images']=$rowMultipleImage['product_images'];
				$multipleImageArr[$jj]['id']=$rowMultipleImage['id'];
				$jj++;
			}
		}
	}else{
		header('location:product.php');
		die();
	}
}

if(isset($_POST['submit'])){
	// prx($_FILES);
	$categories_id=get_safe_value($con,$_POST['categories_id']);
	$name=get_safe_value($con,$_POST['name']);
	$mrp=get_safe_value($con,$_POST['mrp']);
	$price=get_safe_value($con,$_POST['price']);
	$qty=get_safe_value($con,$_POST['qty']);
	$short_desc=get_safe_value($con,$_POST['short_desc']);
	$description=get_safe_value($con,$_POST['description']);
	$brands_id=get_safe_value($con,$_POST['brands_id']);
	
	$res=mysqli_query($con,"select * from product where name='$name'");
	$check=mysqli_num_rows($res);
	if($check>0){
		if(isset($_GET['id']) && $_GET['id']!=''){
			$getData=mysqli_fetch_assoc($res);
			if($id==$getData['id']){
			
			}else{
				$msg="Product already exist";
			}
		}else{
			$msg="Product already exist";
		}
	}
	
	
	if(isset($_GET['id']) && $_GET['id']==0){
		if($_FILES['image']['type']!='image/png' && $_FILES['image']['type']!='image/jpg' && $_FILES['image']['type']!='image/jpeg'){
			$msg="Please select only png,jpg and jpeg image formate";
		}
	}else{
		if($_FILES['image']['type']!=''){
				if($_FILES['image']['type']!='image/png' && $_FILES['image']['type']!='image/jpg' && $_FILES['image']['type']!='image/jpeg'){
				$msg="Please select only png,jpg and jpeg image formate";
			}
		}
	}

	if(isset($_FILES['product_images'])){
		foreach($_FILES['product_images']['type'] as $key=>$val){
			if($_FILES['product_images']['type'][$key]!=''){
				if($_FILES['product_images']['type'][$key]!='image/png' && $_FILES['product_images']['type'][$key]!='image/jpg' && $_FILES['product_images']['type'][$key] !='image/jpeg'){
					$msg="Please select only png,jpg and jpeg image formate in multiple product images";
				}
			}
		}
	}
	
	if($msg==''){
		if(isset($_GET['id']) && $_GET['id']!=''){
			if($_FILES['image']['name']!=''){
				$image=rand(111111111,999999999).'_'.$_FILES['image']['name'];
				move_uploaded_file($_FILES['image']['tmp_name'],'../media/product/'.$image);
				$update_sql="update product set categories_id='$categories_id',name='$name',mrp='$mrp',price='$price',qty='$qty',short_desc='$short_desc',description='$description',image='$image',brands_id='$brands_id' where id='$id'";
			}else{
				$update_sql="update product set categories_id='$categories_id',name='$name',mrp='$mrp',price='$price',qty='$qty',short_desc='$short_desc',description='$description',brands_id='$brands_id' where id='$id'";
			}
			mysqli_query($con,$update_sql);
		}else{
			$image=rand(111111111,999999999).'_'.$_FILES['image']['name'];
			move_uploaded_file($_FILES['image']['tmp_name'],'../media/product/'.$image);
			mysqli_query($con,"insert into product(categories_id,name,mrp,price,qty,short_desc,description,status,image,brands_id) values('$categories_id','$name','$mrp','$price','$qty','$short_desc','$description',1,'$image','$brands_id')");
			$id = mysqli_insert_id($con);
		}
		/*Product Multiple Images Start*/
		if(isset($_GET['id']) && $_GET['id']!=''){
			foreach($_FILES['product_images']['name'] as $key=>$val){
				if($_FILES['product_images']['name'][$key]!=''){
					if(isset($_POST['product_images_id'][$key])){
						$image=rand(111111111,999999999).'_'.$_FILES['product_images']['name'][$key];
						move_uploaded_file($_FILES['product_images']['tmp_name'][$key],'../media/product_images/'.$image);
						mysqli_query($con,"update product_images set product_images='$image' where id='".$_POST['product_images_id'][$key]."'");
					}else{
						$image=rand(111111111,999999999).'_'.$_FILES['product_images']['name'][$key];
						move_uploaded_file($_FILES['product_images']['tmp_name'][$key],'../media/product_images/'.$image);
						mysqli_query($con,"insert into product_images(product_id,product_images) values('$id','$image')");
					}
					
				}
			}
		}else{
			if(isset($_FILES['product_images']['name'])){
				foreach($_FILES['product_images']['name'] as $key=>$val){
					if($_FILES['product_images']['name'][$key]!=''){
						$image=rand(111111111,999999999).'_'.$_FILES['product_images']['name'][$key];
						move_uploaded_file($_FILES['product_images']['tmp_name'][$key],'../media/product_images/'.$image);
						mysqli_query($con,"insert into product_images(product_id,product_images) values('$id','$image')");
					}
				}
			}
		}
		/*Product Multiple Images End*/



		header('location:product.php');
		die();
	}
}
?>
<style>
	.product_img{
		width: 5%;
	}
</style>
<div class="content pb-0">
            <div class="animated fadeIn">
               <div class="row">
                  <div class="col-lg-12">
                     <div class="card">
                        <div class="card-header"><strong>Product</strong><small> Form</small></div>
                        <form method="post" enctype="multipart/form-data">
							<div class="card-body card-block">
							   <div class="form-group">
									<label for="categories" class=" form-control-label">Categories</label>
									<select class="form-control" name="categories_id">
										<option>Select Category</option>
										<?php
										$res=mysqli_query($con,"select id,categories from categories order by categories asc");
										while($row=mysqli_fetch_assoc($res)){
											if($row['id']==$categories_id){
												echo "<option selected value=".$row['id'].">".$row['categories']."</option>";
											}else{
												echo "<option value=".$row['id'].">".$row['categories']."</option>";
											}
											
										}
										?>
									</select>
								</div>
								<div class="form-group">
									<label for="brands" class=" form-control-label">Brands</label>
									<select class="form-control" name="brands_id">
										<option>Select Brand</option>
										<?php
										$res=mysqli_query($con,"select id,brands from brands order by brands asc");
										while($row=mysqli_fetch_assoc($res)){
											if($row['id']==$brands_id){
												echo "<option selected value=".$row['id'].">".$row['brands']."</option>";
											}else{
												echo "<option value=".$row['id'].">".$row['brands']."</option>";
											}
											
										}
										?>
									</select>
								</div>
								<div class="form-group">
									<label for="" class=" form-control-label">Product Name</label>
									<input type="text" name="name" placeholder="Enter product name" class="form-control" required value="<?php echo $name?>">
								</div>
								
								<div class="form-group">
									<label for="" class=" form-control-label">MRP</label>
									<input type="text" name="mrp" placeholder="Enter product mrp" class="form-control" value="<?php echo $mrp?>">
								</div>
								
								<div class="form-group">
									<label for="" class=" form-control-label">Price</label>
									<input type="text" name="price" placeholder="Enter product price" class="form-control" required value="<?php echo $price?>">
								</div>
								
								<div class="form-group">
									<label for="" class=" form-control-label">Qty</label>
									<input type="text" name="qty" placeholder="Enter qty" class="form-control" required value="<?php echo $qty?>">
								</div>
								
								<div class="form-group">
									<div class="row" id="image_box">
                  						<div class="col-lg-10">
										  	<label for="" class="form-control-label">Image</label>
											<input type="file" name="image" class="form-control" <?php echo  $image_required?>>	
											<?php 
											if($image!=''){
												echo "<a target='_blank' href ='../media/product/$image'><img width='10%' src ='../media/product/$image'/></a>";
											}
											?>
										</div>
										<div class="col-lg-2">
											<label for="" class="form-control-label"></label>
											<label for="" class="form-control-label"></label>
											<button id="" type="button" class="btn btn-lg btn-info btn-block" onclick="add_more_images()">
							   				<span id="payment-button-amount">Add Image</span>
							   				</button>
										</div>
										<?php
									 if(isset($multipleImageArr[0])){
										foreach($multipleImageArr as $list){
											echo '<div class="col-lg-6" style="margin-top:20px;" id="add_image_box_'.$list['id'].'"><label for="categories" class=" form-control-label">Image</label><input type="file" name="product_images[]" class="form-control" ><a href="manage_product.php?id='.$id.'&pi='.$list['id'].'" style="color:white;"><button type="button" class="btn btn-lg btn-danger btn-block"><span id="payment-button-amount"><a href="manage_product.php?id='.$id.'&pi='.$list['id'].'" style="color:white;"><a href="manage_product.php?id='.$id.'&pi='.$list['id'].'" style="color:white;">Remove</a></span></button></a>';
											echo "<a target='_blank' href='".'../media/product_images/'.$list['product_images']."'><img width='150px' src='".'../media/product_images/'.$list['product_images']."'/></a>";
											echo '<input type="hidden" name="product_images_id[]" value="'.$list['id'].'"/></div>';

										}										 
									}
									 ?>
									</div>
								</div>
								
								<div class="form-group">
									<label for="" class=" form-control-label">Short Description</label>
									<textarea name="short_desc" placeholder="Enter product short description" class="form-control" required><?php echo $short_desc?></textarea>
								</div>
								
								<div class="form-group">
									<label for="" class=" form-control-label">Description</label>
									<textarea name="description" placeholder="Enter product description" class="form-control" required><?php echo $description?></textarea>
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

<script>
	var total_image=1;
	function add_more_images(){
		total_image++;
		var html ='<div class="col-lg-6" style="margin-top:20px;" id="add_image_box_'+total_image+'"><label for="" class="form-control-label">Image</label><input type="file" name="product_images[]" class="form-control" require><button type="button" class="btn btn-lg btn-danger btn-block" onclick=remove_image("'+total_image+'")><span id="payment-button-amount">remove</span></button></div>';
		jQuery('#image_box').append(html);
	}
	function remove_image(id){
		jQuery('#add_image_box_'+id).remove();
	}
</script>
         
<?php
require('footer.inc.php');
?>