<?php
defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class supir extends REST_Controller
{
    function __construct($config = 'rest')
    {
        parent::__construct($config);
        $this->load->database();
        $this->load->model('m_android');
    }

    public function index_get()
    {
        $id = $this->get('id_pengemudi');
        $cid=['id_pengemudi' => $id];
        if ($id) {
            $supir  = $this->m_android->get_supir($cid);
            $data   = [
                'status'    => "true",
                'pesan'     => "Data Berhasil Ditampilkan",
                'data'      => $supir
            ];
        }
        $this->response($data, 200);
    }

    public function index_put()
    {
        $id     = $this->put('id_pengemudi');
        $idpengguna = $this->put('id_pengguna');
        $cid=['id_pengemudi' => $id];
        //$supir  = $this->m_android->get_supir($cid);
        //foreach ($supir as $s) {
          //$idpengguna = $s['id_pengguna'];
        //}
        // $image      = $_FILES['foto']['name'];
        // if ($image) {
        //     $config['allowed_types']    = 'gif|jpg|png|jpeg';
        //     $config['max_size']         = '2048';
        //     $config['upload_path']      = './assets/img/pengemudi/';
        //     $this->load->library('upload', $config);
        //     if ($this->upload->do_upload('foto')) {
        //         $new_image = $this->upload->data('file_name');
        $data1  = [
            'nama'              => $this->put('nama'),
            'umur'              => $this->put('umur'),
            'alamat_pengguna'   => $this->put('alamat_pengguna'),
        ];
        $data2 = [
            'no_hp_penggemudi'   => $this->put('no_hp_penggemudi'),
            'tanggal_lahir'      => $this->put('tgllahir'),
            //'foto_penggemudi'   => $new_image
        ];
        $data3 = [
          'id_pengemudi'      => $id,
          'id_pengguna'       => $idpengguna,
          'nama'              => $this->put('nama'),
          'umur'              => $this->put('umur'),
          'alamat_pengguna'   => $this->put('alamat_pengguna'),
          'no_hp_penggemudi'  => $this->put('no_hp_penggemudi'),
          'tanggal_lahir'     => $this->put('tgllahir'),
        ];
        $data4 = [
            'status'    => "true",
            'pesan'     => 'Data Berhasil Diubah',
            'data'      => $data3
        ];
        $where = ['id_pengguna' => $idpengguna];
        $pengguna   = $this->m_android->update_pengguna($where, $data1);
        $pengemudi  = $this->m_android->update_pengemudi($cid, $data2);
        $this->response($data4,200);
        // } else {
        //     $error      = $this->upload->display_errors();
        //     $response   = [
        //         'status'    => false,
        //         'pesan'     => $error
        //     ];
        //     $this->response($response, 502);
        // }
        //}
    }
}
