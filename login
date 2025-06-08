<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Delícias Japonesas - Acesso</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background-color: #fffaf0;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }
    .container {
      background-color: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      width: 320px;
    }
    h2 {
      text-align: center;
      color: #b30000;
    }
    input {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    button {
      background-color: #b30000;
      color: white;
      border: none;
      padding: 10px;
      width: 100%;
      border-radius: 5px;
      cursor: pointer;
    }
    button:hover {
      background-color: #800000;
    }
    .switch {
      text-align: center;
      margin-top: 15px;
    }
    .error {
      color: red;
      text-align: center;
      margin-top: 10px;
    }
  </style>
</head>
<body>
  <div class="container" id="formulario">
    <h2 id="titulo">Login - Delícias Japonesas</h2>
    <input type="text" id="usuario" placeholder="Usuário" />
    <input type="password" id="senha" placeholder="Senha" />
    <button onclick="entrarOuCadastrar()" id="botao">Entrar</button>
    <p class="error" id="mensagemErro"></p>
    <div class="switch">
      <a href="#" onclick="alternarModo()" id="alternar">Não tem conta? Cadastre-se</a>
    </div>
  </div>

  <script>
    let modoCadastro = false;

    function alternarModo() {
      modoCadastro = !modoCadastro;
      document.getElementById('titulo').textContent = modoCadastro ? 'Cadastro - Delícias Japonesas' : 'Login - Delícias Japonesas';
      document.getElementById('botao').textContent = modoCadastro ? 'Cadastrar' : 'Entrar';
      document.getElementById('alternar').textContent = modoCadastro ? 'Já tem conta? Faça login' : 'Não tem conta? Cadastre-se';
      document.getElementById('mensagemErro').textContent = '';
    }

    function entrarOuCadastrar() {
      const usuario = document.getElementById('usuario').value.trim();
      const senha = document.getElementById('senha').value;
      const mensagemErro = document.getElementById('mensagemErro');

      if (modoCadastro) {
        if (!usuario || !senha) {
          mensagemErro.style.color = 'red';
          mensagemErro.textContent = 'Preencha todos os campos para se cadastrar.';
          return;
        }
        // Verifica se usuário já existe
        if (localStorage.getItem(`usuario_${usuario}`)) {
          mensagemErro.style.color = 'red';
          mensagemErro.textContent = 'Usuário já existe. Escolha outro.';
          return;
        }
        localStorage.setItem(`usuario_${usuario}`, senha);
        mensagemErro.style.color = 'green';
        mensagemErro.textContent = 'Cadastro realizado com sucesso!';
        setTimeout(() => {
          alternarModo();
          mensagemErro.textContent = '';
          document.getElementById('usuario').value = '';
          document.getElementById('senha').value = '';
        }, 1500);
      } else {
        const senhaSalva = localStorage.getItem(`usuario_${usuario}`);
        if (senha === senhaSalva && senhaSalva !== null) {
          localStorage.setItem("usuario_logado", usuario);
          window.location.href = "index.html";
        } else {
          mensagemErro.style.color = 'red';
          mensagemErro.textContent = 'Usuário ou senha incorretos.';
        }
      }
    }
  </script>
</body>
</html>
