
package app.entity;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonFilter;
import cronapi.rest.security.CronappSecurity;
import cronapi.swagger.CronappSwagger;


/**
* Classe que representa a tabela TESTEINTE
* @generated
*/
@javax.persistence.Entity
@javax.persistence.Table(name = "\"TESTEINTE\"")
@XmlRootElement
@CronappSecurity
@JsonFilter("app.entity.TesteInte")
public class TesteInte implements Serializable {
    /**
    * UID da classe, necessário na serialização
    * @generated
    */
    private static final long serialVersionUID = 1L;

    /**
    * @generated
    */
    @Id
    @Column(name = "id", nullable = false, insertable=true, updatable=true)
        private java.lang.String id = UUID.randomUUID().toString().toUpperCase();


    /**
    * @generated
    */
    @Column(name = "name", nullable = true, unique = false, insertable=true, updatable=true)
        
        private java.lang.String name;


    /**
    * @generated
    */
    @Column(name = "attribute02", nullable = true, unique = false, insertable=true, updatable=true)
        
        private java.lang.String attribute02;


    /**
    * Construtor
    * @generated
    */
    public TesteInte(){
    }

    /**
    * Obtém id
    * return id
    * @generated
    */
    public java.lang.String getId() {
        return this.id;
    }

    /**
    * Define id
    * @param id id
    * @generated
    */
    public TesteInte setId(java.lang.String id) {
        this.id = id;
        return this;
    }
    /**
    * Obtém name
    * return name
    * @generated
    */
    public java.lang.String getName() {
        return this.name;
    }

    /**
    * Define name
    * @param name name
    * @generated
    */
    public TesteInte setName(java.lang.String name) {
        this.name = name;
        return this;
    }
    /**
    * Obtém attribute02
    * return attribute02
    * @generated
    */
    public java.lang.String getAttribute02() {
        return this.attribute02;
    }

    /**
    * Define attribute02
    * @param attribute02 attribute02
    * @generated
    */
    public TesteInte setAttribute02(java.lang.String attribute02) {
        this.attribute02 = attribute02;
        return this;
    }

    /**
    * @generated
    */
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
TesteInte object = (TesteInte)obj;
        if (id != null ? !id.equals(object.id) : object.id != null) return false;
        return true;
    }

    /**
    * @generated
    */
    @Override
    public int hashCode() {
        int result = 1;
        result = 31 * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

}