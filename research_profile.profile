<?php
/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
if (!function_exists("system_form_install_configure_form_alter")) {
  function system_form_install_configure_form_alter(&$form, $form_state) {
    $form['site_information']['site_name']['#default_value'] = 'Research Profile';
    $form['site_information']['site_mail']['#default_value'] = 'web@science.oregonstate.edu';
    $form['admin_account']['account']['name']['#default_value'] = 'cosine';
    $form['admin_account']['account']['mail']['#default_value'] = 'web@science.oregonstate.edu';
    $form['server_settings']['site_default_country']['#default_value'] = 'US';
  }
}

/**
 * Implements hook_form_alter().
 *
 * Select the current install profile by default.
 */
if (!function_exists("system_form_install_select_profile_form_alter")) {
  function system_form_install_select_profile_form_alter(&$form, $form_state) {
    foreach ($form['profile'] as $key => $element) {
      $form['profile'][$key]['#value'] = 'research_profile';
    }
  }
}
