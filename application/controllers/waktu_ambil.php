<?php
defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class waktu_ambil extends REST_Controller
{
  function __construct($config = 'rest')
  {
      parent::__construct($config);
      $this->load->database();
      $this->load->model('m_android');
  }

  function index_put()
  {
    $id   = $this->put('id_barang_keluar');
    $cid  = ['id_barang_keluar' => $id];
    date_default_timezone_set("Asia/Jakarta");
    $wambil = date("Y-m-d H:i:s");
    $data = [
      'waktu_ambil' => $wambil
    ];
    $data2 = [
      'id_barang_keluar' => $id,
      'waktu_ambil' => $wambil
    ];
    $result = [
      'status'    => "true",
      'pesan'     => 'Data Berhasil Diubah',
      'data'      => $data2
    ];
    $this->m_android->update_barang_keluar($cid,$data);
    $this->response($result,200);
  }
}
