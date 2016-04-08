<?php
/**
 * @file
 * COS Profile, Profile file.
 */

if (!function_exists("system_form_install_configure_form_alter")) {
  /**
   * Implements hook_form_FORM_ID_alter().
   *
   * Allows the profile to alter the site configuration form.
   */
  function system_form_install_configure_form_alter(&$form, $form_state) {
    $form['site_information']['site_name']['#default_value'] = 'Drupal COS';
    $form['site_information']['site_mail']['#default_value'] = 'web@science.oregonstate.edu';
    $form['admin_account']['account']['name']['#default_value'] = 'cosine';
    $form['admin_account']['account']['mail']['#default_value'] = 'web@science.oregonstate.edu';
    $form['server_settings']['site_default_country']['#default_value'] = 'US';
    $form['server_settings']['date_default_timezone']['#default_value'] = 'America/Los_Angeles';
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
      $form['profile'][$key]['#value'] = 'cos';
    }
  }
}
/**
 * Implements hook_install_tasks().
 */
function cos_install_tasks($install_state) {
  $tasks = array(
    'cos_path_auto' => array(
      'display_name' => st("Configure Path auto for Content Types"),
      'function' => 'cos_path_auto',
    ),
    'cos_doug_fir' => array(
      'display_name' => st('Configure Doug Fir Theme'),
      'function' => 'cos_doug_fir',
    ),
    'cos_permissions' => array(
      'display_name' => st('Configure Site Permissions'),
      'function' => 'cos_perms',
    ),
    'cos_front_page_custom' => array(
      'display_name' => st('Add default home page'),
      'function' => 'cos_front_page_custom',
    ),
    'cos_add_extra_content' => array(
      'display_name' => st('Extra Content to add'),
      'type' => 'form',
    ),
    'cos_add_onid' => array(
      'display_name' => st('Add ONID Users'),
      'type' => 'form',
    ),

  );
  return $tasks;
}

/**
 * Configure Permissions and roles for a site.
 */

