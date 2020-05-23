<?php
defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Gantisupir extends REST_Controller
{
    function __construct($config = 'rest')
    {
        parent::__construct($config);
        $this->load->database();
        $this->load->model('m_android');
    }

    function index_put()
    {
        $pengemudi = $this->put('id_pengemudi');
        $idbk = $this->put('id_barang_keluar');
        $where = ['id_pengemudi' => $pengemudi];
        $data = [
            'status_pengemudi' => 2
        ];
        $this->m_android->update_pengemudi($where, $data);
        $where2 = [
            'id_barang_keluar' => $idbk
        ];
        if ($idbk) {
            $data2 = [
                'id_pengemudi' => "DRV002"
            ];
            $this->m_android->update_barang_keluar($where2, $data2);
            $this->waPenganti();
            $data3 = [
                'status_pengemudi' => 1
            ];
            $where3 = ['id_pengemudi'=>"DRV002"];
            $this->m_android->update_pengemudi($where3, $data3);
            $returndata = [
                'id_pengemudi' => $pengemudi,
                'id_barang_keluar' => $idbk
            ];
            $datarespon = [
                'status'    => "true",
                'pesan'     => "Supir Menolak Pekerjaan",
                'data'      => $returndata
            ];
            $this->response($datarespon, 200);
        }
    }

    function waPenganti()
    {
        $my_apikey = "1O2P3DX53N4JN48FWNNX";
        $destination = "+6287714778776";
        $message = 'Kepada Yang Terhormat
        Mr. Jajang
    
        Anda Mendapat Tugas Untuk Mengantar Barang Dengan Keterangan Sebagai Berikut :
        Tujuan : Bandung
        No Kendaraan : D1234AD
        Segera Menuju Kendaraan Anda Untuk Mengantar Tugas
                            Bandung, ' . date('d M Y') . '
                                    Mengetahui
    
    
                                   Manajer Gudang';
        $api_url = "https://panel.rapiwha.com/send_message.php";
        $api_url .= "?apikey=" . urlencode($my_apikey);
        $api_url .= "&number=" . urlencode($destination);
        $api_url .= "&text=" . urlencode($message);
        $options = stream_context_create(
            array(
                'http' =>
                array(
                    'method'  => 'POST',
                    'header'  => 'Content-type: application/json',
                )
            )
        );
        $response = file_get_contents($api_url, false, $options);
    }
}
