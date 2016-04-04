<?php
/**
 * @file
 * Research Profile, Profile file.
 */

if (!function_exists("system_form_install_configure_form_alter")) {
  /**
   * Implements hook_form_FORM_ID_alter().
   *
   * Allows the profile to alter the site configuration form.
   */
  function system_form_install_configure_form_alter(&$form, $form_state) {
    $form['site_information']['site_name']['#default_value'] = 'Research Profile';
    $form['site_information']['site_mail']['#default_value'] = 'web@science.oregonstate.edu';
    $form['admin_account']['account']['name']['#default_value'] = 'cosine';
    $form['admin_account']['account']['mail']['#default_value'] = 'web@science.oregonstate.edu';
    $form['server_settings']['site_default_country']['#default_value'] = 'US';
  }
}

if (!function_exists("system_form_install_select_profile_form_alter")) {
  /**
   * Implements hook_form_FORM_ID_alter().
   *
   * Select the current install profile by default.
   */
  function system_form_install_select_profile_form_alter(&$form, $form_state) {
    foreach ($form['profile'] as $key => $element) {
      $form['profile'][$key]['#value'] = 'research_profile';
    }
  }
}
/**
 * Implements hook_install_tasks().
 */
function research_profile_install_tasks($install_state) {
  $tasks = array(
    'research_profile_path_auto' => array(
      'display_name' => st("Configure Path auto for Content Types"),
      'function' => 'research_profile_path_auto',
    ),
    'research_profile_theme' => array(
      'display_name' => st('Configure Doug Fir Theme'),
      'function' => 'research_profile_theme',
    ),
    'research_profile_permissions' => array(
      'display_name' => st('Configure Site Permissions'),
      'function' => 'research_profile_perms',
    ),

  );
  return $tasks;
}

/**
 * Configure Permissions and roles for a site.
 */
