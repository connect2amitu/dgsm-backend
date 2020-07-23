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
		$slug   = $this->input->get('slug', TRUE)?$this->input->get('slug', TRUE):"";

		
		$query = array('start'=>$page,'draw'=>null,'columnIndex'=>null,'columnName'=>'quotes.created','columnSortOrder'=>$order,'searchValue'=>'','rowperpage'=>$size,'order'=>$order,'where'=>array('artists.slug'=>$slug));
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
	
	public function getQuoteTopics(){
		$slug   = $this->input->get('slug', TRUE)?$this->input->get('slug', TRUE):"";
		$order  = $this->input->get('order', TRUE)?$this->input->get('order', TRUE):'DESC';
		$query = array('where'=>array('slug'=>$slug),'columnName'=>'quotes.created','columnSortOrder'=>$order);

		$data 		= $this->quote->getQuotesTitleDataForMainCategory($query);
		
		$resp=array(
			'message'=>"Success",
			'data'=>$data,
			'status'=>200
		);
		$this->response($resp);	

	
	}
}