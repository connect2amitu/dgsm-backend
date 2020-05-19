<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_Model extends My_Model
{
	/**
	 * Add Data
	 * @param  string $table TableName
	 * @param  array $data  New record array
	 * @return bool
	 */
	public function save($table='', $data='')
	{
		return parent::insert($table, $data);
	}

	/**
	 * Count All the record
	 * @param  string $table table name
	 * @return bool
	 */
	public function count($table)
	{
		return parent::count_all($table);
	}

	/**
	 * Get Records
	 * @param  string $table  table name
	 * @param  int/array $id     ID of record
	 * @param  int $start  start of record
	 * @param  int $offset offset of record
	 * @return bool
	 */
	public function get($table='', $id='', $start='', $offset='')
	{
		return parent::select($table, $id, $start, $offset);
	}

	/**
	 * Edit Record
	 * @param  string $table   table name
	 * @param  array $newdata New data array
	 * @param  int/array $id      ID of record
	 * @return bool
	 */
	public function edit($table='', $newdata='', $id='')
	{
		return parent::update($table, $newdata, $id);
	}

	/**
	 * Remove Record
	 * @param  string $table table name
	 * @param  int $id    ID of record
	 * @return void
	 */
	public function remove($table, $id)
	{
		return parent::delete($table, $id);
	}

	/**
	 * Search Record
	 * @param  string $table table name
	 * @param  array $like  like critearea
	 * @return bool
	 */
	public function search($table, $like)
	{
		return parent::filtered($table, $like);
	}

	/**
	 * Remove selected records
	 * @param  string $table table name
	 * @param  array $id    ids array of selected records
	 * @return bool
	 */
	public function removeall($table, $id)
	{
		return parent::delete_all($table, $id);
	}


}