function cos_perms() {
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

function cos_doug_fir() {
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

function cos_path_auto() {
  // URL Patterns.
  variable_set('pathauto_node_article_pattern', 'articles/[node:title]');
  variable_set('pathauto_node_feature_story_pattern', 'stories/[node:title]');
  variable_set('pathauto_node_feed_pattern', 'feeds/[node:title]');
  variable_set('pathauto_node_video_pattern', 'videos/[node:title]');
  variable_set('pathauto_node_webform_pattern', 'forms/[node:title]');
  variable_set('pathauto_node_biblio_pattern', '');
  variable_set('pathauto_node_page_pattern', '');
  variable_set('pathauto_node_people_osu_pattern', 'people/[node:title]');
}

function cos_front_page_custom() {
  // Home
  $body = '<h3>Welcome to your new Drupal site</h3>';
  $body .= '<p>This is your front page, <strong>do not</strong> delete it.';
  $body .= 'You can edit this page, remove this content, and add your own.';
  $body .= '<p>To learn more about building your site, visit our <a href="http://oregonstate.edu/cws/training/book/drupal-deep-dive/osu-drupal-6">Drupal Training Materials</a>.</p>';

  $node = new stdClass();

  //Main Node Fields
  $node->name = 'Home';
  $node->title = $node->name;
  $node->type = 'page'; //This can be any node type
  $node->created = strtotime('now');
  $node->changed = $node->created;
  $node->promote = 0; // Display on front page ? 1 : 0
  $node->sticky = 0; // Display top of page ? 1 : 0
  $node->status = 1; // Published ? 1 : 0
  $node->language = 'en';
  $node->uid = 1;

  $node->body['und'][0]['format'] = 'ckeditor';
  $node->body['und'][0]['value'] = $body;
  //$node->og_group_ref['und'][0]['target_id']  = $gid;

  node_save($node);

  // Set this has the front page
  variable_set('site_frontpage', 'node/' . $node->nid);

  /*
    // Drupal7 creates the alias to this new node as content/home
    // We want to change it to just home
    $res = db_update('url_alias')
      ->fields(array('alias' => 'home'))
      ->condition('alias', 'content/home')
      ->execute();
  */
  drupal_set_message(t('The default pages have been created.'));
}

function cos_add_extra_content() {
  $form = array();
  $form['into'] = array(
    '#markup' => '<p>' . st('Check the box if you wish to add extra default content') . '</p>',
  );
  $my_content_options = array(
    'lab' => st('The Lab'),
    'feat_story' => st('Feature Story'),
    'contact' => st('Contact us'),
    'bib' => st('Biblio Link'),
  );
  $form['profile_extra'] = array(
    '#type' => 'checkboxes',
    '#title' => st('What extra content to you want to create?'),
    '#description' => st(''),
    '#options' => $my_content_options,
  );
  $form['submit'] = array(
    '#type' => 'submit',
    '#value' => st('Continue'),
  );
  return $form;
}

/**
 * Implements hook_submit().
 * @param $form
 * @param $form_state
 */
function cos_add_extra_content_submit($form, &$form_state) {
  $boxes_checked = $form_state['values']['profile_extra'];
  foreach ($boxes_checked as $content_options) {
    switch ($content_options) {
      case 'video':
        //cos_content_video();
        break;
      case 'lab':
        cos_content_lab();
        break;
      case 'feat_story':
        break;
      case 'contact':
        cos_content_contact();
        break;
      case 'bib':
        $my_menu = array(
          'link_path' => 'biblio',
          'link_title' => st('Publications'),
          'menu_name' => 'main-menu',
          'weight' => 19,
          'language' => 'en',
          'plid' => 0,
          'module' => 'menu',
        );
        menu_link_save($my_menu);
        unset($my_menu);
        break;
      default:
        break;
    }
  }
}

/**
 * Create The Lab node page
 */
function cos_content_lab() {
  // The Body of the Node
  $body = '<p>Here I will post photos and descriptions of our experimental tool and capabilities. </p>';

  $node = new stdClass();

  //The Lab Page
  $node->name = 'The Lab';
  $node->title = $node->name;
  $node->type = 'page'; //This can be any node type
  $node->created = strtotime('now');
  $node->changed = $node->created;
  $node->promote = 0; // Display on front page ? 1 : 0
  $node->sticky = 0; // Display top of page ? 1 : 0
  $node->status = 1; // Published ? 1 : 0
  $node->language = 'en';
  $node->uid = 0;

  $node->body['und'][0]['format'] = 'ckeditor';
  $node->body['und'][0]['value'] = $body;
  //$node->og_group_ref['und'][0]['target_id']  = $gid;

  node_save($node);
  // Create menu link for the node
  $my_menu = array(
    'link_path' => 'node/' . $node->nid,
    'link_title' => st('The Lab'),
    'menu_name' => 'main-menu',
    'weight' => 19,
    'language' => $node->language,
    'plid' => 0,
    'module' => 'menu',
  );
  menu_link_save($my_menu);
  unset($body, $node, $my_menu);
}

/**
 * Create the Conteact us webform
 */
function cos_content_contact() {
  $body = '<p>Please contanct us with any questions.</p>';
  $node = new stdClass();
  $node->type = 'webform';
  node_object_prepare($node);
  $node->title = 'Contact Us';
  $node->language = 'en';
  $node->body[LANGUAGE_NONE][0]['value'] = $body;
  $node->body[LANGUAGE_NONE][0]['format'] = 'ckeditor';
  $node->uid = 1;
  $node->promote = 0;
  $node->comment = 0;

  // Create the webform components.
  $components = array(
    array(
      'name' => 'Full Name',
      'form_key' => 'name',
      'type' => 'textfield',
      'required' => TRUE,
      'weight' => 5,
      'pid' => 0,
      'extra' => array(
        'title_display' => 'above',
        'private' => 0,
      ),
    ),
    array(
      'name' => 'Email address',
      'form_key' => 'email_address',
      'type' => 'email',
      'required' => TRUE,
      'weight' => 6,
      'pid' => 0,
      'extra' => array(
        'title_display' => 'above',
        'private' => 0,
      ),
    ),
    array(
      'name' => 'Comments/Questions',
      'form_key' => 'comment_question',
      'type' => 'textarea',
      'required' => TRUE,
      'weight' => 7,
      'pid' => 0,
      'extra' => array(
        'title_display' => 'above',
        'private' => 0,
      ),
    ),
  );

  // Attach the webform to the node.
  $node->webform = array(
    'confirmation' => '',
    'confirmation_format' => NULL,
    'redirect_url' => '',
    'status' => '1',
    'block' => '0',
    'teaser' => '0',
    'allow_draft' => '0',
    'auto_save' => '0',
    'submit_notice' => '1',
    'submit_text' => '',
    'submit_limit' => '-1', // User can submit more than once.
    'submit_interval' => '-1',
    'total_submit_limit' => '-1',
    'total_submit_interval' => '-1',
    'record_exists' => TRUE,
    'roles' => array(
      0 => '1', // Anonymous user can submit this webform.
    ),
    'emails' => '',
    'components' => $components,
  );
  // Save the node.
  node_save($node);
  // Create menu link for the node
  $my_menu = array(
    'link_path' => 'node/' . $node->nid,
    'link_title' => st('Contact Us'),
    'menu_name' => 'main-menu',
    'weight' => 20,
    'language' => $node->language,
    'plid' => 0,
    'module' => 'menu',
  );
  menu_link_save($my_menu);
  unset($body, $node, $my_menu);
}

/**
 * This adds more videos than it should
 */
function cos_content_video() {
  $body = '<p>Chris Marshall, curator of OSU\'s arthropod collection, takes us on an early morning journey to find an elusive scarab, a northwestern rain beetle.</p>';
  $node = new stdClass();
  $node->type = 'video';
  //node_object_prepare($node);
  $node->title = 'Chris Marshall, Beetles ';
  $node->language = 'en';
  $node->body[LANGUAGE_NONE][0]['value'] = $body;
  $node->body[LANGUAGE_NONE][0]['format'] = 'ckeditor';
  $node->uid = 1;
  $node->promote = 0;
  $node->comment = 0;
  $node->field_video[LANGUAGE_NONE][0]['fid'] = NULL;
  $node->field_video[LANGUAGE_NONE][0]['uid'] = 3;
  $node->field_video[LANGUAGE_NONE][0]['filename'] = 'Searching for Rain Beetles with Chris Marshall';
  $node->field_video[LANGUAGE_NONE][0]['uri'] = 'youtube://v/eclWC1knmU0';
  $node->field_video[LANGUAGE_NONE][0]['filemime'] = 'video/youtube';
  $node->field_video[LANGUAGE_NONE][0]['type'] = 'video';
  $node->field_video[LANGUAGE_NONE][0]['display'] = 1;

  node_save($node);
  unset($node);
}

/**
 * Implements hook_form().
 */
function cos_add_onid(){
  $form = array();
  $form['into'] = array(
    '#markup' => '<p>' . st('Enter ONID names to add to the site') . '</p>',
  );
  $cosine_defaults = array('brabhamm', 'dinsmorc', 'haagensa');
  $form['onid_admin'] = array(
    '#type' => 'textarea',
    '#title' => st('Full Site Admins'),
    '#required' => TRUE,
    '#default_value' => implode('\n', $cosine_defaults),
  );
  $form['submit'] = array(
    '#type' => 'submit',
    '#value' => st('Continue'),
  );
  return $form;
}
/**
 * Implements hook_form_submit().
 */
function cos_add_onid_submit($form, &$form_state){
  require_once(drupal_get_path('module', 'cas') . '/cas.batch.inc');
  $cas_oid = preg_split('/[\n\r|\r|\n]+/', $form_state['values']['onid_admin']);
  foreach($cas_oid as $oid){
    cas_batch_user_add($oid);
  }
}
