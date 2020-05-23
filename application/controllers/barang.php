<?php
defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class barang extends REST_Controller
{
    function __construct($config = 'rest')
    {
        parent::__construct($config);
        $this->load->database();
        $this->load->model('m_android');
    }

    function index_get()
    {
        $id = $this->get('id_barang_keluar');
        $cid = ['id_barang_keluar' => $id];
        if ($id) {
            $barang = $this->m_android->get_barang($cid);
            $data   = [
                'status'    => "true",
                'pesan'     => "Data Barang yang dibawa pada truck",
                'data'      => $barang
            ];
        }
        $this->response($data, 200);
    }

    function index_put()
    {
      $id   = $this->put('id_barang_keluar');
      $cid  = ['id_barang_keluar' => $id];
      $idp  = $this->put('id_pengemudi');
      $idk  = $this->put('id_kendaraan');
      $token = $this->put('token');
      $pid = ['id_pengemudi' => $idp];
      $tkn = $this->m_android->get_token($pid);
      foreach($tkn as $tk){
        if($token == $tk['token']){
          date_default_timezone_set("Asia/Jakarta");
          $wselesai=date("Y-m-d H:i:s");

          $data = [
            'status_barang' => 2,
            'waktu_selesai' => $wselesai
          ];
          $datap = [
            'status_pengemudi' => 0
          ];
          $datak = [
            'status_kendaraan' => 0
          ];
          $data3 = [
            'id_barang_keluar' => $id,
            'id_pengemudi' => $idp,
            'id_kendaraan' => $idk,
            'status_barang' => 2,
            'waktu_selesai' => $wselesai,
            'status_pengemudi' => 0,
            'status_kendaraan' => 0
          ];
          $data4 = [
            'status'    => "true",
            'pesan'     => 'Data Berhasil Diubah',
            'data'      => $data3
          ];
          $kid = ['id_kendaraan' => $idk];
          $this->m_android->update_barang_keluar($cid,$data);
          $this->m_android->update_pengemudi($pid,$datap);
          $this->m_android->update_kendaraan($kid,$datak);
          $this->m_android->delete_token($pid);
          $this->response($data4,200);
        }else {
          $data5 = [
            'status'    => "false",
            'pesan'     => 'Token Tidak Sama',
          ];
          $this->response($data5,200);
        }
      }
    }
}
