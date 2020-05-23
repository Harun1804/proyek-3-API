<?php
defined('BASEPATH') or exit('No direct script access allowed');

class m_android extends CI_Model
{
    function cek_user($data)
    {
        return $this->db->get_where('detail_pengguna', $data)->row_array();
    }

    function get_supir($id)
    {
        return $this->db->get_where('detail_pengemudi',$id)->result_array();
    }

    public function update_pengguna($id, $data)
    {
        $this->db->where($id);
        $this->db->update('pengguna', $data);
    }

    public function update_pengemudi($id, $data)
    {
        $this->db->where($id);
        $this->db->update('pengemudi', $data);
    }

    function get_tujuan($id)
    {
        return $this->db->get_where('detail_tujuan_android',$id)->result();
    }

    function get_barang($id)
    {
      $this->db->order_by('id_barang_keluar','desc');
        return $this->db->get_where('detail_barang_android',$id)->result_array();
    }

    function get_token($id)
    {
      return $this->db->get_where('token',$id)->result_array();
    }

    function delete_token($id)
    {
      $this->db->delete('token',$id);
    }

    function update_barang_keluar($id,$data)
    {
      $this->db->where($id);
      $this->db->update('barang_keluar',$data);
    }

    function update_kendaraan($id,$data)
    {
      $this->db->where($id);
      $this->db->update('kendaraan',$data);
    }
}
