<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Playlist_Ctrl extends My_Controller {

	/**
	 * Load models and libraries
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->model('playlist_model','playlist');
		$this->load->model('artist_model','artist');
		$this->is_admin_login();
		$this->data=array('title' => "Playlist");
	}

	public function index($offset = 0)
	{
		$num_rows 							= $this->playlist->count();
		$config 								= $this->paginationConfig('playlist/index', $num_rows);

		$this->data['links'] 		= $this->pagination->create_links();
		$this->data['data'] 		= $this->playlist->get('', $config['per_page'], $offset);
		$this->data['content']	= $this->load->view('playlist/index',$this->data, true);

		$this->load->view('layout/index',$this->data);
	}

	public function add()
	{
		$this->data['title'] = "Add Playlist";

		if($this->input->method()=="get"){
			$this->data['artists'] 		= $this->artist->get();
			$this->data['content']    = $this->load->view('playlist/form', $this->data, true);
			$this->load->view('layout/index',$this->data);
		}else{
			$this->data=array(
				'name'			=>	$this->input->post('name', TRUE),
				'artist_id'	=>	$this->input->post('artist_id', TRUE)
			);
			if($this->playlist->save($this->data)){
				$this->session->set_flashdata('success', 'Record added');
			}else{
				$this->session->set_flashdata('error', 'Record not added');
			}
			redirect(base_url('/playlist'));
		}
	}

	public function edit($id)
	{
		$condition=array('playlist.id' => $id);
		$this->data['title'] = "Edit Playlist";

		if($this->input->method()=="get"){
			$this->data['data']= $this->playlist->get($condition);
			$this->data['artists'] 		= $this->artist->get();
			$this->data['content']=$this->load->view('playlist/form',$this->data,true);
			$this->load->view('layout/index',$this->data);
		}else{
			$this->data=array(
				'name'				=>	$this->input->post('name', TRUE),
				'artist_id'		=>	$this->input->post('artist_id', TRUE)
			);

			if($this->playlist->edit($this->data,$condition)){
				$this->session->set_flashdata('success', 'Record updated');
			}else{
				$this->session->set_flashdata('error', 'Record not updated');
			}

			redirect(base_url('/playlist'));

		}
	}

	public function delete( $id = '' )
	{
		$id = $this->input->post('id', true);

		if ($id!='')
		{
			if ($this->playlist->remove($id))
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
			if ($this->playlist->removeall($this->input->post('chk', true)) )
				$this->session->set_flashdata('success', 'Selected '.count($this->input->post('chk', true)).' Records are deleted');
			else
				$this->session->set_flashdata('error', 'Selected '.count($this->input->post('chk', true)).' Records are not deleted');
		}

		redirect(base_url('/playlist'));
	}
}
