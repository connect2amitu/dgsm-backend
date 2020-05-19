<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Album_Model extends My_Model
{
	public function __construct()
	{
		$this->table = "albums";
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
	 * Count All the record
	 * @param  string $table table name
	 * @return bool
	 */
	public function count()
	{
		return parent::count_all($this->table);
	}

	/**
	 * Count All the record
	 * @param  string $table table name
	 * @return bool
	 */
	public function filterCount($searchValue="")
	{
		$fields = array('albums.slug', 'albums.name', 'albums.tags', 'artists.name');

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

		$this->db->select('count(*) as allcount');
		$this->db->join('artists', 'albums.artist_id = artists.id','left');
		if($searchQuery != '')
		   $this->db->where($searchQuery);
		$records = $this->db->get($this->table)->result();
		$totalRecordwithFilter = $records[0]->allcount;
		return $totalRecordwithFilter;
	}

	/**
	 * Get Records
	 * @param  string $table  table name
	 * @param  int/array $id     ID of record
	 * @param  int $start  start of record
	 * @param  int $offset offset of record
	 * @return bool
	 */
	public function get($id='', $offset='', $start='')
	{
		$this->db->select('albums.*,artists.name as artist_name,artists.avatar as artist_avatar,artists.id as artist_id');
		$this->db->from($this->table);
		$this->db->join('artists', 'albums.artist_id = artists.id');
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
	 * Get Records
	 * @param  string $table  table name
	 * @param  int/array $id     ID of record
	 * @param  int $start  start of record
	 * @param  int $offset offset of record
	 * @return bool
	 */
	public function getAlbums($query)
	{
		$this->db->select('albums.*,artists.name as artist_name,artists.avatar as artist_avatar,artists.id as artist_id');
		$this->db->from($this->table);
		$this->db->join('artists', 'albums.artist_id = artists.id','left');
		if ($query['offset']!='' or $query['size']!='')
			$this->db->limit($query['size'],$query['offset']);
		if (isset($query['q'])){
			// foreach ($query['q'] as $value) {
				// $this->db->or_like('albums.slug',$query['q']); 
				// $this->db->or_like('albums.name',$query['q']);
				// $this->db->or_like('albums.tags',$query['q']);
				// $this->db->or_like('artists.name',$query['q']);				
			// }
			foreach ($query['q'] as $value) {
				$this->db->or_like('albums.slug',$value); 
				$this->db->or_like('albums.name',$value);
				$this->db->or_like('albums.tags',$value);
				$this->db->or_like('artists.name',$value);
			}
		}
		$this->db->order_by('id', $query['order']);
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
	function filteredData($postData=null){
		$fields = array('artists.id','artists.name','tags','albums.name','albums.id');


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
 
		$this->db->select('albums.*,artists.name as artist_name,artists.avatar as artist_avatar,artists.id as artist_id');
		$this->db->select('count(*) as allcount');
		$this->db->join('artists', 'albums.artist_id = artists.id','left');
		$records = $this->db->get($this->table)->result();
		$totalRecords = $records[0]->allcount;
   
		$this->db->select('count(*) as allcount');
		$this->db->join('artists', 'albums.artist_id = artists.id','left');
		if($searchQuery != '')
		   $this->db->where($searchQuery);
		$records = $this->db->get($this->table)->result();
		$totalRecordwithFilter = $records[0]->allcount;
   
	
		$this->db->select('albums.*,artists.name as artist_name,artists.avatar as artist_avatar,artists.id as artist_id');
		$this->db->join('artists', 'albums.artist_id = artists.id','left');
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


}
