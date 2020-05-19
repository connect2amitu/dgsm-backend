<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Album_Ctrl extends My_Controller {

	/**
	 * Load models and libraries
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->model('album_model','albums');
		$this->load->model('track_model','track');

	}

	public function index()
	{

		$page   = $this->input->get('page', TRUE)?$this->input->get('page', TRUE):0;
		$size   = $this->input->get('size', TRUE)?$this->input->get('size', TRUE):10;
		$order  = $this->input->get('order', TRUE)?$this->input->get('order', TRUE):'ASC';
		$q  = $this->input->get('q', TRUE)?$this->input->get('q', TRUE):'';

		$total 							= $this->albums->filterCount($q);

		$query=array(
			'offset'=>$page,
			'size'=>$size,
			'order'=>$order,
			// 'q'=>$q,
			'q'=>explode(" ",$q),
		);
		$data 		= $this->albums->getAlbums($query);
		$resp=array(
			'message'=>"Success",
			'data'=>$data,
			'totalPages'=>ceil($total/$size),
			'status'=>200,
			'total'=>$total,
		);

		$this->response($resp);
	}
	public function getBySlug($slug)
	{

		$query=array(
			'slug'=>$slug
		);
		$data 		= $this->albums->get($query);
		$tracks 		= $this->track->get($query);
		$_tracks=array();
		foreach ($tracks as $value) {
			
			# code...
		}
		if($data){
			$data=$data[0];
		}else{
			$data=null;
		}
		$data['tracks']=$tracks;
		$resp=array(
			'message'=>"Success",
			'data'=>$data,
			'status'=>200
		);
		$this->response($resp);
	}
}