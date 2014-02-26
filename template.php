<?php

function angupal_preprocess_HOOK($variables) {
	$variables['app_path'] = drupal_get_path('theme', 'angupal') . '/angular/app';
	dpm($variables);
}

/**
 * Implements hook_menu().
 */
function angupal_menu() {

  $items['home'] = array(
    'page callback' => '',
    'page arguments' => array(),
    'access arguments' => array(''),
  );

  return $items;
}