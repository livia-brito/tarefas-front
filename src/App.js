import { useEffect, useState } from "react";
import FormTarefa from "./componentes/FormTarefa";
import ListaDeTarefas from "./componentes/ListaDeTarefas";
import axios from "axios";

const URL_BACK_END = "http://localhost:5500/tarefas"

function App() {
  const [tarefas, setTarefas] = useState([]);

  const carregarTarefas = () => {
    axios.get(URL_BACK_END).then(({data}) => {
      setTarefas(data);
    });
  };

  useEffect(() => {
    carregarTarefas();
  }, []);

  const adicionarTarefa = (form) => {
    return axios.post(URL_BACK_END, form).then(() => {
      carregarTarefas();
    });
  };

  const excluirTarefa = (tarefa) => {
    return axios.delete(URL_BACK_END + '/' + tarefa._id).then(() => {
      carregarTarefas();
    });
  };

  return (
    <>
      <FormTarefa onAdicionar={adicionarTarefa}/>
      <ListaDeTarefas tarefas={tarefas} onExcluir={excluirTarefa}/>
    </>
  );
}

export default App;
