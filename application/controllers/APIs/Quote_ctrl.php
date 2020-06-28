<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Quote_Ctrl extends My_Controller {

	/**
	 * Load models and libraries
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->model('quote_model','quote');
	}
	
	public function index()
	{
		$page   = $this->input->get('page', TRUE)?$this->input->get('page', TRUE):0;
		$size   = $this->input->get('size', TRUE)?$this->input->get('size', TRUE):10;
		$order  = $this->input->get('order', TRUE)?$this->input->get('order', TRUE):'DESC';

		
		$query = array('page'=>$page,'size'=>$size,'order'=>$order,'where'=>array());
		$data 		= $this->quote->getQuotesData($query);
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