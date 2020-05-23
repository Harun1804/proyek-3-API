<?php
defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class tujuan extends REST_Controller
{
    function __construct($config = 'rest')
    {
        parent::__construct($config);
        $this->load->database();
        $this->load->model('m_android');
    }

    function index_get()
    {
        $id = $this->get('id_pengemudi');
        $cid=['id_pengemudi' => $id,'status_barang'=>1];
        if ($id) {
            $barang = $this->m_android->get_tujuan($cid);
            $data   = [
                'status'    => "true",
                'pesan'     => "Tujuan",
                'data'      => $barang
            ];
        }
        $this->response($data, 200);
    }
  }
