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
		$this->load->model('artist_model','artist');
		$this->is_admin_login();
		$this->data=array('title' => "Quote");
	}

	public function index($offset = 0)
	{
		$num_rows 							= $this->quote->count();
		$config 								= $this->paginationConfig('quote/index', $num_rows);

		$this->data['links'] 		= $this->pagination->create_links();
		$this->data['data'] 		= $this->quote->get('', $config['per_page'], $offset);
		$this->data['content']	= $this->load->view('quote/index',$this->data, true);

		$this->load->view('layout/index',$this->data);
	}

	public function add()
	{
		$this->data['title'] = "Add Quote";

		if($this->input->method()=="get"){
			$this->data['artists'] 		= $this->artist->get();
			$this->data['content']    = $this->load->view('quote/form', 	$this->data, true);
			$this->load->view('layout/index',$this->data);
		}else{
			$this->data=array(
				'quote'			=>	$this->input->post('quote', TRUE),
				'artist_id'			=>	$this->input->post('artist_id', TRUE),
			);
			if($this->quote->save($this->data)){
				$this->session->set_flashdata('success', 'Record added');
			}else{
				$this->session->set_flashdata('error', 'Record not added');
			}
			redirect(base_url('/quotes'));
		}
	}

	public function edit($id)
	{
		$condition=array('id' => $id);
		$this->data['title'] = "Edit Quote";

		if($this->input->method()=="get"){
			$this->data['data']= $this->quote->get($condition);
			$this->data['artists'] 		= $this->artist->get();
			$this->data['content']    = $this->load->view('quote/form', 	$this->data, true);
			$this->load->view('layout/index',$this->data);
		}else{
			$this->data=array(
				'quote'				=>	$this->input->post('quote', TRUE),
				'artist_id'			=>	$this->input->post('artist_id', TRUE),
			);

			if($this->quote->edit($this->data,$condition)){
				$this->session->set_flashdata('success', 'Record updated');
			}else{
				$this->session->set_flashdata('error', 'Record not updated');
			}

			redirect(base_url('/quotes'));

		}
	}

	public function delete( $id = '' )
	{
		$id = $this->input->post('id', true);

		if ($id!='')
		{
			if ($this->quote->remove($id))
			{
				$this->session->set_flashdata('success', 'Record deleted');
				echo 1;
			}
			else
			{
				$this->session->set_flashdata('error', 'Record not deleted');
				echo 0;
			}
		}
	}

	public function deleteall()
	{
		if (!empty($this->input->post('chk', true)))
		{
			if ($this->quote->removeall($this->input->post('chk', true)) )
				$this->session->set_flashdata('success', 'Selected '.count($this->input->post('chk', true)).' Records are deleted');
			else
				$this->session->set_flashdata('error', 'Selected '.count($this->input->post('chk', true)).' Records are not deleted');
		}

		redirect(base_url('/quotes'));
	}


	public function getData(){
		// POST data
		$postData = $this->input->post();
		// Get data


		$draw = $postData['draw'];
		$start = $postData['start'];
		$rowperpage = $postData['length']; // Rows display per page
		$columnIndex = $postData['order'][0]['column']; // Column index
		$columnName = $postData['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $postData['order'][0]['dir']; // asc or desc
		$searchValue = $postData['search']['value']; // Search value
		$query=array(
			'draw'=>$draw,
			'start'=>$start,
			'rowperpage'=>$rowperpage,
			'columnIndex'=>$columnIndex,
			'columnName'=>$columnName,
			'columnSortOrder'=>$columnSortOrder,
			'searchValue'=>$searchValue,
		);
		$data = $this->quote->getQuotesData($query);

		echo json_encode($data);
	 }



}