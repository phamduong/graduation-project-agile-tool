<?php

define('PROJECT_CANCELED_STATUS', 0);
define('PROJECT_ACTIVE_STATUS', 1);
define('PROJECT_COMPLETE_STATUS', 2);

define('ROLE_LEADER', 1);
define('ROLE_SCRUM_MASTER', 2);
define('ROLE_MEMBER', 3);
define('ROLE_OWNER', 4);

define('ENTITY_PROJECT', 1);
define('ENTITY_STORY', 2);
define('ENTITY_TEAM', 3);
define('ENTITY_SPRINT', 4);
define('ENTITY_COMMENT', 5);
define('ENTITY_TASK', 6);
define('ENTITY_EVENT', 7);
define('ENTITY_USER', 8);
define('ENTITY_ATTACH', 9);

define('STORY_STATUS_NEW', 1);
define('STORY_STATUS_APPROVED', 2);
define('STORY_STATUS_ESTIMATED', 3);
define('STORY_STATUS_ASIGNED', 4);
define('STORY_STATUS_TO_DO', 5);
define('STORY_STATUS_IN_PROGRESS', 6);
define('STORY_STATUS_TO_TEST', 7);
define('STORY_STATUS_DONE', 8);
define('STORY_STATUS_SPRINT_COMPLETED', 9);

define('PRIORITY_URGENT', 1);
define('PRIORITY_HIGH', 2);
define('PRIORITY_MEDIUM', 3);
define('PRIORITY_LOW', 4);

define('SPRINT_STATUS_IN_PLAN', 1);
define('SPRINT_STATUS_IN_PROGRESS', 2);
define('SPRINT_STATUS_COMPLETED', 3);

define('TASK_STATUS_TODO', 1);
define('TASK_STATUS_IN_PROGRESS', 2);
define('TASK_STATUS_TO_TEST', 3);
define('TASK_STATUS_DONE', 4);

define('ACTIVITY_COMMENT', 1);
define('ACTIVITY_ADD', 2);
define('ACTIVITY_DELETE', 3);
define('ACTIVITY_UPDATE', 4);

define('PERMISSION_TYPE_LINK', 0);
define('PERMISSION_TYPE_REGEX', 1);