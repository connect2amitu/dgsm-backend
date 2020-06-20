<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Track_Model extends My_Model
{
	public function __construct()
	{
		$this->table = "tracks";
	}

	/**
	 * Add Data
	 * @param  string $table TableName
	 * @param  array $data  New record array
	 * @return bool
	 */
	public function save($data='')
	{
		return parent::insert($this->table, $data);
	}

	/**
	 * Add Multiple Data
	 * @param  string $table TableName
	 * @param  array $data  New record array
	 * @return bool
	 */
	public function save_many($data='')
	{
		return parent::insert($this->table, $data,TRUE);
	}

	/**
	 * Count All the record
	 * @param  string $table table name
	 * @return bool
	 */
	public function count()
	{
		return parent::count_all($this->table);
	}

	/**
	 * Get Records
	 * @param  string $table  table name
	 * @param  int/array $id     ID of record
	 * @param  int $start  start of record
	 * @param  int $offset offset of record
	 * @return bool
	 */
	public function get($id='', $start='', $offset='')
	{
		$this->db->select('tracks.*,albums.*,tracks.id as id,cities.name as city_name,tracks.name as name,albums.name as album_name,albums.type as album_type,albums.slug as album_slug,artists.name as artist_name,artists.avatar as artist_avatar');
		$this->db->from('tracks');
		$this->db->join('artists', 'tracks.artist_id = artists.id','left');
		$this->db->join('albums', 'tracks.album_id = albums.id','left');
		$this->db->join('cities', 'tracks.city_id = cities.id','left');
		if ($start!='' or $offset!='')
		{
			$this->db->limit($start, $offset);
		}
		if ($id!='')
		{
			$this->db->where($id);
		}
		return $this->db->get()->result_array();
	}

	/**
	 * Edit Record
	 * @param  string $table   table name
	 * @param  array $newdata New data array
	 * @param  int/array $id      ID of record
	 * @return bool
	 */
	public function edit($newdata='', $id='')
	{
		return parent::update($this->table, $newdata, $id);
	}

	/**
	 * Remove Record
	 * @param  string $table table name
	 * @param  int $id    ID of record
	 * @return void
	 */
	public function remove($id)
	{
		return parent::delete($this->table, $id);
	}

	/**
	 * Search Record
	 * @param  string $table table name
	 * @param  array $like  like critearea
	 * @return bool
	 */
	public function search($like)
	{
		return parent::filtered($this->table, $like);
	}

	/**
	 * Remove selected records
	 * @param  string $table table name
	 * @param  array $id    ids array of selected records
	 * @return bool
	 */
	public function removeall($id)
	{
		return parent::delete_all($this->table, $id);
	}


	/**
	 * get filtered records
	 * @param  object $postData data table state
	 * @return object
	 */
	function filteredData($postData=null, $type="bhajan"){
		$fields = array('cities.name','albums.name','artists.name','tracks.name','tracks.id','tracks.url','tracks.size','tracks.is_in_album','tracks.other_artist_name');

		
		$response = array();
		## Read value
		$draw = $postData['draw'];
		$start = $postData['start'];
		$rowperpage = $postData['length']; // Rows display per page
		$columnIndex = $postData['order'][0]['column']; // Column index
		$columnName = $postData['columns'][$columnIndex]['data']; // Column name
		$columnSortOrder = $postData['order'][0]['dir']; // asc or desc
		$searchValue = $postData['search']['value']; // Search value
   
		## Search 
		$searchQuery = "";
		if($searchValue != ''){
			foreach ($fields as $field) {
				if($searchQuery == ""){
					$searchQuery = $field . " like '%".$searchValue."%'";
				}else{
					$searchQuery.= " or ".$field." like '%".$searchValue."%'";
				}
			}
		}
 
		## Total number of records without filtering
		// $this->db->select('albums.*,artists.name as artist_name,artists.avatar as artist_avatar,artists.id as artist_id');
		$this->db->select('count(*) as allcount');
		$this->db->join('artists', 'tracks.artist_id = artists.id','left');
		$this->db->join('albums', 'tracks.album_id = albums.id','left');
		$this->db->join('cities', 'tracks.city_id = cities.id','left');
		$this->db->where(array('tracks.type'=>$type));
		$records = $this->db->get($this->table)->result();
		$totalRecords = $records[0]->allcount;


		$this->db->select('count(*) as allcount');
		$this->db->join('artists', 'tracks.artist_id = artists.id','left');
		$this->db->join('albums', 'tracks.album_id = albums.id','left');
		$this->db->join('cities', 'tracks.city_id = cities.id','left');
		$this->db->where(array('tracks.type'=>$type));
		if($searchQuery != '')
		   $this->db->where($searchQuery);
		$records = $this->db->get($this->table)->result();
		$totalRecordwithFilter = $records[0]->allcount;

   

		// $this->db->select('albums.*,artists.name as artist_name,artists.avatar as artist_avatar,artists.id as artist_id');
		// // $this->db->from($this->table);
		// $this->db->join('artists', 'albums.artist_id = artists.id');
		// if($searchQuery != '')
		//    $this->db->where($searchQuery);
		// $this->db->order_by($columnName, $columnSortOrder);
		// $this->db->limit($rowperpage, $start);
		// $records = $this->db->get($this->table)->result();


		$this->db->select('tracks.*,cities.name as city_name,albums.name as album_name,albums.slug as album_slug,albums.cover as album_cover,artists.name as artist_name,artists.avatar as artist_avatar,artists.id as artist_id');
		$this->db->join('artists', 'tracks.artist_id = artists.id','left');
		$this->db->join('albums', 'tracks.album_id = albums.id','left');
		$this->db->join('cities', 'tracks.city_id = cities.id','left');
		$this->db->where(array('tracks.type'=>$type));
		if($searchQuery != '')
		   $this->db->where($searchQuery);
		$this->db->order_by($columnName, $columnSortOrder);
		$this->db->limit($rowperpage, $start);
		$records = $this->db->get($this->table)->result();

		## Response
		$response = array(
		   "draw" => intval($draw),
		   "iTotalRecords" => $totalRecords,
		   "iTotalDisplayRecords" => $totalRecordwithFilter,
		   "aaData" => $records
		);
		return $response;
	}

	function getBrowseTrackData($query){
		## Total number of records without filtering
		// $this->db->select('albums.*,artists.name as artist_name,artists.avatar as artist_avatar,artists.id as artist_id');
		$this->db->select('count(*) as allcount');
		$this->db->join('artists', 'tracks.artist_id = artists.id','left');
		$this->db->join('albums', 'tracks.album_id = albums.id','left');
		$this->db->join('cities', 'tracks.city_id = cities.id','left');
		$this->db->where(array('tracks.type'=>$query['content']));
		$this->db->where($query['where']);
		$records = $this->db->get($this->table)->result();
		$totalRecords = $records[0]->allcount;


		$this->db->select('count(*) as allcount');
		$this->db->join('artists', 'tracks.artist_id = artists.id','left');
		$this->db->join('albums', 'tracks.album_id = albums.id','left');
		$this->db->join('cities', 'tracks.city_id = cities.id','left');
		$this->db->where(array('tracks.type'=>$query['content']));
		$this->db->where($query['where']);

		// $this->db->where($searchQuery);
		$records = $this->db->get($this->table)->result();
		$totalRecordwithFilter = $records[0]->allcount;

		// $this->db->select('tracks.*,cities.name as city_name,albums.name as album_name,albums.slug as album_slug,albums.cover as album_cover,artists.name as artist_name,artists.avatar as artist_avatar,artists.id as artist_id');
		// $this->db->join('artists', 'tracks.artist_id = artists.id','left');
		// $this->db->join('albums', 'tracks.album_id = albums.id','left');
		// $this->db->join('cities', 'tracks.city_id = cities.id','left');
		// $this->db->where(array('tracks.type'=>$query['content']));
		// $this->db->where($query['where']);



		$this->db->select('tracks.*,albums.*,tracks.id as id,cities.name as city_name,tracks.name as name,albums.name as album_name,albums.slug as slug,albums.cover as album_cover,artists.name as artist_name,artists.avatar as cover');
		$this->db->join('artists', 'tracks.artist_id = artists.id','left');
		$this->db->join('albums', 'tracks.album_id = albums.id','left');
		$this->db->join('cities', 'tracks.city_id = cities.id','left');
		$this->db->where(array('tracks.type'=>$query['content']));
		$this->db->where($query['where']);
		

		// if($searchQuery != '')
		//    $this->db->where($searchQuery);
		$this->db->order_by('tracks.created', $query['order']);
		$this->db->limit($query['size'], $query['page']);
		$records = $this->db->get($this->table)->result_array();

		## Response
		$response = array(
		   "iTotalRecords" => $totalRecords,
		   "iTotalDisplayRecords" => $totalRecordwithFilter,
		   "aaData" => $records
		);
		return $response;
	}

}