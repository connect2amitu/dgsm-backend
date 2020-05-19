<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Playlist_Model extends My_Model
{
	public function __construct()
	{
		$this->table = "playlists";
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
		$this->db->select('*');
		// $this->db->select('playlists.*,artists.name as artist_name,artists.avatar as artist_avatar,artists.id as artist_id');
		$this->db->from('playlists');
		// $this->db->join('users', 'playlists.user_id = users.id','left');
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
	 * Remove Record
	 * @param  string $table table name
	 * @param  int $id    ID of record
	 * @return void
	 */
	public function removeTrackFromPlaylist($id)
	{
		if($this->db->delete('playlists_tracks', $id)){
			$affected_rows = $this->db->affected_rows();
			return $affected_rows;
		}else{
			return 0;
		}
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
	 * Add Data
	 * @param  string $table TableName
	 * @param  array $data  New record array
	 * @return bool
	 */
	public function addToPlaylist($data='')
	{
		return parent::insert('playlists_tracks', $data);
	}

	/**
	 * Get Records
	 * @param  string $table  table name
	 * @param  int/array $id     ID of record
	 * @param  int $start  start of record
	 * @param  int $offset offset of record
	 * @return bool
	 */
	public function getPlaylistDetail($id='', $start='', $offset='')
	{
		$this->db->select('tracks.*,albums.*,tracks.id as id,playlists_tracks.id as id,cities.name as city_name,tracks.name as name,albums.name as album_name,albums.slug as album_slug,artists.name as artist_name,artists.avatar as artist_avatar,playlists.name as playlist_name,playlists.created as playlist_created');
		// $this->db->select('playlists.*, playlists_tracks.*, tracks.*, albums.*, artists.*, cities.*, playlists.name as playlist_name,playlists.created as playlist_created, tracks.name as track_name, albums.name as album_name, cities.name as city_name');
		$this->db->from('playlists');
		$this->db->join('playlists_tracks', 'playlists.id = playlists_tracks.playlist_id','left');
		$this->db->join('tracks', 'tracks.id = playlists_tracks.track_id','left');
		$this->db->join('albums', 'tracks.album_id = albums.id','left');
		$this->db->join('cities', 'cities.id = tracks.city_id','left');
		$this->db->join('artists', 'artists.id = tracks.artist_id','left');
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

}
