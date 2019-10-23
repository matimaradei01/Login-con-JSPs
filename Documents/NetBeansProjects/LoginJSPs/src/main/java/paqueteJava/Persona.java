package paqueteJava;

public class Persona {

    private int id;
    private String user;
    private String pass;
    private String estado;

    public Persona(int id, String user, String pass, String estado) {
        this.id = id;
        this.user = user;
        this.pass = pass;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

}
