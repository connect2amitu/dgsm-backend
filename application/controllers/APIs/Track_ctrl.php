<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Track_Ctrl extends My_Controller {

	/**
	 * Load models and libraries
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->model('track_model','track');
	}
	
	public function index()
	{
		// $page   = $this->input->get('page', TRUE)?$this->input->get('page', TRUE):0;
		// $size   = $this->input->get('size', TRUE)?$this->input->get('size', TRUE):10;
		// $type   = $this->input->get('type', TRUE)?$this->input->get('type', TRUE):10;
		// $order  = $this->input->get('order', TRUE)?$this->input->get('order', TRUE):'ASC';
		// $total  = $this->track->count();
		
		// $data 		= $this->track->get('',$size,$page);
		// $resp=array(
		// 	'message'=>"Success",
		// 	'data'=>$data,
		// 	'totalPages'=>ceil($total/$size),
		// 	'status'=>200
		// );
		// $this->response($resp);
		$page   = $this->input->get('page', TRUE)?$this->input->get('page', TRUE):0;
		$size   = $this->input->get('size', TRUE)?$this->input->get('size', TRUE):10;
		$content   = $this->input->get('content', TRUE)?$this->input->get('content', TRUE):10;
		$order  = $this->input->get('order', TRUE)?$this->input->get('order', TRUE):'DESC';
		$lang  = $this->input->get('lang', TRUE)?$this->input->get('lang', TRUE):'hindi';

		$query = array('page'=>$page,'size'=>$size,'order'=>$order,'where'=>array(),'content'=>$content);
		$data 		= $this->track->getBrowseTrackData($query);

		$resp=array(
			'message'=>"Success",
			'data'=>$data['aaData'],
			'total'=>$data['iTotalRecords'],
			'totalPages'=>ceil($data['iTotalRecords']/$size),
			'status'=>200
		);
		$this->response($resp);	
	}
}