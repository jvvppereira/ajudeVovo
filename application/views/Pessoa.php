<?php
    // Importa o cabeçalho padrao a todas as telas
    $this->load->view('nucleo/header.php');
?>
<style type="text/css">
  .desabilitar_troca_abas {
    pointer-events: none;
  }

</style>
</head>
<body>
<div
   ng-app="appAngular"
   ng-controller="ctrlPessoa"
>
   <div class="container">
      <div class="row">
         <br/>
            <div class="col s12">
               <ul class="tabs">
                  <li class="tab col s3"><a class="active desabilitar_troca_abas" href="#tab_dados_pessoais"><i class="material-icons blue-text #1889ff">person</i></a></li>
                  <li class="tab col s3"><a href="#tab_endereco" class="desabilitar_troca_abas"><i class="material-icons blue-text #1889ff">home</i></a></li>
                  <li class="tab col s3 "><a href="#tab_contatos" class="desabilitar_troca_abas"><i class="material-icons blue-text #1889ff">local_phone</i> </a></li>
                  <li class="tab col s3"><a href="#tab_dados_acesso" class="desabilitar_troca_abas"><i class="material-icons blue-text #1889ff">https</i></a></li>
               </ul>
            </div>
               <!-- Perfil -->
               <input type="hidden" ng-model="objPessoa.is_ajudante" name="is_ajudante" ng-init="is_ajudante=<?php echo $ajudante;?>" />
               <input type="hidden" ng-model="objPessoa.is_contratante" name="is_contratante" ng-init="is_contratante=<?php echo $contratante;?>" />
               <!-- Perfil -->

               <div id="tab_dados_pessoais" class="col s12">
                  <?php
                    $this->load->view('formulariosCadastro/FrmDadosPessoais');?>
               </div>

               <div id="tab_endereco" class="col s12">
                  <?php
                    $this->load->view('formulariosCadastro/FrmEndereco');?>
               </div>

               <div id="tab_contatos" class="col s12">
                  <?php
                    $this->load->view('formulariosCadastro/FrmContatos');?>
               </div>

               <div id="tab_dados_acesso" class="col s12">
                  <?php
                    $this->load->view('formulariosCadastro/FrmDadosAcesso');?>
               </div>
            <!-- </form>
      </div>
   </div>
      <!-- Modal Structure -->
      <div id="modalCartaoCredito" class="modal modal-fixed-footer">
        <?php
          $this->load->view('CartaoCredito.php');
        ?>
      </div>
   </div>
</div>

    <?php
        // Importa o cabeçalho rodape padrao a todas as telas
        $this->load->view('nucleo/footer.php');
    ?>
   <!-- MY App -->
   <script type="text/javascript" src="../includes/js/PessoaCartaoCredito.service.js?<?php echo date('YmdHis');?>"></script>
   <script type="text/javascript" src="../includes/js/cartaoCredito.js?<?php echo date('YmdHis');?>"></script>
   <script type="text/javascript" src="../includes/js/pessoa.js?1"></script>
   <!-- <script type="text/javascript" src="../includes/dist/pessoa.min.js"></script> -->
</body>
</html>