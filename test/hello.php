<?php

// Should be if ( ! empty('name') )
if ( ! empty( 'namn' ) ) {
	return 1;
}

// Should be !=
$is = 1 != 2;

// Should be !==
return 'hello' !== 2;
