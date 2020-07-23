<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login_Ctrl extends My_Controller {

	/**
	 * Load models and libraries
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->model('login_model','login');
	}

	public function index()
	{
		if ($this->session->userdata('admin_id') != null)
		{
				redirect(base_url());
		}else{
			$this->load->view('login/index');
		}
	}

	/**
	 * Admin Login Check
	 * @return void
	 */
	public function checkLogin()
	{
		$data = array(
						'email'=>$this->input->post('email', true)
						// 'password'=>password_hash($this->input->post('password', true), PASSWORD_BCRYPT)
					);
		$data = $this->login->login('admin', $data);

		
		if (count($data) == 1)
		{
			if (password_verify($this->input->post('password', true), $data[0]['password'])) {
				$array = array('admin_id' => ucfirst($data[0]['name']) );
				$this->session->set_userdata( $array );
				$this->session->set_flashdata('success', 'Login Success');
				redirect(base_url());
			}else {
				$this->session->set_flashdata('error', 'Login Failed');
				redirect(base_url('login'));				
			}
		}
		else
		{
			$this->session->set_flashdata('error', 'Login Failed');
			redirect(base_url('login'));
		}
	}

	/**
	 * Logout the admin session
	 * @return void
	 */
	public function logout()
	{
		$this->session->sess_destroy();
		redirect(base_url('login'));
	}

}
