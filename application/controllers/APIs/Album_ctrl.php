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
		$this->load->model('track_model','track');
		$this->load->model('artist_model','artist');

	}


	
	public function index()
	{
		$page   = $this->input->get('page', TRUE)?$this->input->get('page', TRUE):0;
		$size   = $this->input->get('size', TRUE)?$this->input->get('size', TRUE):10;
		$order  = $this->input->get('order', TRUE)?$this->input->get('order', TRUE):'ASC';
		$type  = $this->input->get('type', TRUE)?$this->input->get('type', TRUE):'all';
		$q  = $this->input->get('q', TRUE)?$this->input->get('q', TRUE):'';
		
		$query=array(
			'start'=>$page,
			'rowperpage'=>$size,
			'order'=>"albums.artist_id ASC, albums.name ASC",
			// 'q'=>$q,
			'where'=>array()
			
		);
		if($type!=="all"){
			$query['where'] = array('albums.type'=>$type);
		}
		
		if($q){
			$fields = array('albums.slug', 'albums.name', 'albums.tags', 'artists.name');
			## Search 
			$searchQuery = "";
			$where = $q;
			foreach ($fields as $field) {
				if($searchQuery == ""){
					$searchQuery = $field . " like '%".$where."%'";
				}else{
					$searchQuery.= " or ".$field." like '%".$where."%'";
				}
			}
			$query['where']=$searchQuery;
		}
		$data 		= $this->albums->getAlbums($query);

		$resp=array(
			'message'=>"Success",
			'data'=>$data['data'],
			'totalPages'=>ceil($data['totalRecords']/$size),
			'status'=>200,
			'total'=>$data['totalRecords'],
		);

		$this->response($resp);
	}


	public function getBySlug($slug)
	{
		$query=array(
			'albums.slug'=>$slug
		);
		$data 		= $this->albums->get($query);
		$tracks 		= $this->track->get($query);
		if($data){
			$data=$data[0];
			$data['tracks']=$tracks;
		}else{
			$data=null;
		}
		$resp=array(
			'message'=>"Success",
			'data'=>$data,
			'status'=>200
		);
		$this->response($resp);
	}

	public function getArtistAlbums()
	{

		$page   = $this->input->get('page', TRUE)?$this->input->get('page', TRUE):0;
		$size   = $this->input->get('size', TRUE)?$this->input->get('size', TRUE):10;
		$order  = $this->input->get('order', TRUE)?$this->input->get('order', TRUE):'ASC';
		$q  = $this->input->get('q', TRUE)?$this->input->get('q', TRUE):'';
		$type  = $this->input->get('type', TRUE)?$this->input->get('type', TRUE):'';
		$artists 		= $this->artist->get(array('artists.slug'=>$q));

		if(count($artists)){
			$artists=$artists[0];
			$query=array(
				'start'=>$page,
				'rowperpage'=>$size,
				'order'=>"albums.artist_id ASC, albums.name ASC",
				'where'=>array('albums.type'=>$type),
				'like'=>array('tags',$artists['name'] , 'both')
			);
			// $query=array(
			// 	'start'=>$page,
			// 	'rowperpage'=>$size,
			// 	'order'=>array('columnName'=>'name', 'columnSortOrder'=>$order),
			// 	'where'=>array('artist_id'=>$artists['id'],'albums.type'=>$type),
			// );
			$data 		= $this->albums->getAlbums($query);
			$resp=array(
				'message'=>"Success",
				'data'=>$data['data'],
				'totalPages'=>ceil($data['totalRecords']/$size),
				'status'=>200,
				'total'=>$data['totalRecords'],
			);
		}else{
				$resp=array(
					'message'=>"Success",
					'data'=>[],
					'totalPages'=>0,
					'status'=>200,
					'total'=>0,
				);
		}

		$this->response($resp);
	}
	

}