class ArticlesController < ApplicationController
 
  def new #action new
    @article = Article.new #instance variable. Na pagina de visualizacao, o formulario vai usar essa variavel para escrever os campos em seus atributos
  end

  def create
    #render plain: params[:article].inspect #somente para checar se o envio do formulario esta ok
    @article = Article.new(article_params) #nao consigo passar direto os parametros, primeiro preciso passar eles para uma white list. article_params eh um metodo criado abaixo que faz isso
    @article.save
    redirect_to articles_show(@article) #como essa acao create nao tem nenhuma tela especifica, estamos redirecionando para a action show. Essa action (ver nas rotas) depende de um id de artigo, por isso que passamos entre parenteses o (@article)
  end

  private #ver que nao eh um bloco, nao tem end no final. Apenas informa que o que esta a partir daqui so eh acessado internamente a esta classe

  def article_params
    params.require(:article).permit(:title, :description) #se eu nao uso esse permit, quando eu tento salvar na DB, o acesso eh negado. Estou colocando os 2 atributos na white list
  end

end