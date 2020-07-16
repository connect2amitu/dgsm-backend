<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Album_Ctrl extends My_Controller {

	/**
	 * Load models and libraries
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->model('album_model','albums');
		$this->load->model('artist_model','artist');
		$this->is_admin_login();
		$this->data=array('title' => "Album");
	}

	public function index($offset = 0)
	{
		$num_rows 							= $this->albums->count();
		$config 								= $this->paginationConfig('album/index', $num_rows);

		$this->data['links'] 		= $this->pagination->create_links();
		$this->data['data'] 		= $this->albums->get('', $config['per_page'], $offset);
		$this->data['content']	= $this->load->view('album/index',$this->data, true);

		$this->load->view('layout/index',$this->data);
	}

	public function add()
	{
		$this->data['title'] = "Add Album";

		if($this->input->method()=="get"){
			$this->data['artists'] 		= $this->artist->get();
			$this->data['content']    = $this->load->view('album/form', $this->data, true);
			$this->load->view('layout/index',$this->data);
		}else{
			$tags = "";
			if($this->input->post('tags', TRUE)){
				$tags= join(', ',$this->input->post('tags', TRUE));
			}
			$name = $this->input->post('name', TRUE);
			$artist_id = $this->input->post('artist_id', TRUE);
			$type = $this->input->post('type', TRUE);

			$this->data=array(
				'name'			=> $name,
				'artist_id'	=> $artist_id,
				'type'	=> $type,
				'tags'	=>	$tags,
				'cover'=>$this->uploadImage(),
				'slug'=>$this->create_slug($name)
			);

			if($this->albums->save($this->data)){
				$this->session->set_flashdata('success', 'Record added');
			}else{
				$this->session->set_flashdata('error', 'Record not added');
			}
			redirect(base_url('/albums'));
		}
	}

	public function edit($id)
	{
		$condition=array('albums.id' => $id);
		$this->data['title'] = "Edit Album";

		if($this->input->method()=="get"){
			$this->data['data']= $this->albums->get($condition);
			$this->data['artists'] 		= $this->artist->get();
			$this->data['content']=$this->load->view('album/form',$this->data,true);
			$this->load->view('layout/index',$this->data);
		}else{
			$tags = "";
			
			if($this->input->post('tags', TRUE)){
				$tags= join(', ',$this->input->post('tags', TRUE));
			}

			$name = $this->input->post('name', TRUE);
			$slug = $this->input->post('slug', TRUE);
			$artist_id = $this->input->post('artist_id', TRUE);
			$type = $this->input->post('type', TRUE);

			$this->data=array(
				'name'			=> $name	,
				'artist_id'	=> $artist_id,
				'type'	=> $type,
				'tags'			=>	$tags,
				'slug'			=>	$slug,
			);

			$cover  = $this->uploadImage();

			if($cover){
				$this->data['cover']=$cover;
			}

			if($this->albums->edit($this->data,$condition)){
				$this->session->set_flashdata('success', 'Record updated');
			}else{
				$this->session->set_flashdata('error', 'Record not updated');
			}

			redirect(base_url('/albums'));

		}
	}

	public function delete( $id = '' )
	{
		$id = $this->input->post('id', true);

		if ($id!='')
		{
			if ($this->albums->remove($id))
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
			if ($this->albums->removeall($this->input->post('chk', true)) )
				$this->session->set_flashdata('success', 'Selected '.count($this->input->post('chk', true)).' Records are deleted');
			else
				$this->session->set_flashdata('error', 'Selected '.count($this->input->post('chk', true)).' Records are not deleted');
		}

		redirect(base_url('/albums'));
	}

	public function getData(){
		// POST data
		$postData = $this->input->post();
   
		$data = $this->albums->filteredData($postData);
		echo json_encode($data);
	 }


	 public function uploadImage(){
		$folder='uploads/album covers';
		$cover = "";

		if (!is_dir($folder)) {
			mkdir($folder, 0777, TRUE);
		}

		$config['upload_path']   = $folder;
		$config['allowed_types'] = 'gif|jpg|png';
		$config['max_size'] = 20000;
		$config['max_width'] = 15000;
		$config['max_height'] = 15000;
		$config['file_name']    = "cover";

		$this->load->library('upload', $config);

		if (!$this->upload->do_upload('cover')) {
				$error = array('error' => $this->upload->display_errors());
		} else {
				$data = array('image_metadata' => $this->upload->data());
				$cover = $folder."/".$data['image_metadata']['file_name'];
		}
		return $cover;
	 }
}