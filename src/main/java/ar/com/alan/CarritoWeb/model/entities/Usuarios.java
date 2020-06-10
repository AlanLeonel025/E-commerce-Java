package ar.com.alan.CarritoWeb.model.entities;

public class Usuarios {
    private int usuario_id;
    private String nom_usuario;
    private String apell_usuario;
    private String email_usuario;
    private String pass_usuario;
    private String perfilUsuario;

    public Usuarios() {
    }
    
    public Usuarios(int usuario_id, String nom_usuario, String apell_usuario, String email_usuario, String pass_usuario) {
        this.usuario_id = usuario_id;
        this.nom_usuario = nom_usuario;
        this.apell_usuario = apell_usuario;
        this.email_usuario = email_usuario;
        this.pass_usuario = pass_usuario;
    }

    public String getPerfilUsuario() {
        return perfilUsuario;
    }
    
    public int getUsuario_id() {
        return usuario_id;
    }

    public void setUsuario_id(int usuario_id) {
        this.usuario_id = usuario_id;
    }

    public void setPerfilUsuario(String perfilUsuario) {
        this.perfilUsuario = perfilUsuario;
    }

    
    public String getNom_usuario() {
        return nom_usuario;
    }

    public void setNom_usuario(String nom_usuario) {
        this.nom_usuario = nom_usuario;
    }

    public String getApell_usuario() {
        return apell_usuario;
    }

    public void setApell_usuario(String apell_usuario) {
        this.apell_usuario = apell_usuario;
    }

    public String getEmail_usuario() {
        return email_usuario;
    }

    public void setEmail_usuario(String email_usuario) {
        this.email_usuario = email_usuario;
    }

    public String getPass_usuario() {
        return pass_usuario;
    }

    public void setPass_usuario(String pass_usuario) {
        this.pass_usuario = pass_usuario;
    }

    @Override
    public String toString() {
        return "Usuarios{" + "nom_usuario=" + nom_usuario + ", apell_usuario=" + apell_usuario + ", email_usuario=" + email_usuario + ", pass_usuario=" + pass_usuario + ", perfilUsuario=" + perfilUsuario + '}';
    }
    
    
  
}
