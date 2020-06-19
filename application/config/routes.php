<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['default_controller'] = 'dashboard_ctrl';


$route['bhajan'] = 'bhajan_ctrl';
$route['albums'] = 'album_ctrl';
$route['albums/(:any)'] = 'album_ctrl/$1';
$route['albums/(:any)/(:any)'] = 'album_ctrl/$1/$2';

$route['artists'] = 'artist_ctrl';
$route['artists/(:any)'] = 'artist_ctrl/$1';
$route['artists/(:any)/(:any)'] = 'artist_ctrl/$1/$2';

$route['cities'] = 'city_ctrl';
$route['cities/(:any)'] = 'city_ctrl/$1';
$route['cities/(:any)/(:any)'] = 'city_ctrl/$1/$2';


$route['tracks'] = 'track_ctrl';
$route['tracks/(:any)'] = 'track_ctrl/$1';
$route['tracks/(:any)/(:any)'] = 'track_ctrl/$1/$2';

$route['vani'] = 'vani_ctrl';
$route['vani/(:any)'] = 'vani_ctrl/$1';
$route['vani/(:any)/(:any)'] = 'vani_ctrl/$1/$2';


$route['login'] = 'login_ctrl';
$route['login/(:any)'] = 'login_ctrl/$1';


$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;


$route['api/tracks'] = 'APIs/track_ctrl';

$route['api/browse'] = 'APIs/browse_ctrl';
$route['api/browse/(:any)'] = 'APIs/browse_ctrl/$1';

$route['api/users'] = 'APIs/user_ctrl';
$route['api/users/(:any)'] = 'APIs/user_ctrl/$1';
// $route['api/tracks/(:any)/(:any)'] = 'APIs/track_ctrl/index/$1/$2';

$route['api/albums'] = 'APIs/album_ctrl';
$route['api/albums/getArtistAlbums'] = 'APIs/album_ctrl/getArtistAlbums';
$route['api/albums/(:any)'] = 'APIs/album_ctrl/getBySlug/$1';


$route['api/playlists'] = 'APIs/playlist_ctrl';
$route['api/playlists/(:any)'] = 'APIs/playlist_ctrl/$1';
$route['api/playlists/(:any)/(:any)'] = 'APIs/playlist_ctrl/$1/$2';
// $route['api/albums/(:any)/(:any)'] = 'APIs/album_ctrl/index/$1/$2';