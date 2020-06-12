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
	}
	
	public function index()
	{
		$page   = $this->input->get('page', TRUE)?$this->input->get('page', TRUE):0;
		$size   = $this->input->get('size', TRUE)?$this->input->get('size', TRUE):10;
		$name   = $this->input->get('name', TRUE)?$this->input->get('name', TRUE):"";
		$content   = $this->input->get('content', TRUE)?$this->input->get('content', TRUE):10;
		$order  = $this->input->get('order', TRUE)?$this->input->get('order', TRUE):'ASC';

		$query = array('page'=>$page,'size'=>$size,'order'=>$order,'name'=>$name,'content'=>$content);
		$data 		= $this->track->getBrowseTrackData($query);
		echo '<pre>';
		print_r($data);
		echo '</pre>';
		die;
		$resp=array(
			'message'=>"Success",
			'data'=>$data,
			'totalPages'=>ceil($total/$size),
			'status'=>200
		);
		$this->response($resp);	
	}
}