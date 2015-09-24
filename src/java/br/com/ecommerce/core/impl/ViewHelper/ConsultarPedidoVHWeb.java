/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ecommerce.core.impl.ViewHelper;

import br.com.ecommerce.application.Resultado;
import br.com.ecommerce.core.IViewHelper;
import br.com.ecommerce.core.impl.IStrategy.ConsultarPedido;
import br.com.ecommerce.domain.EntidadeDominio;
import br.com.ecommerce.domain.Pedido;
import static br.com.ecommerce.domain.Pedido.PRESTADOR;
import br.com.ecommerce.domain.PrestadorServico;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Elvin
 */
public class ConsultarPedidoVHWeb implements IViewHelper{
   
    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
       return null;
    }

    @Override
    public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Pedido pedido = new Pedido();
       
        pedido.setId(Integer.parseInt(request.getParameter("id_pedido")));
        pedido.setConsulta(PRESTADOR );
        ConsultarPedido consultar = new ConsultarPedido();
        resultado = consultar.processar(pedido);
        pedido = (Pedido)resultado.getEntidade();
      
        if(resultado.getMensagens()!=null){
            request.setAttribute("pedido", pedido);
            if(request.getParameter("local").equals("candidaturas"))
              request.getRequestDispatcher("PrestadorConsultarPedido.jsp?local=candidaturas").forward(request, response);
            else
               request.getRequestDispatcher("PrestadorConsultarPedido.jsp").forward(request, response); 
           
        }else{
            request.setAttribute("MsgAtualiza", resultado.getMensagens());   //retorna lista de mensagens
             request.getRequestDispatcher("PrestadorDashboard.jsp").forward(request, response);
        }
    }
    
}
