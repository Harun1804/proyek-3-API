<?php
defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class user extends REST_Controller
{
    function __construct($config = 'rest')
    {
        parent::__construct($config);
        $this->load->database();
        $this->load->model('m_android');
    }

    function index_post()
    {
        $username = $this->input->post('username', TRUE);
        $password = $this->input->post('password', TRUE);

        $user = ['username' => $username];
        $hasil = $this->m_android->cek_user($user);

        if ($hasil) {
            if (password_verify($password, $hasil['password'])) {
                $data = [
                    'id_pengguna'   => $hasil['id_pengguna'],
                    'username'      => $hasil['username'],
                    'nama'          => $hasil['nama'],
                    'hak_akses'     => $hasil['hak_akses']
                ];
                if ($hasil['hak_akses'] == 3) {
                    $response = [
                        'sukses'    => "true",
                        'pesan'     => "Selamat Datang Supir",
                        'data'      => $data
                    ];
                    $this->response($response, 200);
                } else {
                    $response = [
                        'sukses'    => "false",
                        'pesan'     => "Anda Tidak Memiliki Akses Kesini",
                        'data'      => $data
                    ];
                    $this->response($response, 200);
                }
            } else {
                $response = [
                    'sukses'    => "false",
                    'pesan'     => "Cek Kembali Username Dan Password Anda",
                    'data'      => $data
                ];
                $this->response($response, 200);
            }
        } else {
            $response = [
                'sukses'    => "false",
                'pesan'     => "Data Tidak Ditemukan"
            ];
            $this->response($response, 200);
        }
    }
}
