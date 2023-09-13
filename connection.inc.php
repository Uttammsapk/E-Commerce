<?php
session_start();
$con=mysqli_connect("localhost","root","","ecom");

define('SERVER_PATH',$_SERVER['DOCUMENT_ROOT'].'/phpeCom/admin/');
define('SITE_PATH','http://localhost/phpeCom/media/');

define('PRODUCT_IMAGE_SERVER_PATH',SERVER_PATH.'../media/product/');
define('PRODUCT_IMAGE_SITE_PATH',SITE_PATH.'../media/product/');

define('PRODUCT_MULTIPLE_IMAGE_SERVER_PATH',SERVER_PATH.'/media/product_images/');
define('PRODUCT_MULTIPLE_IMAGE_SITE_PATH',SITE_PATH.'product_images/');
?>