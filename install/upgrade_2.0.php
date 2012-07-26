<?php
// This file is for performing an upgrade from Pligg 1.0 to 2.0.

// Report all PHP errors (see changelog)
error_reporting(E_ALL);

// Get your Pligg Version
$sql = "SELECT data FROM " . table_misc_data . " WHERE name = 'pligg_version'";
$pligg_version = $db->get_var($sql);

$old_version = str_replace('.', '' , $pligg_version);
$new_version = '200';

// Check if you need to run the one time upgrade to Pligg 2.0
if ($old_version < $new_version) {

	//echo $lang['UpgradingTables'] . '<br />';
	echo '<li>Performing one-time Pligg 2.0 Upgrade</li><ul>';
	
	// Change default avatar to new larger png files
	$sql = "UPDATE ".table_config." SET var_defaultvalue='/avatars/Avatar_100.png' WHERE var_name='Default_Gravatar_Large';";
	$db->query($sql);
	// Change the large avatar location, only if it is still set to the default value
	$sql = "UPDATE ".table_config." SET var_value='/avatars/Avatar_100.png' WHERE var_value='/avatars/Gravatar_30.gif';";
	$db->query($sql);
	$sql = "UPDATE ".table_config." SET var_defaultvalue='/avatars/Avatar_32.png' WHERE var_name='Default_Gravatar_Small';";
	$db->query($sql);
	$sql = "UPDATE ".table_config." SET var_value='/avatars/Avatar_32.png' WHERE var_value='/avatars/Gravatar_15.gif';";
	$db->query($sql);
	// Force a change of avatar sizes
	$sql = "UPDATE ".table_config." SET var_defaultvalue='32' WHERE var_name='Avatar_Small';";
	$db->query($sql);
	$sql = "UPDATE ".table_config." SET var_value='32' WHERE var_name='Avatar_Small';";
	$db->query($sql);
	$sql = "UPDATE ".table_config." SET var_defaultvalue='100' WHERE var_name='Avatar_Large';";
	$db->query($sql);
	$sql = "UPDATE ".table_config." SET var_value='100' WHERE var_name='Avatar_Large';";
	$db->query($sql);
	// We need to regenerate avatars to the new size here
	echo '<li>Changed default avatars to larger format .png files</li>';
	
	// Update group avatar height/width sizes to 100
	$sql = "UPDATE ".table_config." SET var_value='100' WHERE var_name='group_avatar_size_width';";
	$db->query($sql);
	$sql = "UPDATE ".table_config." SET var_defaultvalue='100' WHERE var_name='group_avatar_size_width';";
	$db->query($sql);
	$sql = "UPDATE ".table_config." SET var_value='100' WHERE var_name='group_avatar_size_height';";
	$db->query($sql);
	$sql = "UPDATE ".table_config." SET var_defaultvalue='100' WHERE var_name='group_avatar_size_height';";
	$db->query($sql);
	echo '<li>Changed group avatar height/width size setting to 100px</li>';
	
	// Update User Levels, removing the 'god' level
	$sql = "UPDATE ".table_users." SET user_level='moderator' WHERE user_level='admin';";
	$db->query($sql);
	echo '<li>Changed Admin to Moderator</li>';
	$sql = "UPDATE ".table_users." SET user_level='admin' WHERE user_level='god';";
	$db->query($sql);
	echo '<li>Changed God to Admin</li>';
	
	// Remove the Spell Checker from Admin Config
	$sql = "DELETE FROM " . table_config . " WHERE var_name='Spell_Checker'";
	$db->query($sql);
	echo '<li>Removed Spell Checker</li>';
	
	// Add a new FAQ Page
	$sql = "INSERT INTO `" . table_links . "`  (`link_id`, `link_author`, `link_status`, `link_randkey`, `link_votes`, `link_reports`, `link_comments`, `link_karma`, `link_modified`, `link_date`, `link_published_date`, `link_category`, `link_lang`, `link_url`, `link_url_title`, `link_title`, `link_title_url`, `link_content`, `link_summary`, `link_tags`, `link_field1`, `link_field2`, `link_field3`, `link_field4`, `link_field5`, `link_field6`, `link_field7`, `link_field8`, `link_field9`, `link_field10`, `link_field11`, `link_field12`, `link_field13`, `link_field14`, `link_field15`, `link_group_id`, `link_out`) VALUES (NULL, 1, 'page', 0, 0, 0, 0, '0.00', '2012-07-23 00:00:00', '2012-07-23 00:00:00', '0000-00-00 00:00:00', 0, 1, '', NULL, 'Frequently Asked Questions', 'faq', '<a name\"top\" style=\"text-decoration:none;color:#000;text-transform:uppercase;\"><h1>Frequently Asked Questions</h1></a>
<p>Welcome to the Frequently Asked Questions (FAQ) page. This page explains many of the features that are offered by this site to our members.</p>
<ol>
	<li><a rel=\"nofollow\" href=\"#what_is\">What is {#PLIGG_Visual_Name#}?</a></li>
	<li><a rel=\"nofollow\" href=\"#different\">How is {#PLIGG_Visual_Name#} different?</a></li>
	<li><a rel=\"nofollow\" href=\"#private_messages\">Private Messaging</a></li>
	<li><a rel=\"nofollow\" href=\"#profiles\">User Profiles</a></li>
	<li><a rel=\"nofollow\" href=\"#voting\">What is Voting?</a></li>
	<li><a rel=\"nofollow\" href=\"#whats_for_me\">What''s in it for me?</a></li>
	<li><a rel=\"nofollow\" href=\"#why_register\">Why Should I Register an Account?</a></li>
	<li><a rel=\"nofollow\" href=\"#how_register\">How do I register a new account?</a></li>
	<li><a rel=\"nofollow\" href=\"#activation\">I didn''t receive my activation email</a></li>
	<li><a rel=\"nofollow\" href=\"#cant_login\">I can''t login</a></li>
	<li><a rel=\"nofollow\" href=\"#submit\">How do I submit content?</a></li>
	<li><a rel=\"nofollow\" href=\"#karma\">What is Karma?</a></li>
	<li><a rel=\"nofollow\" href=\"#groups\">What are Groups?</a></li>
</ol>
<hr/>
<h2>Answers</h2>
<hr />
<p><a name=\"what_is\"><strong>1. What is {#PLIGG_Visual_Name#}? </strong></a></p>
<p>At {#PLIGG_Visual_Name#} you can discover, share and submit great articles, news and videos gathered from all around the web. We are a mix of social network and news agency. Users like yourself can contribute content, as well as help choose what submissions make it to the front page through our voting mechanism.</p>
<hr />
<p><a name=\"different\"><strong>2. How is {#PLIGG_Visual_Name#} different? </strong></a></p>
<p>The most important component of {#PLIGG_Visual_Name#} is you, the reader. Everything within the site is crowd-sourced by our visitors. Anyone has the authority to control the content through voting submissions or comments up and down, making readers like you the moderators of this site.</p>
<hr />
<p><a name=\"private_messages\"><strong>3. Private Messaging</strong></a></p>
<p>A social network site isn''t very social without the ability to communicate with other members. {#PLIGG_Visual_Name#} includes a private messaging feature so that you can send a direct message to your friends that they can respond to.</p>
<p>To send private message to any user, you have to click on the \"compose\" button on his/her profile page. In order to send or receive messages, you need to be her/his friend. This is a requirement put in place to prevent spam from arriving in your inbox.</p>
<p>You will get notified via email, whenever you receive a new message.</p>
<hr />
<p><a name=\"profiles\"><strong>4. User Profiles?</strong></a></p>
<p>Each user that signs up to {#PLIGG_Visual_Name#} gets their own profile page where they can change their settings, send messages to other users, add an avatar, and view their voting and comment history.</p>
<p>The user settings area allows you to change things like your email address, or what categories you want to follow. If you choose to de-select some categories, doing so will hide all content submitted to the un-subscribed categories.</p>
</ul>
<hr />
<p><a name=\"voting\"><strong>5. What is Voting?</strong></a></p>
<p>The content of this site is mainly contributed and moderated by members, rather than moderators or site-sponsored authors like on most other websites. Members like you are given the ability to vote on submissions and comments, and those votes determine what content is published to the front page. Stories without enough votes are left in the \"Upcoming\" section, where they eventually become ineligible for becoming published. </p>
<p>Your voting habits are tracked and displayed on your user profile. This allows you to easily see what submissions or comments you have interracted with in the past.</p>
<hr />
<p><a name=\"whats_for_me\"><strong>6. What''s in it for me?</strong></a></p>
<p>Are you a content producer who wants more traffic? Share your articles, news & videos on {#PLIGG_Visual_Name#} and get better exposure in the form of backlinks, comments, subscriptions and repeat visitors to your website.</p>
<p>Readers, {#PLIGG_Visual_Name#} offers an easy way to discover new content which is generated and filtered by our online community. <a href=\"{$URL_register}\">Join</a> to become part of that community and help determine the direction of this website.</p>
<hr />
<p><a name=\"why_register\"><strong>7. Why Should I Register an Account?</strong></a></p>
<p>Registering provides you with some great advantages:</p>
<ul>
	<li>Submit articles</li>
	<li>Vote on submissions</li>
	<li>Leave comments on articles</li>
	<li>Save stories to your account using a \"bookmark\" function</li>
	<li>Access your voting, comment, and bookmarks from your profile</li>
	<li>Favorite other members and follow their contributions</li>
</ul>
<hr />
<p><a name=\"how_register\"><strong>8. How do I register a new account?</strong></a></p>
<p>It only takes a few seconds to sign up for a new account. Just <a href=\"{$URL_register}\">click on this link to be redirected to the registration page</a>. Once you have signed up, you will need to click on a link sent to your email address to confirm your account before logging in.</p>
<hr />
<p><a name=\"activation\"><strong>9. I didn''t receive my activation email</strong></a></p>
<p>Many times these emails get stuck in you Junk email folder. Check to make sure that your email provider didn''t label the activation email as spam.</p>
<hr />
<p><a name=\"cant_login\"><strong>10. I can''t login</strong></a></p>
<p>Make sure your CAPS LOCK is off. Passwords are CasE SENsitivE. Also, your account must be validated via the link that was emailed to you during the registration process. You can also try to reset your password by using the <a href=\"{$URL_login}\">forgotten password field</a>.</p>
<hr />
<p><a name=\"submit\"><strong>11. How do I submit content?</strong></a></p>
<ul class=\"help\">
	<li>To submit the story you need to first log into a registered account. If you don''t have an account yet, you can <a href=\"{$URL_register}\">Register Here</a>.</li>
	<li>Next, navigate to the <a href=\"{$URL_submit}\">Submission Page</a></li>
	<li>Copy the URL of a story that you would like to submit and paste that into the News Source input field and click on the continue button.</li>
	<li>Enter a title, category, tags, and description for your submission.</li>
	
	<li>Submit, and you''re done!</li>
</ul>
<hr />
<p><a name=\"karma\"><strong>12. What is Karma?</strong></a></p>
<p>Karma is a mechanism used by this site that gives more weight to users who contribute frequently. The more articles, comments, and votes that you submit, the more Karma your account accrues. That Karma is then used in determining what stories make it to the front page. The higher the karma your account has, the more influence your votes will have over the direction of the website.
<hr />
<p><a name=\"groups\"><strong>13. What are Groups? </strong></a></p>
<p>Groups are a way for members with a common interest to collaborate on a specific topic. For example, if you are a person who lives in France, you could create your own group for members in France. Each group is given their own published, upcoming, and shared pages where admins can moderate which content makes it to the group homepage.</p>
<p>Please be aware that some groups may require membership approval before you become a member.</p>
<hr />
<a href=\"#top\"><i class=\"icon icon-arrow-up\" style=\"opacity:1.0;\"></i> Top</a><br /><br />', '', '', 'Frequently Asked Questions,FAQ,Help', 'Frequently Asked Questions', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, 0);";
	$db->query($sql);
	echo '<li>Created FAQ Page...</li>';

	// Finished 2.0 upgrade
	echo'</ul>';
}

	
?>