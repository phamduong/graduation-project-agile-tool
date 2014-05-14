<?php

class CommentController extends BaseController {

  public function getComment() {
    $comment = new Comment;
    $data = array('status' => 200);
    $data['comment'] = array();
    $count_com = $comment->countComment($pid, ENTITY_PROJECT);
    if ($input['count_from'] > $count_com) {
      $data['status'] = 800;
      $data['message'] = 'Parameter from error!';
      return $data;
    }
    if (($input['count_from'] + $input['count']) > $count_com) {
      $input['count'] = $count_com - $input['count_from'];
      //No more comment
      $data['comment']['more'] = 0;
    } else if (($input['count_from'] + $input['count']) == $count_com) {
      //No more comment
      $data['comment']['more'] = 0;
    }
    $data['comment']['more'] = 1;
    $data['comment'] = $comment->getComment($pid, ENTITY_PROJECT, $input['count_from'], $input['count']);
    return $data;
  }

}
