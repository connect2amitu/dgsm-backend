<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class My_Controller extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		
		$this->load->helper(['jwt', 'authorization']); 
		if (isset($_SERVER['HTTP_ORIGIN'])) {
			// Decide if the origin in $_SERVER['HTTP_ORIGIN'] is one
			// you want to allow, and if so:
			header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
			header('Access-Control-Allow-Credentials: true');
			header('Access-Control-Max-Age: 86400');    // cache for 1 day
			header("Content-Type: application/x-www-form-urlencoded\r\n");

	}

	// Access-Control headers are received during OPTIONS requests
	if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {

			if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
					// may also be using PUT, PATCH, HEAD etc
					header("Access-Control-Allow-Methods: GET, POST, OPTIONS");         

			if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
					header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

			exit(0);
	}
	
	}
	/**
	 * check if admin is login
	 * @return boolean retrun true on successfully login status else redirect to index page
	 */
	public function is_admin_login()
	{
		if ( $this->session->userdata('admin_id')!='' )
		{
			return true;
		}
		else
		{
			redirect(base_url('login'));
		}
	}


	/**
	 * API response
	 */
	function response($response)
	{
		header("HTTP/1.1 ".$response['status']);
		$json_response = json_encode($response,JSON_NUMERIC_CHECK);
		echo $json_response;
		die;
	}
	
	/**
	 * check AuthORIZATION
	 */
	function checkAuth()
	{
		$headers = $this->input->request_headers();
		$token=isset($headers['Authorization'])?$headers['Authorization']:false;
		if($token){
			try {
				$data = AUTHORIZATION::validateToken($token);
				return $data;
			} catch (Exception $e) {
				$resp=array(
					'message'=>"Unauthorized Access",
					'status'=>500
				);
				My_Controller::response($resp);
				die;
			}
		}else{
			$resp=array(
				'message'=>"Authorization Token Missing",
				'status'=>500
			);
			My_Controller::response($resp);
			die;
		}
	}


	/**
	 * Create Slug
	 */
	function create_slug($text){
		return strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $text)));
 	}

	/**
	 * Pagination Confrigration Function
	 * @param  string $url        url of pagination
	 * @param  int $total_rows total number of records
	 * @return array
	 */
	public function paginationConfig($url, $total_rows)
	{
		$this->load->library('pagination');

		$config['base_url'] = base_url($url);
		$config['total_rows'] = $total_rows;
		$config['per_page'] = PER_PAGE;
		$config['num_links'] = $total_rows;
		$config['full_tag_open'] = "<ul class='pagination pagination-flat' style='display: flex;justify-content: flex-end;padding:18px'>";
		$config['full_tag_close'] ="</ul>";
		$config['num_tag_open'] = '<li>';
		$config['num_tag_close'] = '</li>';
		$config['cur_tag_open'] = "<li class='disabled'><li class='active'><a href='#'>";
		$config['cur_tag_close'] = "<span class='sr-only'></span></a></li>";
		$config['next_tag_open'] = "<li>";
		$config['next_tagl_close'] = "</li>";
		$config['prev_tag_open'] = "<li>";
		$config['prev_tagl_close'] = "</li>";
		$config['first_tag_open'] = "<li>>";
		$config['first_link'] = 'First';
		$config['last_link'] = 'Last';
		$config['first_tagl_close'] = "</li>";
		$config['last_tag_open'] = "<li>";
		$config['last_tagl_close'] = "</li>";
		$this->pagination->initialize($config);
		return $config;

	}

}

/* End of file My_Controller.php */
/* Location: ./application/core/My_Controller.php */
