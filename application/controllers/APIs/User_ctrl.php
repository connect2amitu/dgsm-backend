<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_Ctrl extends My_Controller {

	/**
	 * Load models and libraries
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->model('user_model','user');
		$this->load->model('playlist_model','playlist');
	}

	public function createUser()
	{

		if ($_SERVER['REQUEST_METHOD'] === 'POST') {
			$message = "";
			$statusCode = 200;
			$oauth_provider=$this->input->post('oauth_provider', TRUE);
			$oauth_uid=$this->input->post('oauth_uid', TRUE);
			$name=$this->input->post('name', TRUE);
			$email=$this->input->post('email', TRUE);
			$picture=$this->input->post('picture', TRUE);
			$this->data = array(
				'oauth_provider' =>	$oauth_provider,
				'oauth_uid' =>	$oauth_uid,
				'name' =>	$name,
				'email' =>	$email,
				'picture' =>	$picture,
			);
			$userId="";
			$playlist = array();
			$condition = array('oauth_provider'=>$oauth_provider,'oauth_uid'=>$oauth_uid,'email'=>$email);
			if($user = $this->user->get($condition)){
				if(count($user)>0){
					$newData = array('modified'=>date('Y-m-d H:i:s'));
					if($this->user->edit($newData, $condition)){
						$this->data = $user[0];
						$userId = $user[0]['id'];
						$message = "Update Success";
					}else{
						$message = "Update Failed";
						$statusCode = 500;
					}					
					$playlist 		= $this->playlist->get(array('user_id' => $userId));
				}else{
					if($userId = $this->user->save($this->data)){
						$condition = array('id'=>$userId);
						$this->data = $this->user->get($condition)[0];
						$message = "Register Success";
					}else{
						$this->data = null;
						$message = "Register Failed";
						$statusCode = 500;
					}
				}
			}else{
				if($userId = $this->user->save($this->data)){
					$condition = array('id'=>$userId);
					$this->data = $this->user->get($condition)[0];
					$message = "new Register Success";
				}else{
					$this->data = null;
					$message = "new Register Failed";
					$statusCode = 500;
				}
			}
			$resp=array(
				'message'=>$message,
				'token'=> AUTHORIZATION::generateToken($this->data),
				'status'=>$statusCode,
				'userId'=>$userId,
				'playlists'=>$playlist,
			);
			$this->response($resp);
		}else{
				$resp=array(
					'message'=>"invalid method",
					'data'=>null,
					'status'=>500
				);
				$this->response($resp);
		 }
	}
}