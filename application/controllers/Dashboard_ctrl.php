<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_Ctrl extends My_Controller {

	/**
	 * Load models and libraries
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->model('dashboard_model','dashboard');
		$this->is_admin_login();
		$this->data=array('title' => "Dashboard");

	}

	public function index()
	{
		$data['content']=$this->load->view('dashboard/index',$this->data,true);
		$this->load->view('layout/index',$data);
	}
}
