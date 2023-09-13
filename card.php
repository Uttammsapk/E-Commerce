<?php
require('config.php');
?>

<form action="submit.php" method="post">
    <script
        src="https://checkout.stripe.com/checkout.js" class ="stripe-button"
        data-key="<?php echo $publishableKey?>";
        data-amount = "500"
        data-name = "Prami"
        data-description ="Prami Clothing"
        data-image=""
        data-currency="usd"
    >
    </script>
</form>