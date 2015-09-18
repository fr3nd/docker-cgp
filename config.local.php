<?php

foreach ($_ENV as $key=>$val )
{
  if (substr( $key, 0, 4 ) === "cgp_") {
    $k = str_replace("cgp_", "", $key);
    $CONFIG[$k] = $val;
  }
}

?>
