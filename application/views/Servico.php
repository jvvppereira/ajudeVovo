<?php
    // Importa o cabeçalho padrao a todas as telas
    $this->load->view('nucleo/header.php');
?>

</head>
    <body>  
        <div
            ng-app="appAngular"
            ng-controller="controllerServico">
            
            <?php
                // Importa o cabeçalho padrao a todas as telas
                $this->load->view('MenuPrestador.php');
            ?>
            <input type="hidden" name="is_edicao" ng-model="id_servico" 
                ng-init="id_servico=<?php echo $id_servico?>">
            <div class="container">
                <div class="col s10 col-lg-offset-1">
                    <form class="form-group" name="form_servico">
                        <div class="row">
                            <div class="col s12">
                                <div class="input-field">
                                    <label for="descricao">Descrição:</label>
                                    <input type="text" ng-model="descricao" class="form-control" id="descricao" maxlength="22" required/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12">
                                
                                    <label for="categoria">Categoria:</label>
                                    <select 
                                        ng-options="listaCategoria.descricao for listaCategoria in arrListaCategoria"
                                        ng-model="categoriaSelected"
                                        name="categoria"
                                        id="categoria"
                                        class="form-control"
                                        material-select watch
                                        required 
                                    >
                                        <option value="" disabled selected>Selecione uma categoria...</option>
                                    </select>
                                
                            </div>
                        </div>                        

                        <div class="row">
                            <div class="col s6">
                                <p>
                                    <input 
                                        type="checkbox" 
                                        id="gratuito" 
                                        ng-model="gratuito"
                                        ng-click="valor = gratuito ? '' : valor"
                                        />
                                    <label for="gratuito">Voluntário</label>
                                </p>
                            </div>
                            <div class="col s6">
                                <div class="input-field">
                                    <label for="valor">Valor:</label>
                                    <input
                                        type="tel"
                                        ng-model="valor"
                                        ng-disabled="gratuito"
                                        class="form-control"
                                        id="valor"
                                        data-ng-blur="validaValorServico()"
                                    />
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col s12">
                                <div class="col s12">
                                    <div class="input-field">
                                        <label for="detalhe">Detalhes do Serviço:</label>
                                        <textarea style="resize: none;" class="materialize-textarea" ng-model="detalhe" name="detalhe" id="detalhe"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col s12">
                                <div class="form-group">
                                    <label for="diaAtendimento">Dia de Atendimento </label>
                                    <select 
                                        ng-options="listaDiaAtendimento.descricao for listaDiaAtendimento in arrListaDiaAtendimento"
                                        ng-model="diaAtendimentoSelected"
                                        name="diaAtendimento"
                                        id="diaAtendimento"
                                        class="form-control"
                                        material-select
                                    >
                                        <option value="" disabled selected>Selecione o dia da semana...</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div>

                        <div class="row">
                            <div class="col s12">
                                <div class="col s12">
                                    <div class="form-group">
                                        <div class="col s6 col m6">
                                            <label for="horario_inicio">Horário de Início </label>
                                            <input type="time" ng-model="horario_inicio" id="horario_inicio" name="horario_inicio" class="form-control"/>
                                        </div>

                                        <div class="col s6 col m6">
                                            <label for="horario_fim">Horário de Fim </label> 
                                            <input type="time" ng-model="horario_fim" id="horario_fim" name="horario_fim" class="form-control"/>
                                        </div>

                                        <div class="col m12 col s12 text-center">
                                            <div class="col m12">&nbsp;</div>
                                            <button
                                                type="button"
                                                data-ng-click="adicionarDiaAtendimento()"
                                                class="waves-effect waves-light btn light-blue darken-2 col s12"
                                            >Adicionar
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col s12">
                                <div class="form-group">
                                    <table class="table table-stripped">
                                        <thead>
                                            <tr>
                                                <th>
                                                    Dia da Semana
                                                </th>
                                                <th>
                                                    Horário Início
                                                </th>
                                                <th>
                                                    Horário Fim
                                                </th>
                                                <th>
                                                    <!-- Ação para excluir o dia de atendimento -->
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr ng-repeat="lista in arrListaAtendimento">
                                                <td>
                                                    {{lista.dia}}
                                                </td>
                                                <td>
                                                    {{lista.horario_inicio}}
                                                </td>
                                                <td>
                                                    {{lista.horario_fim}}
                                                </td>
                                                <td>
                                                    <i
                                                        ng-disabled="desabilitarBotoes"
                                                        class="material-icons red-text left"
                                                        ng-click="removerDiaAtendimento($index, lista.id_dia_disponivel)"/>delete
                                                    </i>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col s12">
                                <div>
                                    <a 
                                        class="waves-effect waves-light btn red darken-1 col s5 left" 
                                        href="../ListarServico/"
                                        ng-disabled="desabilitarBotoes"
                                    >
                                    <i class="material-icons left">block</i>Cancelar</a>
                                </div>
                                <button
                                    type="submit"
                                    data-ng-click="!id_servico ? salvarServico() : atualizarServico()"
                                    class="waves-effect waves-light btn light-blue darken-2 col s5 right"
                                    ng-disabled="desabilitarBotoes"
                                >
                                    <i class="material-icons right">check</i>Salvar
                                </button>
                            </div>
                        </div>
                    </form>
                    <br/>
                </div>
            </div>

            <div class="modal fade" id="modal_excluir" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="gridSystemModalLabel">Ajude o vovo!!</h4>
                        </div>
                        
                        <div class="modal-body">
                                Deseja excluir este registro?                            
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-success" ng-click="excluirServico()">Excluir</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script type="text/javascript" src="../includes/jQuery/jquery-3.2.1.js"></script>
        <?php
            // Importa o cabeçalho rodape padrao a todas as telas
            $this->load->view('nucleo/footer.php');
        ?> 
 
        <script type="text/javascript" src="../includes/js/servico.js"></script>
        <script type="text/javascript" src="../includes/js/MenuPrestador.controller.js"></script>
    </body>
</html>