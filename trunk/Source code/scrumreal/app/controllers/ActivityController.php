<?php

class ActivityController extends BaseController {

  public static function getActivityForEntity() {
    $input = Input::all();
    $activity = new Activity;
    $comment = new Comment;
    $entity_type = $input['entity_type'];
    $entity_id = $input['entity_id'];
    $offset = $input['offset'];
    $limit = $input['limit'];
    $act_list = $activity->getActivity($entity_id, $entity_type, $offset, $limit);

    $type_list = array(
        1 => 'project',
        2 => 'story',
        3 => 'team',
        4 => 'sprint',
        5 => 'comment',
        6 => 'task',
        8 => 'user'
    );
//    var_dump($act_list);
//    exit();
    foreach ($act_list as $act) {
      switch ($act->type) {
        case 1: //comment
          $cid = $act->content;
          $text = '<a class="user" href="#">' . $act->user_name . '</a> comments: <i>' . $comment->getCommentDetail($cid)->content . '</i>';
          $act->text = $text;
          break;
        case 2: //add
          $data = explode('+', $act->content);
          $id = $data[0];
          $type = $data[1];
          switch ($type) {
            case 2: //story
              $story = Story::find($id);
              $text = '<a class="user" href="#">' . $act->user_name . '</a> adds a new story to this ' . $type_list[$entity_type] . ': <i>' . $story->name . '</i>';
              $act->text = $text;
              break;
            case 3: //team
              $team = Team::find($id);
              $text = '<a class="user" href="#">' . $act->user_name . '</a> adds a new team to this ' . $type_list[$entity_type] . ': <i>' . $team->name . '</i>';
              $act->text = $text;
              break;
            case 4: //sprint
              $sprint = Sprint::find($id);
              $text = '<a class="user" href="#">' . $act->user_name . '</a> adds a new sprint to this ' . $type_list[$entity_type] . ': <i>' . $sprint->name . '</i>';
              $act->text = $text;
              break;
            case 6: //task
              $task = Task::find($id);
              $text = '<a class="user" href="#">' . $act->user_name . '</a> adds a new task to this ' . $type_list[$entity_type] . ': <i>' . $task->name . '</i>';
              $act->text = $text;
              break;
            case 8: //user
              $user = User::find($id);
              $text = '<a class="user" href="#">' . $act->user_name . '</a> adds a user to this ' . $type_list[$entity_type] . ': <i>' . $user->fullname . '</i>';
              $act->text = $text;
              break;
          }
          break;
        case 3: //remove
          $data = explode('+', $act->content);
          $id = $data[0];
          $type = $data[1];
          switch ($type) {
            case 2: //story
              $story = Story::find($id);
              $text = '<a class="user" href="#">' . $act->user_name . '</a> removes 1 story from this ' . $type_list[$entity_type] . ': <i>' . $story->name . '</i>';
              $act->text = $text;
              break;
            case 3: //team
              $team = Team::find($id);
              $text = '<a class="user" href="#">' . $act->user_name . '</a> removes 1 team from this ' . $type_list[$entity_type] . ': <i>' . $team->name . '</i>';
              $act->text = $text;
              break;
            case 4: //sprint
              $sprint = Sprint::find($id);
              $text = '<a class="user" href="#">' . $act->user_name . '</a> removes 1 sprint from this ' . $type_list[$entity_type] . ': <i>' . $sprint->name . '</i>';
              $act->text = $text;
              break;
            case 6: //task
              $task = Task::find($id);
              $text = '<a class="user" href="#">' . $act->user_name . '</a> removes 1 task from this ' . $type_list[$entity_type] . ': <i>' . $task->name . '</i>';
              $act->text = $text;
              break;
            case 8: //user
              $user = User::find($id);
              $text = '<a class="user" href="#">' . $act->user_name . '</a> remove 1 user from this ' . $type_list[$entity_type] . ': <i>' . $user->fullname . '</i>';
              $act->text = $text;
              break;
          }
          break;
        case 4:
          $data = explode('+', $act->content);
          $text = '<a class="user" href="#">' . $act->user_name . '</a> updates ' . $data[0] . ' <b>FROM</b>: ' . $data[1] . ' <b>TO</b> ' . $data[2];
          $act->text = $text;
          break;
      }
    }
    return $act_list;
  }

  /**
   * Create a comment activity
   * @param type $entity_id
   * @param type $entity_type
   * @param type $cid
   */
  public static function createActivityComment($entity_id, $entity_type, $cid) {
    $activity = new Activity;
    $uid = Auth::user()->uid;
    $activity->createActivity(ACTIVITY_COMMENT, $entity_id, $entity_type, $cid, $uid);
  }

  /**
   * Create add an object activity
   * @param type $entity_id
   * @param type $entity_type
   * @param type $obj_id
   * @param type $obj_type
   */
  public static function createActivityAdd($entity_id, $entity_type, $obj_id, $obj_type) {
    $activity = new Activity;
    $uid = Auth::user()->uid;
    $content = $obj_id . '+' . $obj_type;
    $activity->createActivity(ACTIVITY_ADD, $entity_id, $entity_type, $content, $uid);
  }

  /**
   * Create activity delete an object
   * @param type $entity_id
   * @param type $entity_type
   * @param type $obj_id
   * @param type $obj_type
   */
  public static function createActivityDelete($entity_id, $entity_type, $obj_id, $obj_type) {
    $activity = new Activity;
    $uid = Auth::user()->uid;
    $content = $obj_id . '+' . $obj_type;
    $activity->createActivity(ACTIVITY_DELETE, $entity_id, $entity_type, $content, $uid);
  }

  public static function createActivityUpdate($entity_id, $entity_type, $field_name, $old_value, $new_value) {
    $activity = new Activity;
    $uid = Auth::user()->uid;
    $content = $field_name . '+' . $old_value . '+' . $new_value;
    $activity->createActivity(ACTIVITY_UPDATE, $entity_id, $entity_type, $content, $uid);
  }

}
