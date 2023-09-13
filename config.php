<?php
    require ('./stripe-php-master/init.php');

    $publishableKey = "pk_test_51N9OlSDAida9sr35xfWkeueQO91XRzaDvnfeu3vkVLaWkf1xbyKMnsZAjbtigigG6MKB2MCwV3Hx0FZlur5UqyWU00KtFTLel6";
    $secretKey = "sk_test_51N9OlSDAida9sr35tUheuoqamOYiLAmS0BFhtk38Cxv6eHCTtEf3uWxxdD1Sdl1ejsqpSkjvJrVAHjeIQXVKGSWW00Hp6eoWl6";


    \stripe\stripe :: setApiKey($secretKey);
?>