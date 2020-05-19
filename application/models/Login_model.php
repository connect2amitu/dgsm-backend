<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login_Model extends My_model
{
	/**
	 * Login Check
	 * @param  string $table table name
	 * @param  array $data  email and password array
	 * @return bool
	 */
	public function login($table, $data)
	{
		return parent::select($table, $data);
	}

	/**
	 * Count records
	 * @param  string $table table name
	 * @return int
	 */
	public function count($table='')
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


}
