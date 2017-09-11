<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ServicoDB extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_servicos() {
        return $this->db->get(
            'servico'
        );
    }

    public function get_categorias() {
        return $this->db->get(
            'categoria'
        );
    }

    public function inserir_servico($arrServico) {
        $this->db->insert(
            'servico',
            $arrServico
        );
    }

    public function alterar_servico($arrServicoAlterar, $id_servico) {
        $this->db->update(
            'servico',
            $arrServicoAlterar,
            array('id_servico' => $id_servico)
        );
    }

    public function excluir_servico($id_servico) {
        $this->db->delete(
            'servico',
            array('id_servico' => $id_servico)
        );
    }
}
?>