<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class City_Model extends My_Model
{
	public function __construct()
	{
		$this->table = "cities";
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
		$fields = array('name','id');
		return parent::dataTableData($this->table, $postData,$fields);
	}

}