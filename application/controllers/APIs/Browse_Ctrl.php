<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Browse_Ctrl extends My_Controller {

	/**
	 * Load models and libraries
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->model('track_model','track');
		$this->load->model('artist_model','artist');

	}
	
	public function index()
	{
		$page   = $this->input->get('page', TRUE)?$this->input->get('page', TRUE):0;
		$size   = $this->input->get('size', TRUE)?$this->input->get('size', TRUE):10;
		$slug   = $this->input->get('slug', TRUE)?$this->input->get('slug', TRUE):"";
		$content   = $this->input->get('content', TRUE)?$this->input->get('content', TRUE):10;
		$order  = $this->input->get('order', TRUE)?$this->input->get('order', TRUE):'DESC';
		$lang  = $this->input->get('lang', TRUE)?$this->input->get('lang', TRUE):'hindi';

		$query = array('page'=>$page,'size'=>$size,'order'=>$order,'where'=>array('artists.slug'=>$slug,'tracks.language'=>$lang),'content'=>$content);
		$data 		= $this->track->getBrowseTrackData($query);
		$artist 		= $this->artist->get(array('artists.slug'=>$slug));
		if(count($artist)){
			$artist = $artist[0];
		}else{
			$artist=null;
		}

		$resp=array(
			'message'=>"Success",
			'data'=>$artist,
			'tracks'=>$data['aaData'],
			'total'=>$data['iTotalRecords'],
			'totalPages'=>ceil($data['iTotalRecords']/$size),
			'status'=>200
		);
		$this->response($resp);	
	}
	
	public function mainCategory()
	{
		$query = array('type' => "main");
		$artist 		= $this->artist->get($query);

		$resp=array(
			'message'=>"Success",
			'data'=>$artist,
			'status'=>200
		);
		$this->response($resp);	
	}
}