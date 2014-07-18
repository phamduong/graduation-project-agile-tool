<?php

class AttachController extends BaseController {

  public function attachFile($entity_type, $entity_id) {
    if (isset($_FILES['attach'])) {
      $count = count($_FILES['attach']['name']);
      $data = array();
      $attach_model = new Attach();
      switch ($entity_type) {
        case ENTITY_PROJECT: {
            $target_path = 'data/attach/project_' . $entity_id . '/project/' . $entity_id . '/';
            if (!file_exists($target_path)) {
              if (!mkdir($target_path, 0777, true)) {
                $data['status'] = 800;
                $data['message'] = 'Error when store attach file, please try again';
//            return ('Error creating folder');
              }
            }
            for ($i = 0; $i < $count; $i++) {
              $filename = $_FILES['attach']['name'][$i];
              $destination = $target_path . $filename;
              move_uploaded_file($_FILES['attach']['tmp_name'][$i], $destination);
//            $attach_model->addAttach($filename, ENTITY_PROJECT, $entity_id);
              $attach = new Attach;
              $attach->file_name = $filename;
              $attach->entity_type = ENTITY_PROJECT;
              $attach->entity_id = $entity_id;
              if ($attach->save()) {
                ActivityController::createActivityAdd($entity_id, ENTITY_PROJECT, $attach->atid, ENTITY_ATTACH);
              }
            }
            $data['status'] = 200;
            $data['message'] = '';
            break;
          }
        case ENTITY_STORY: {
          $current_project = Session::get('current_project');
          $target_path = 'data/attach/project_' . $current_project . '/story/' . $entity_id . '/';
            if (!file_exists($target_path)) {
              if (!mkdir($target_path, 0777, true)) {
                $data['status'] = 800;
                $data['message'] = 'Error when store attach file, please try again';
//            return ('Error creating folder');
              }
            }
            for ($i = 0; $i < $count; $i++) {
              $filename = $_FILES['attach']['name'][$i];
              $destination = $target_path . $filename;
              move_uploaded_file($_FILES['attach']['tmp_name'][$i], $destination);
//            $attach_model->addAttach($filename, ENTITY_PROJECT, $entity_id);
              $attach = new Attach;
              $attach->file_name = $filename;
              $attach->entity_type = ENTITY_STORY;
              $attach->entity_id = $entity_id;
              if ($attach->save()) {
                ActivityController::createActivityAdd($entity_id, ENTITY_STORY, $attach->atid, ENTITY_ATTACH);
              }
            }
            $data['status'] = 200;
            $data['message'] = '';
            break;
          }
      }
      return $data;
    }
  }

  public static function getAttach($entity_type, $entity_id) {
    $attach_model = new Attach();
    $arr_attach = $attach_model->getAttach($entity_id, $entity_type);
    $arr_link = array();
    $i = 0;
//    switch ($entity_type) {
//      case ENTITY_PROJECT: {
//          foreach ($arr_attach as $attach) {
//            $arr_link[$i]['name'] = $attach->file_name;
//            $arr_link[$i]['taid'] = $attach->atid;
//            $i++;
//          }
//          break;
//        }
//      case ENTITY_STORY: {
//          break;
//        }
//    }
    foreach ($arr_attach as $attach) {
      $arr_link[$i]['name'] = $attach->file_name;
      $arr_link[$i]['taid'] = $attach->atid;
      $i++;
    }
    return $arr_link;
  }

  public static function removeAttach() {
    $input = Input::all();
    $arr_filename = $input['arr_filename'];
    $entity_id = $input['entity_id'];
    $entity_type = $input['entity_type'];
    $attach_model = new Attach();
    foreach ($arr_filename as $filename) {
      $attach_model->removeAttach($filename, $entity_type, $entity_id);
      $atid = $attach_model->getAttachId($filename, $entity_type, $entity_id);
      ActivityController::createActivityDelete($entity_id, $entity_type, $atid, ENTITY_ATTACH);
    }    
    $data = array('status' => 200, 'message' => 'Update successfully');
    return $data;
  }

  public function downloadAttach($atid) {
    $attach = Attach::find($atid);
    $entity_id = $attach->entity_id;
    $entity_type = $attach->entity_type;
    $filename = $attach->file_name;
    $current_project = Session::get('current_project');
    switch ($entity_type) {
      case ENTITY_PROJECT: {
          $path = public_path().'\\data\\attach\\project_' . $entity_id . '\\project\\'. $entity_id . '\\' . $filename;
          break;
        }
      case ENTITY_STORY:{
        $path = public_path().'\\data\\attach\\project_' . $current_project . '\\story\\'. $entity_id . '\\' . $filename;
        break;
      }
    }
    return Response::download($path);
  }

}
