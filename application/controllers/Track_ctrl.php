<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Track_Ctrl extends My_Controller {

	/**
	 * Load models and libraries
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->model('album_model','album');
		$this->load->model('track_model','track');
		$this->load->model('artist_model','artist');
		$this->load->model('city_model','city');
		$this->is_admin_login();
		$this->data=array('title' => "Track");
	}

	public function index($offset = 0)
	{
		$num_rows 							= $this->track->count();
		$config 								= $this->paginationConfig('track/index', $num_rows);

		$this->data['links'] 		= $this->pagination->create_links();
		$this->data['data'] 		= $this->track->get('', $config['per_page'], $offset);
		$this->data['content']	= $this->load->view('track/index',$this->data, true);

		$this->load->view('layout/index',$this->data);
	}

	public function add()
	{
		$this->data['title'] = "Add Bhajan";
		if($this->input->method()=="get"){
			$this->data['artists'] 		= $this->artist->get();
			$this->data['albums'] 		= $this->album->get(array('albums.type'=>'bhajan'));
			$this->data['cities'] 		= $this->city->get();
			$this->data['content']    = $this->load->view('track/form', $this->data, true);
			$this->load->view('layout/index',$this->data);
		}else{
      $album_id    =   $this->input->post('album_id', TRUE);
      $artist_id   =   $this->input->post('artist_id', TRUE);
      $city_id   =   $this->input->post('city_id', TRUE);
      $language   =   $this->input->post('language', TRUE);
      $other_artist_name   =   $this->input->post('other_artist_name', TRUE);
	  $is_in_album =   $this->input->post('is_in_album', TRUE)?$this->input->post('is_in_album', TRUE):0;
	  

      if(isset($_FILES['tracks'])){
				$folder_name =  'uploads/bhajan';
				if($artist_id){
					$artist  = $this->artist->get(array('id'=> $artist_id ));
					$artistName = trim($artist[0]['name']);
					
					if(count($artist)){
						$folder_name.='/'.$artistName;
					}
					if($city_id){
						$city  = $this->city->get(array('id'=> $city_id ));
						if(count($city)){
							$folder_name.='/'.$city[0]['name'];
						}
					}

				}
				if($language){
						$folder_name.= '/'.$language;
				}
        if($is_in_album){
          $album = $this->album->get(array('albums.id'=> $album_id ));
          if(count($album)){
						$albumName = trim($album[0]['name']);
            $folder_name.= '/'.$albumName;
          }
        }
       
			
		if (!is_dir($folder_name)) {
      mkdir($folder_name, 0777, TRUE);	
		}

      $fileName=array();
					foreach ($_FILES as $key => $value) {
						$fileName[]= $value['name'];
					}
					$config['upload_path']   = $folder_name;
					$config['allowed_types'] = '*';
					$config['overwrite']     = 'false';
					$config['max_size']      = 100000;
					$config['max_width']     = 100000;
					$config['max_height']    = 100000;
					$config['encrypt_name']    = TRUE;
					$config['file_name']    = $fileName[0];
					$this->load->library('upload', $config);
        
					if (!$this->upload->do_multi_upload('tracks')) {
						 $error = array('error' => $this->upload->display_errors());
						 echo `<pre>`;
						 echo "err";
						 print_r($error);
						 echo `</pre>`;
						 die;
					}
					else {
						$uploded_files_array = $this->upload->get_multi_upload_data();
						$insert_array=array();
						foreach ($uploded_files_array as $file) {
							$insert_array[]=array(
							'album_id'=> $album_id,
							'artist_id'=> $artist_id,
							'city_id'=> $city_id,
							'language'=> $language,
							'type'=> "bhajan",
							'other_artist_name'=> $other_artist_name,
							'is_in_album'=> $is_in_album,
							'size'=> $file['file_size'],
							'name'=>pathinfo($file['client_name'], PATHINFO_FILENAME),
							'url'=>$folder_name.'/'.$file['file_name'],
							);
						}
						
						 if($this->track->save_many($insert_array)){
							$this->session->set_flashdata('success', 'Record added');
						}else{
								$this->session->set_flashdata('error', 'Record not added');
						}
					}
				}else{
							
				}
				redirect(base_url('/tracks'));
		}
	}

	public function edit($id)
	{
		$condition=array('tracks.id' => $id);
		$this->data['title'] = "Edit Track";

		if($this->input->method()=="get"){
			$this->data['data']= $this->track->get($condition);
			$this->data['artists'] 		= $this->artist->get();
			$this->data['albums'] 		= $this->album->get(array('albums.type'=>'bhajan'));
			$this->data['cities'] 		= $this->city->get();
			$this->data['content']=$this->load->view('track/form',$this->data,true);
			$this->load->view('layout/index',$this->data);
		}else{
			$this->data=array(
				'name'							=> $this->input->post('name', TRUE),
				'artist_id'					=> $this->input->post('artist_id', TRUE),
				'city_id'						=> $this->input->post('city_id', TRUE),
				'language'					=> $this->input->post('language', TRUE),
				'is_in_album'				=> $this->input->post('is_in_album', TRUE)?$this->input->post('is_in_album', TRUE):0,
				'name'							=> $this->input->post('name', TRUE),
				'other_artist_name'	=> $this->input->post('other_artist_name', TRUE)
			);
			
			if($this->input->post('is_in_album', TRUE)){
				$this->data['album_id'] = $this->input->post('album_id', TRUE);
			}

			if($this->track->edit($this->data,$condition)){
				$this->session->set_flashdata('success', 'Record updated');
			}else{
				$this->session->set_flashdata('error', 'Record not updated');
			}

			redirect(base_url('/tracks'));

		}
	}

	public function delete( $id = '' )
	{
		$id = $this->input->post('id', true);

		if ($id!='')
		{
			if ($this->track->remove($id))
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
			if ($this->track->removeall($this->input->post('chk', true)) )
				$this->session->set_flashdata('success', 'Selected '.count($this->input->post('chk', true)).' Records are deleted');
			else
				$this->session->set_flashdata('error', 'Selected '.count($this->input->post('chk', true)).' Records are not deleted');
		}

		redirect(base_url('/tracks'));
	}


	public function editLyrics($id)
	{
		$condition=array('tracks.id' => $id);

		if($this->input->method()=="get"){
			$this->data['data']= $this->track->get($condition);
			$this->data['content']=$this->load->view('track/lyricsform',$this->data,true);
			$this->load->view('layout/index',$this->data);
		}else{
			$this->data=array(
				'lyrics'				=>	$this->input->post('lyrics', TRUE),
			);

			if($this->track->edit($this->data,$condition)){
				$this->session->set_flashdata('success', 'Record updated');
			}else{
				$this->session->set_flashdata('error', 'Record not updated');
			}

			redirect(base_url('/tracks'));

		}
	}


	public function getData(){
		// POST data
		$postData = $this->input->post();
   
		// Get data
		$data = $this->track->filteredData($postData);
		echo json_encode($data);
	 }
}