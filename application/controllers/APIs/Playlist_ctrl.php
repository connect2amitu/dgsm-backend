<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Playlist_Ctrl extends My_Controller {

	/**
	 * Load models and libraries
	 */
	public function __construct(){
		parent::__construct();
		$this->load->model('playlist_model','playlist');
	}
	
	public function index(){


		$page   	= $this->input->get('page', TRUE)?$this->input->get('page', TRUE):0;
		$size   	= $this->input->get('size', TRUE)?$this->input->get('size', TRUE):10;
		$order  	= $this->input->get('order', TRUE)?$this->input->get('order', TRUE):'ASC';
		$user 		= $this->checkAuth();
		$user_id  = $user->id;

		$data 		= $this->playlist->get(array('user_id' => $user_id));
		$resp=array(
			'message'=>"Success",
			'data'=>$data,
			'status'=>200
		);
		$this->response($resp);
		
	}

	public function createPlaylist(){

		if ($_SERVER['REQUEST_METHOD'] === 'POST') {
			$user 		= $this->checkAuth();
			$user_id  = $user->id;
			$name=$this->input->post('name', TRUE);
			$track_id=$this->input->post('track_id', TRUE);
			$data=array(
									'name'=>$name,
									'user_id'=>$user_id
			);
			if($playlist_id = $this->playlist->save($data)){
				$resp=array( 'message'=>"Playlist created ", 'data'=>$this->playlist->get(array('user_id' => $user_id)), 'status'=>200 );
				if(isset($track_id)){
					$data = array( 'user_id'=>$user_id, 'playlist_id'=>$playlist_id, 'track_id'=>$track_id );
					if($id = $this->playlist->addToPlaylist($data)){
						$resp=array( 'message'=>"Playlist created and added track into Success", 'data'=>$this->playlist->get(array('user_id' => $user_id)), 'status'=>200 );
					}else{
						$resp=array( 'message'=>"Playlist created and added track into  Failed", 'data'=>array(), 'status'=>500, );
					}
				}
			}else{
				$resp=array( 'message'=>"Playlist created Failed", 'data'=>array(), 'status'=>500);
			}
			$this->response($resp);
		}
	}

	public function addTrack(){
		if ($_SERVER['REQUEST_METHOD'] === 'POST') {
			$user 		= $this->checkAuth();
			$user_id  = $user->id;
			$track_id=$this->input->post('track_id', TRUE);
			$playlist_id=$this->input->post('playlist_id', TRUE);

			$data = array(
					'user_id'=>$user_id,
					'playlist_id'=>$playlist_id,
					'track_id'=>$track_id
			);

			if($id = $this->playlist->addToPlaylist($data)){
				$resp=array(
					'message'=>"Success",
					'data'=>$this->playlist->getPlaylistDetail(array('playlists_tracks.user_id' => $user_id)),
					'status'=>200
				);
			}else{
				$resp=array(
					'message'=>"Failed",
					'data'=>array(),
					'status'=>500,
				);
			}
			$this->response($resp);
		}
	}
	
	public function removeTrack(){
		if ($_SERVER['REQUEST_METHOD'] === 'POST') {

			$user 		= $this->checkAuth();
			$user_id  = $user->id;
			$id = $this->input->post('trackId', TRUE);

			if($this->playlist->removeTrackFromPlaylist(array('id' => $id, 'user_id'=>$user_id))){
				$resp=array(
					'message'=>"Successfully removed track",
					'status'=>200
				);
			}else{
				$resp=array(
					'message'=>"Failed to remove track",
					'status'=>500,
				);
			}
			}
		$this->response($resp);
	}

	public function tracks(){
		
		$user 		= $this->checkAuth();
		$user_id  = $user->id;

		$playlist_id  = $this->input->get('playlist_id', TRUE)?$this->input->get('playlist_id', TRUE):'';

		if($user_id!=="" && $playlist_id!==""){
			$tracks = $this->playlist->getPlaylistDetail(array('playlists.user_id' => $user_id,'playlists.id' => $playlist_id,'tracks.id!=' => null));
			$playlist = $this->playlist->get(array('playlists.user_id' => $user_id,'playlists.id' => $playlist_id));
			$playlist = $playlist ? $playlist[0]:array();
			$playlist['tracks']=$tracks;
			$resp=array(
				'message'=>"Success",
				'data'=>$playlist,
				'status'=>200
			);
		}else{
			$resp=array(
				'message'=>"Invalid Parameter",
				'data'=>array(),
				'status'=>500
			);
		}
			$this->response($resp);
	}
		
	public function removePlaylist(){

		if ($_SERVER['REQUEST_METHOD'] === 'POST') {
			$user 		= $this->checkAuth();
			$user_id  = $user->id;
			$playlist_id=$this->input->post('playlistId', TRUE);
			$data=array(
									'id'=>$playlist_id,
									'user_id'=>$user_id
			);
			if($playlist_id = $this->playlist->remove($data)){
				$resp=array(
					'message'=>"Playlist deleted ", 
					'status'=>200 
				);
			}else{
				$resp=array( 'message'=>"Playlist not deleted", 'status'=>500);
			}
			$this->response($resp);
		}
	}
}