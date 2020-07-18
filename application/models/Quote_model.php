<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Quote_Model extends My_Model
{
	public function __construct()
	{
		$this->table = "quotes";
		$this->title_table = "quotes_topic";
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
	 * Add Data
	 * @param  string $table TableName
	 * @param  array $data  New record array
	 * @return bool
	 */
	public function save_title($data='')
	{
		return parent::insert($this->title_table, $data);
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
		return parent::select($this->table, $id, $start, $offset);
	}

	/**
	 * Get Records
	 * @param  string $table  table name
	 * @param  int/array $id     ID of record
	 * @param  int $start  start of record
	 * @param  int $offset offset of record
	 * @return bool
	 */
	public function get_title($id='', $start='', $offset='')
	{
		return parent::select($this->title_table, $id, $start, $offset);
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
	 * Edit Record
	 * @param  string $table   table name
	 * @param  array $newdata New data array
	 * @param  int/array $id      ID of record
	 * @return bool
	 */
	public function edit_title($newdata='', $id='')
	{
		return parent::update($this->title_table, $newdata, $id);
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
	 * Remove Record
	 * @param  string $table table name
	 * @param  int $id    ID of record
	 * @return void
	 */
	public function remove_title($id)
	{
		return parent::delete($this->title_table, $id);
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
	 * Remove selected records
	 * @param  string $table table name
	 * @param  array $id    ids array of selected records
	 * @return bool
	 */
	public function removeall_title($id)
	{
		return parent::delete_all($this->title_table, $id);
	}

	/**
	 * get filtered records
	 * @param  object $postData data table state
	 * @return object
	 */
	function filteredData($postData=null){
		$fields = array('quote','id');
		return parent::dataTableData($this->table, $postData,$fields);
	}


	function getQuotesData($postData){
		$fields = array('quote','id');
		$response = array();
		## Read value
		$draw = $postData['draw'];
		$start = $postData['start'];
		$rowperpage = $postData['rowperpage'];
		$columnIndex = $postData['columnIndex'];
		$columnName = $postData['columnName'];
		$columnSortOrder = $postData['columnSortOrder'];
		$searchValue = $postData['searchValue'];
	 
		$searchQuery = "";
		if(!isset($postData['where'])){
			## Search 
			if($searchValue != ''){
				foreach ($fields as $field) {
					if($searchQuery == ""){
						$searchQuery = $field . " like '%".$searchValue."%'";
					}else{
						$searchQuery.= " or ".$field." like '%".$searchValue."%'";
					}
				}
			}
		}else{
			$searchQuery = $postData['where'];
		}
 
		## Total number of records without filtering
		$this->db->select('count(*) as allcount');
		$this->db->join('artists', 'artists.id = quotes.artist_id','left');
		if($searchQuery != '')
		$this->db->where($searchQuery);
		$records = $this->db->get($this->table)->result();
		$totalRecords = $records[0]->allcount;
   
		## Total number of record with filtering
		$this->db->select('count(*) as allcount');
		$this->db->join('artists', 'artists.id = quotes.artist_id','left');

		if($searchQuery != '')
		   $this->db->where($searchQuery);
		$records = $this->db->get($this->table)->result();
		$totalRecordwithFilter = $records[0]->allcount;
   
		## Fetch records
		$this->db->select('quotes.*,artists.id as artist_id,artists.name as artist_name,artists.avatar as artist_avatar');
		$this->db->join('artists', 'artists.id = quotes.artist_id','left');

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

	function getQuotesTitleData($postData){
		$fields = array('title','id');
		$response = array();
		## Read value
		$draw = $postData['draw'];
		$start = $postData['start'];
		$rowperpage = $postData['rowperpage'];
		$columnIndex = $postData['columnIndex'];
		$columnName = $postData['columnName'];
		$columnSortOrder = $postData['columnSortOrder'];
		$searchValue = $postData['searchValue'];
	 
		$searchQuery = "";
		if(!isset($postData['where'])){
			## Search 
			if($searchValue != ''){
				foreach ($fields as $field) {
					if($searchQuery == ""){
						$searchQuery = $field . " like '%".$searchValue."%'";
					}else{
						$searchQuery.= " or ".$field." like '%".$searchValue."%'";
					}
				}
			}
		}else{
			$searchQuery = $postData['where'];
		}
 
		## Total number of records without filtering
		$this->db->select('count(*) as allcount');
		if($searchQuery != '')
		$this->db->where($searchQuery);
		$records = $this->db->get($this->title_table)->result();
		$totalRecords = $records[0]->allcount;
   
		## Total number of record with filtering
		$this->db->select('count(*) as allcount');

		if($searchQuery != '')
		   $this->db->where($searchQuery);
		$records = $this->db->get($this->title_table)->result();
		$totalRecordwithFilter = $records[0]->allcount;
   
		## Fetch records
		$this->db->select('*');
		if($searchQuery != '')
		   $this->db->where($searchQuery);
		$this->db->order_by($columnName, $columnSortOrder);
		$this->db->limit($rowperpage, $start);
		$records = $this->db->get($this->title_table)->result();
   
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