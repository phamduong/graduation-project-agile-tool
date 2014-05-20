<?php

class CommentController extends BaseController {

  /**
   * DO NOT NEED THIS FUNCTION
   * @return string
   */
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

  /**
   * Reply to a comment
   * @return string
   */
  public function reply() {
    $comment = new Comment;
    $data = array('status' => 800, 'message' => 'Reply comment error!');
    $input = Input::all();
    $comment->uid = Auth::user()->uid;
    $comment->entity_id = $input['entity_id'];
    $comment->entity_type = $input['entity_type'];
    $comment->content = $input['content'];
    $comment->parent_id = $input['parent_id'];
    if ($comment->save() == 1) {
      $data['status'] = 200;
      $data['message'] = 'Reply comment sucessfully!';
      $data['cid'] = $comment->cid;
      $data['time'] = Comment::find($data['cid'])->time;
    }
    return $data;
  }

  /**
   * Add new comment
   * @return type
   */
  public function add() {
    $comment = new Comment;
    $data = array('status' => 800, 'message' => 'Reply comment error!');
    $input = Input::all();
    $comment->uid = Auth::user()->uid;
    $comment->entity_id = $input['entity_id'];
    $comment->entity_type = $input['entity_type'];
    $comment->content = $input['content'];
    if ($comment->save() == 1) {
      $data['status'] = 200;
      $data['message'] = 'Add new comment sucessfully!';
      $data['cid'] = $comment->cid;
      $data['time'] = Comment::find($data['cid'])->time;
    }
    return $data;
  }

}
