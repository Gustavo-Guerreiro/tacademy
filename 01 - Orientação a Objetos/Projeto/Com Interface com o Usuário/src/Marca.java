import java.time.LocalDate;
import java.util.ArrayList;

/** Classe que representa um produto a ser registrado em uma loja. 
 * A sua função é mojaritariamente semântica para representar 
 */
public class Marca extends Registro{
    private ArrayList<Produto> produtos = new ArrayList<>();

    public Marca(String nome){
        setNome(nome);
        setDataCadastro(LocalDate.now());
    }

    // irá alinhar os produtos salvos na classe principal com os da marca
    public void atualizarProdutos(Principal p){
        this.produtos = new ArrayList<>();
        for(Produto prod : p.getProdutos().values()) {
            if (prod.getMarca().getNome().equals(this.getNome())) {
                produtos.add(prod);
            }
        }
    }

    public void addProduto(Produto p){
        this.produtos.add(p);
    }

    public ArrayList<Produto> getProdutos() {
        return this.produtos;
    }


}