function research_profile_perms() {
  // Add User Roles.
  // Site Admin Permissions.
  $site_admin_perms = array(
    'access administration menu',
    'access administration pages',
    'access all views',
    'access all webform results',
    'access broken links report',
    'access content overview',
    'access contextual links',
    'access own broken links report',
    'access own webform results',
    'access own webform submissions',
    'access protected node overview page',
    'access protected node password form',
    'access site in maintenance mode',
    'access site reports',
    'access user profiles',
    'add media from remote sources',
    'administer biblio',
    'administer blocks',
    'administer cas redirect',
    'administer code per node',
    'administer content types',
    'administer image styles',
    'administer linkchecker',
    'administer media',
    'administer menu',
    'administer nodeaccess',
    'administer nodes',
    'administer pathauto',
    'administer permissions',
    'administer rules',
    'administer site configuration',
    'administer taxonomy',
    'administer url aliases',
    'administer users',
    'administer views',
    'administer workbench',
    'bypass node access',
    'configure top hat',
    'create article content',
    'create biblio content',
    'create feature_story content',
    'create feed',
    'create feed content',
    'create people_osu content',
    'create page content',
    'create url aliases',
    'create video content',
    'create webform content',
    'customize shortcut links',
    'delete all webform submissions',
    'delete any article content',
    'delete any biblio content',
    'delete any feature_story content',
    'delete any feed content',
    'delete any page content',
    'delete any people_osu content',
    'delete any video content',
    'delete any webform content',
    'delete own article content',
    'delete own biblio content',
    'delete own feed content',
    'delete own feature_story content',
    'delete own page content',
    'delete own people_osu content',
    'delete own video content',
    'delete own webform content',
    'delete own webform submissions',
    'delete revisions',
    'delete terms in 1',
    'edit all webform submissions',
    'edit any article content',
    'edit any biblio content',
    'edit any feature_story content',
    'edit any feed content',
    'edit any page content',
    'edit any people_osu content',
    'edit any protected node password',
    'edit any video content',
    'edit any webform content',
    'edit biblio authors',
    'edit by all biblio authors',
    'edit css per block',
    'edit css per node',
    'edit feed',
    'edit javascript per block',
    'edit javascript per node',
    'edit link settings',
    'edit media',
    'edit own article content',
    'edit own biblio content',
    'edit own comments',
    'edit own feed content',
    'edit own feature_story content',
    'edit own page content',
    'edit own people_osu content',
    'edit own video content',
    'edit own webform content',
    'edit own webform submissions',
    'edit page password',
    'edit protected content',
    'edit terms in 1',
    'edit webform components',
    'export taxonomy by csv',
    'flush caches',
    'grant deletable node permissions',
    'grant editable node permissions',
    'grant node permissions',
    'grant own node permissions',
    'import from file',
    'import taxonomy by csv',
    'revert revisions',
    'switch shortcut sets',
    'use text format ckeditor',
    'use text format full_html',
    'view advanced help index',
    'view advanced help popup',
    'view advanced help topic',
    'view date repeats',
    'view own unpublished content',
    'view protected content',
    'view revisions',
    'view the administration theme',
  );
  // Site Admin Role.
  $site_admin = new stdClass();
  $site_admin->name = 'Site Admin';
  $site_admin->weight = 9;
  user_role_save($site_admin);
  user_role_grant_permissions($site_admin->rid, $site_admin_perms);

  // Graduate Student Permissions.
  $grad_stu_perms = array(
    'access administration menu',
    'access administration pages',
    'access contextual links',
    'access own broken links report',
    'access own webform results',
    'access own webform submissions',
    'access site in maintenance mode',
    'access site reports',
    'access user profiles',
    'add media from remote sources',
    'administer biblio',
    'administer image styles',
    'administer menu',
    'administer taxonomy',
    'create article content',
    'create biblio content',
    'create feature_story content',
    'create feed',
    'create feed content',
    'create page content',
    'create people_osu content',
    'create url aliases',
    'create video content',
    'create webform content',
    'customize shortcut links',
    'delete own article content',
    'delete own biblio content',
    'delete own feature_story content',
    'delete own feed content',
    'delete own page content',
    'delete own people_osu content',
    'delete own video content',
    'delete own webform content',
    'delete own webform submissions',
    'edit css per block',
    'edit css per node',
    'edit feed',
    'edit javascript per block',
    'edit javascript per node',
    'edit media',
    'edit own article content',
    'edit own biblio content',
    'edit own comments',
    'edit own feature_story content',
    'edit own feed content',
    'edit own page content',
    'edit own people_osu content',
    'edit own video content',
    'edit own webform content',
    'edit own webform submissions',
    'edit protected content',
    'edit terms in 1',
    'edit webform components',
    'flush caches',
    'import from file',
    'revert revisions',
    'switch shortcut sets',
    'use text format ckeditor',
    'use text format full_html',
    'view advanced help index',
    'view advanced help popup',
    'view advanced help topic',
    'view date repeats',
    'view own unpublished content',
    'view protected content',
    'view revisions',
    'view the administration theme',
  );
  // Graduate Student Role.
  $grad_stu = new stdClass();
  $grad_stu->name = 'Grad Student';
  $grad_stu->weight = 8;
  user_role_save($grad_stu);
  user_role_grant_permissions($grad_stu->rid, $grad_stu_perms);
  // Authenticated Users Permissions.
  $auth_user_perm = array(
    'access biblio content',
    'access comments',
    'access content',
    'access own webform submissions',
    'access protected node password form',
    'access workbench',
    'post comments',
    'search content',
    'show download links',
    'show export links',
    'show filter tab',
    'show own download links',
    'show sort links',
    'skip comment approval',
    'use advanced search',
    'use text format filtered_html',
    'view date repeats',
    'view full text',
    'view media',
    'view protected content',
  );
  // Update Auth user perms.
  user_role_grant_permissions('2', $auth_user_perm);
  // Anonymous Permissions.
  $anon_perms = array(
    'access biblio content',
    'access comments',
    'access content',
    'access protected node password form',
    'search content',
    'use text format filtered_html',
    'view date repeats',
    'view media',
  );
  // Update annon perms.
  user_role_grant_permissions('1', $anon_perms);
}

/**
 * Setup Doug Fir Theme.
 */
function research_profile_theme() {
  // Doug Fir Theme settings.
  $doug_fir_settings = array(
    "theme_settings" => '',
    "toggle_logo" => 0,
    "toggle_name" => 1,
    "toggle_favicon" => 1,
    "toggle_main_menu" => 0,
    "toggle_secondary_menu" => 0,
    "default_favicon" => 1,
    "logo" => '',
    "default_logo" => 0,
    "logo_path" => '',
    "logo_upload" => '',
    "favicon" => '',
    "favicon_path" => '',
    "favicon_upload" => '',
    "variant" => "science",
    "responsive" => 1,
    "hide_breadcrumbs" => 0,
    "hide_book_nav" => 0,
    "hide_terms" => 0,
    "custom_ga_code" => '',
    "parent_site_name" => 'College of Science',
    "parent_site_url" => 'www.science.oregonstate.edu',
    "facebook" => '',
    "youtube-play" => '',
    "flickr" => '',
    "linkedin" => '',
    "twitter" => '',
    "google-plus" => '',
    "instagram" => '',
    "nice_menus_custom_css" => '',
  );
  variable_set('theme_doug_fir_settings', $doug_fir_settings);
}

/**
 * Setup Path Auto aliases.
 */
function research_profile_path_auto() {

}
