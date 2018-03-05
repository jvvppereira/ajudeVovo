<?php
    // Importa o cabeçalho padrao a todas as telas
    $this->load->view('nucleo/header.php');
?>
   
</head>


<body>  

    <?php
        // Importa o cabeçalho padrao a todas as telas
        $this->load->view('MenuPrestador.php');
    ?>

    <div ng-app="appAngular" ng-controller="controllerControlePrestador">
        <input type="hidden" ng-model="is_ajudante" name="is_ajudante" ng-init="is_ajudante=1" />  	
        <div class="container">
    		<div class="row">
                <!-- <div class="col-md-12 col-sm-10 col-md-offset-1"> -->
                    <div class="col-md-12 col-sm-6">
                                <!-- <a href="javascript:history.back()" class="btn">Voltar</a> -->
                            <div class="table-responsive">
                                <table class="table table-stripped">
                                    <thead>
                                        <tr>
                                            <th> 
                                                Serviço
                                            </th>
                                            <th> 
                                                Idoso
                                            </th>
                                            <th> 
                                                Data - Horário
                                            </th>
                                            <th> 
                                                Situação
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="lista in arrListaServico">
                                            <td>
                                                {{lista.descricao}}
                                            </td>
                                            <td>
                                                {{lista.nome}}
                                            </td>
                                            <td>
                                                {{lista.dia_solicitacao}} - {{lista.horario_inicio}}&nbsp;até&nbsp;{{lista.horario_fim}}
                                            </td>
                                            <td>
                                                {{lista.ds_estado_atual}}
                                            </td>
                                            <td>
                                                <div ng-show="{{lista.id_estado_operacao}} == 3">
                                                    <button 
                                                        title="Aceitar" 
                                                        ng-click="aceitar(lista.id_servico)"
                                                        class="btn btn-success"
                                                        style="font-size: 16px;">
                                                            <span class="glyphicon glyphicon-thumbs-up" >
                                                            </span>
                                                    </button>
                                                    <button 
                                                        title="Negar"
                                                        ng-click="negar(lista.id_servico)"
                                                        class="btn btn-danger"
                                                        style="font-size: 16px;">
                                                            <span class="glyphicon glyphicon-thumbs-down"  >
                                                            </span>
                                                    </button>
                                                </div>
                                                <div ng-show="{{lista.id_estado_operacao}} == 4">
                                                    <button 
                                                        title="Finalizar Serviço" 
                                                        ng-click="abrirTelaAvaliacao(lista.id_servico)"
                                                        class="btn btn-info"
                                                        style="font-size: 16px;">
                                                            <span class="glyphicon glyphicon-ok">
                                                            </span>
                                                    </button>
                                                </div>
                                            </td>        
                                        </tr>
                                    </tbody>
                                </table>
                             </div>
                    </div>
                <!-- </div> -->
            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="modalAvaliacao" tabindex="-1" role="dialog" aria-labelledby="modalAvaliacaoLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modalAvaliacaoLabel">Realizar Avaliação </h4>
              </div>
              <div class="modal-body" >

                <?php
                    $this->load->view('Avaliacao.php');
                ?>  
              </div>
            </div>
          </div>
        </div>
    </div>



    <script type="text/javascript"  src="../includes/jQuery/jquery.js"></script>    
    <?php
        // Importa o cabeçalho rodape padrao a todas as telas
        $this->load->view('nucleo/footer.php');
    ?>

    <script type="text/javascript" src="../includes/js/RealizarAvaliacao.service.js"></script>
    <script type="text/javascript" src="../includes/js/ConsultaControlePrestador.js"></script>
    <script type="text/javascript" src="../includes/js/Avaliacao.controller.js"></script>
</body>
</html>