<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class City_Ctrl extends My_Controller {

	/**
	 * Load models and libraries
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->model('city_model','city');
		$this->is_admin_login();
		$this->data=array('title' => "City");
	}

	public function index($offset = 0)
	{
		$num_rows 							= $this->city->count();
		$config 								= $this->paginationConfig('city/index', $num_rows);

		$this->data['links'] 		= $this->pagination->create_links();
		$this->data['data'] 		= $this->city->get('', $config['per_page'], $offset);
		$this->data['content']	= $this->load->view('city/index',$this->data, true);

		$this->load->view('layout/index',$this->data);
	}

	public function add()
	{
		$this->data['title'] = "Add City";

		if($this->input->method()=="get"){
			$this->data['content']    = $this->load->view('city/form', null, true);
			$this->load->view('layout/index',$this->data);
		}else{
			$this->data=array(
				'name'			=>	$this->input->post('name', TRUE)
			);
			if($this->city->save($this->data)){
				$this->session->set_flashdata('success', 'Record added');
			}else{
				$this->session->set_flashdata('error', 'Record not added');
			}
			redirect(base_url('/cities'));
		}
	}

	public function edit($id)
	{
		$condition=array('id' => $id);
		$this->data['title'] = "Edit City";

		if($this->input->method()=="get"){
			$this->data['data']= $this->city->get($condition);
			$this->data['content']=$this->load->view('city/form',$this->data,true);
			$this->load->view('layout/index',$this->data);
		}else{
			$this->data=array(
				'name'				=>	$this->input->post('name', TRUE)
			);

			if($this->city->edit($this->data,$condition)){
				$this->session->set_flashdata('success', 'Record updated');
			}else{
				$this->session->set_flashdata('error', 'Record not updated');
			}

			redirect(base_url('/cities'));

		}
	}

	public function delete( $id = '' )
	{
		$id = $this->input->post('id', true);

		if ($id!='')
		{
			if ($this->city->remove($id))
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
			if ($this->city->removeall($this->input->post('chk', true)) )
				$this->session->set_flashdata('success', 'Selected '.count($this->input->post('chk', true)).' Records are deleted');
			else
				$this->session->set_flashdata('error', 'Selected '.count($this->input->post('chk', true)).' Records are not deleted');
		}

		redirect(base_url('/cities'));
	}


	public function getData(){
		// POST data
		$postData = $this->input->post();
   
		// Get data
		// $data = $this->Employee_model->getEmployees($postData);
		$data = $this->city->filteredData($postData);
		echo json_encode($data);
	 }
}