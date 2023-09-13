<?php
require('config.php');

$token = $_POST['stripeToken'];

$data=\Stripe\Charge :: create(array(
    "amount" => 500,
    "currency" => "usd",
    "description" => "Prami Clothing",
    "source" => $token,
));
?>
<style>
    .fr__btn {
    background: #c43b68 none repeat scroll 0 0;
    color: #fff;
    display: inline-block;
    font-family: Poppins;
    font-size: 15px;
    height: 50px;
    line-height: 50px;
    padding: 0 36px;
    transition: 0.3s;
	margin-top:20px;
}
.fr__btn:hover {
    background: #222222 none repeat scroll 0 0;
    color: #fff;
}
.send__btn {
    margin-top: 20px;
}
</style>
<div class="send__btn">
    <a class="fr__btn" href="./index.php">Go Back</a>
</div>
<div>
    <h1>Payment Successful!!</h1>
</div>
