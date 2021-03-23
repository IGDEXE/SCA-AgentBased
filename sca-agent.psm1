# Funcao para usar o SCA Agent based
function New-ScaScan {
    param (
        $url
    )
    # Faz o download do agente
    iex ((New-Object System.Net.WebClient).DownloadString("https://download.srcclr.com/ci.ps1"))
    # Faz a verificacao
    srcclr scan --url "$url"
}

# Configuracoes
# Para testes, vou deixar uma com um projeto aberto contendo falhas
$url = "https://github.com/srcclr/example-ruby"

# Para conseguir utilizar, precisa antes ter configurado o token como variavel de ambiente
$Env:SRCCLR_API_TOKEN = "Seu Token disponivel no site da Veracode"

# Faz o Scan com base na url do repositorio
New-ScaScan $url