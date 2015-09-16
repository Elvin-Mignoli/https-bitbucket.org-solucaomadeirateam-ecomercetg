/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ecommerce.core.impl.ViewHelper;

import br.com.ecommerce.application.Resultado;
import br.com.ecommerce.core.IViewHelper;
import br.com.ecommerce.domain.CaixaEntrada;
import br.com.ecommerce.domain.EntidadeDominio;
import br.com.ecommerce.domain.Mensagem;
import br.com.ecommerce.domain.PrestadorServico;
import br.com.ecommerce.domain.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Elvin
 */
public class ResponderMensagemVHWeb implements IViewHelper{

    @Override
    public EntidadeDominio getEntidade(HttpServletRequest request) {
        
        Usuario usuario = (PrestadorServico)request.getSession().getAttribute("user");
        Mensagem msg = new Mensagem();
        msg.setAssunto(request.getParameter("txtAssunto"));
        msg.setDescricao(request.getParameter("txtResposta"));
        msg.setRemetente(usuario.getEmail());
        msg.setDestinatario(request.getParameter("txtDestinatario"));
        msg.setId_caixa_remetente(Integer.parseInt(request.getParameter("txtRemetente_id")));
        usuario.getEntrada().setMensagem(msg);
        return usuario.getEntrada();
    }

    @Override
    public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        if(!resultado.getMensagens().isEmpty())
        {
           request.setAttribute("MsgAtualiza", resultado.getMensagens());   //retorna lista de mensagens 
      
        }else
        {
            //decidino se é Cliente ou Prestador
            if (request.getRequestURI().contains("Cliente"))
            {
                request.setAttribute("MsgAtualiza", "Mensagem enviada com sucesso!");
                request.getRequestDispatcher("ClienteDashboard.jsp").forward(request, response);
            }else
            {
                request.setAttribute("MsgAtualiza", "Mensagem enviada com sucesso!");
                request.getRequestDispatcher("PrestadorDashboard.jsp").forward(request, response);
            }            
        }
        
    }
    
}
