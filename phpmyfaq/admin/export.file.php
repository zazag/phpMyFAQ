<?php
/**
 * XML, XHTML and PDF export - streamer page
 *
 * PHP Version 5.4
 *
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/.
 *
 * @category  phpMyFAQ
 * @package   Administration
 * @author    Matteo Scaramuccia <matteo@scaramuccia.com>
 * @author    Thorsten Rinne <thorsten@phpmyfaq.de>
 * @copyright 2005-2014 phpMyFAQ Team
 * @license   http://www.mozilla.org/MPL/2.0/ Mozilla Public License Version 2.0
 * @link      http://www.phpmyfaq.de
 * @since     2005-11-02
 */

use Symfony\Component\HttpFoundation\Response;

if (!defined('IS_VALID_PHPMYFAQ')) {
    $protocol = 'http';
    if (isset($_SERVER['HTTPS']) && strtoupper($_SERVER['HTTPS']) === 'ON'){
        $protocol = 'https';
    }
    header('Location: ' . $protocol . '://' . $_SERVER['HTTP_HOST'] . dirname($_SERVER['SCRIPT_NAME']));
    exit();
}

//
// GET Parameters Syntax:
//   export.file.php?
//          type={pdf|xhtml|xml}
//      [&dispos={inline|attachment}], default: attachment
//       [&catid=NN[&downwards=1]], default: all, downwards
//

	// Get current user and group id - default: -1
	if (!is_null($user) && $user instanceof PMF_User_CurrentUser) {
		$current_user   = $user->getUserId();
		if ($user->perm instanceof PMF_Perm_Medium) {
			$current_groups = $user->perm->getUserGroups($current_user);
		} else {
			$current_groups = array(-1);
		}
		if (0 == count($current_groups)) {
			$current_groups = array(-1);
		}
	} else {
		$current_user   = -1;
		$current_groups = array(-1);
	}

$categoryId        = PMF_Filter::filterInput(INPUT_POST, 'catid', FILTER_VALIDATE_INT);
$downwards         = PMF_Filter::filterInput(INPUT_POST, 'downwards', FILTER_VALIDATE_BOOLEAN, false);
$inlineDisposition = PMF_Filter::filterInput(INPUT_POST, 'dispos', FILTER_SANITIZE_STRING);
$type              = PMF_Filter::filterInput(INPUT_POST, 'type', FILTER_SANITIZE_STRING, 'none');

$faq      = new PMF_Faq($faqConfig);
	$faq->setUser($current_user);
	$faq->setGroups($current_groups);
    $category = new PMF_Category($faqConfig, $current_groups);
$category->buildTree();

$tags = new PMF_Tags($faqConfig);

$export  = PMF_Export::create($faq, $category, $faqConfig, $type);
$content = $export->generate($categoryId, $downwards, $LANGCODE);

// Stream the file content
$oHttpStreamer = new PMF_HttpStreamer(Response::create(), $type, $content);
if ('inline' == $inlineDisposition) {
    $oHttpStreamer->send(PMF_HttpStreamer::HTTP_CONTENT_DISPOSITION_INLINE);
} else {
    $oHttpStreamer->send(PMF_HttpStreamer::HTTP_CONTENT_DISPOSITION_ATTACHMENT);
}