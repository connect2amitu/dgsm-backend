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
	

/**
	 * Function that groups an array of associative arrays by some key.
	 * 
	 * @param {String} $key Property to sort by.
	 * @param {Array} $data Array that stores multiple associative arrays.
	 */
	function group_by($key, $data) {
		$result = array();

		foreach($data as $val) {
				if(array_key_exists($key, $val)){
						$result[$val[$key]][] = $val;
				}else{
						$result[""][] = $val;
				}
		}

		return $result;
	}

	public function index()
	{
		$order  = $this->input->get('order', TRUE)?$this->input->get('order', TRUE):'DESC';
		$slug   = $this->input->get('slug', TRUE)?$this->input->get('slug', TRUE):"";

		
		$query = array('columnName'=>'quotes.created','columnSortOrder'=>$order,'order'=>$order,'where'=>array('artists.slug'=>$slug));
		$data 		= $this->quote->getQuotesDataForMainCategory($query);
		

		$returnData = null;
        foreach ($data as $row) {
            if (!isset($returnData[$row['title']])) {
                $returnData[$row['title']]= [
                    'quotes' => [
                        [
                            'quote' => $row['quote']
                        ],
                    ]
                ];
            } else {
                $returnData[$row['title']]['quotes'][] = [
                    'quote' => $row['quote']
                ];
            }
        } 
				
		$resp=array(
			'message'=>"Success",
			'data'=>$returnData,
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